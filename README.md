# Portal
A simple flask blog application.

## File structure
    
    └── /                                       # root
        ├── app.py                              # main python file
        └── templates                           # html templates
               ├── includes                     # include html templates
               │      ├── _formhelpers.html     # form helpers
               │      ├── _messages.html        # form messages
               │      └── _navbar.html          # navbar layout
               ├── about.html                   # about page
               ├── add_post.html                # create new post
               ├── dashboard.html               # user dashboard
               ├── home.html                    # home page
               ├── layout.html                  # main layout
               ├── login.html                   # login page
               ├── post.html                    # read single post page
               ├── posts.html                   # read multiple posts page
               ├── register.html                # new user registration page
               └── update_post.html             # update post page
               
### Installing
Install the necessary packages by running the following command.
```
pip install -r requirements.txt
```

### Run the app
Test the app by running the following command.
```
python app.py
```

### Now check your app in browser, head over to following URL
```
http://127.0.0.1:5000
```

### Happy hacking!
