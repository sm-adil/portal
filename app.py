from flask import Flask, render_template, flash, redirect, url_for, session, request, logging

from flask_mysqldb import MySQL
from wtforms import Form, StringField, TextAreaField, PasswordField, validators
from passlib.hash import sha256_crypt
from functools import wraps

app = Flask(__name__)

# Config MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '1234567890'
app.config['MYSQL_DB'] = 'ccDB'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
# init MYSQL
mysql = MySQL(app)


# Index
@app.route('/')
def index():
    return render_template('home.html')


# About
@app.route('/about')
def about():
    return render_template('about.html')


# Posts
@app.route('/posts')
def posts():
    # Create cursor
    cur = mysql.connection.cursor()

    # Get posts
    result = cur.execute("SELECT * FROM posts")

    posts = cur.fetchall()

    if result > 0:
        return render_template('posts.html', posts=posts)
    else:
        msg = 'No Posts Found'
        return render_template('posts.html', msg=msg)
    # Close connection
    cur.close()


#Single Post
@app.route('/post/<string:id>')
def post(id):
    # Create cursor
    cur = mysql.connection.cursor()

    # Get article
    result = cur.execute("SELECT * FROM posts WHERE id = %s", [id])

    post = cur.fetchone()

    return render_template('post.html', post=post)


# Register Form Class
class RegisterForm(Form):
    username = StringField('Username', [validators.Length(min=4, max=25)])
    email = StringField('Email', [validators.Length(min=4, max=25)])
    password = PasswordField('Password', [
        validators.DataRequired(),
        validators.EqualTo('confirm', message='Passwords do not match')
    ])
    confirm = PasswordField('Confirm Password')


# User Register
@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegisterForm(request.form)
    if request.method == 'POST' and form.validate():
        username = form.username.data
        email = form.email.data
        password = sha256_crypt.encrypt(str(form.password.data))

        # Create cursor
        cur = mysql.connection.cursor()

        # Execute query
        cur.execute("INSERT INTO users(username, email, password) VALUES(%s, %s, %s)", (username, email, password))

        # Commit to DB
        mysql.connection.commit()

        # Close connection
        cur.close()

        flash('You are now registered and can log in', 'green')

        return redirect(url_for('login'))
    return render_template('register.html', form=form)


# User login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # Get Form Fields
        username = request.form['username']
        password_candidate = request.form['password']

        # Create cursor
        cur = mysql.connection.cursor()

        # Get user by username
        result = cur.execute("SELECT * FROM users WHERE username = %s", [username])

        if result > 0:
            # Get stored hash
            data = cur.fetchone()
            password = data['password']

            # Compare Passwords
            if sha256_crypt.verify(password_candidate, password):
                # Passed
                session['logged_in'] = True
                session['username'] = username

                flash('You are now logged in', 'green')
                return redirect(url_for('dashboard'))
            else:
                error = 'Invalid login'
                return render_template('login.html', error=error)
            # Close connection
            cur.close()
        else:
            error = 'Username not found'
            return render_template('login.html', error=error)

    return render_template('login.html')


# Check if user logged in
def is_logged_in(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            return f(*args, **kwargs)
        else:
            flash('Unauthorized, Please login', 'red')
            return redirect(url_for('login'))
    return wrap


# Logout
@app.route('/logout')
@is_logged_in
def logout():
    session.clear()
    flash('You are now logged out', 'green')
    return redirect(url_for('login'))


# Dashboard
@app.route('/dashboard')
@is_logged_in
def dashboard():
    # Create cursor
    cur = mysql.connection.cursor()

    # Get posts
    result = cur.execute("SELECT * FROM posts WHERE author = %s", [session['username']])

    posts = cur.fetchall()

    if result > 0:
        return render_template('dashboard.html', posts=posts)
    else:
        msg = 'No Posts Found'
        return render_template('dashboard.html', msg=msg)
    # Close connection
    cur.close()


# Posts Form Class
class PostForm(Form):
    title = StringField('Title', [validators.Length(min=1, max=200)])
    image_url = StringField('Image URL')
    body = TextAreaField('', [validators.Length(min=30)])

# Add Post
@app.route('/add_post', methods=['GET', 'POST'])
@is_logged_in
def add_post():
    form = PostForm(request.form)
    if request.method == 'POST' and form.validate():
        title = form.title.data
        image_url = form.image_url.data
        body = form.body.data

        # Create Cursor
        cur = mysql.connection.cursor()

        # Execute
        cur.execute("INSERT INTO posts(title, image_url, body, author) VALUES(%s, %s, %s, %s)",(title, image_url, body, session['username']))

        # Commit to DB
        mysql.connection.commit()

        #Close connection
        cur.close()

        flash('Post Created', 'green')

        return redirect(url_for('dashboard'))

    return render_template('add_post.html', form=form)


# Update Post
@app.route('/update_post/<string:id>', methods=['GET', 'POST'])
@is_logged_in
def update_post(id):
    # Create cursor
    cur = mysql.connection.cursor()

    # Get Post by id
    result = cur.execute("SELECT * FROM posts WHERE id = %s", [id])

    post = cur.fetchone()
    cur.close()
    # Get form
    form = PostForm(request.form)

    # Populate post form fields
    form.title.data = post['title']
    form.image_url.data = post['image_url']
    form.body.data = post['body']

    if request.method == 'POST' and form.validate():
        title = request.form['title']
        image_url = request.form['image_url']
        body = request.form['body']

        # Create Cursor
        cur = mysql.connection.cursor()
        app.logger.info(title)
        # Execute
        cur.execute ("UPDATE posts SET title=%s, image_url=%s, body=%s WHERE id=%s",(title, image_url, body, id))
        # Commit to DB
        mysql.connection.commit()

        #Close connection
        cur.close()

        flash('Post Updated', 'green')

        return redirect(url_for('dashboard'))

    return render_template('update_post.html', form=form)


# Delete Post
@app.route('/delete_post/<string:id>', methods=['POST'])
@is_logged_in
def delete_post(id):
    # Create cursor
    cur = mysql.connection.cursor()

    # Execute
    cur.execute("DELETE FROM posts WHERE id = %s", [id])

    # Commit to DB
    mysql.connection.commit()

    #Close connection
    cur.close()

    flash('Post Deleted', 'green')

    return redirect(url_for('dashboard'))

if __name__ == '__main__':
    app.secret_key='secret123'
app.run(debug=True)