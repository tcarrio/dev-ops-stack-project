
### dosr-web

It's based on the Flask microframework and hooks into the database using the psyconpg2 module for Python. 

The Python modules can be installed using the "requirements.txt" file using the command:

`pip install -r requirements.txt`

The service is best run by creating a `virtualenv` folder to isolate Python modules from a global installation. The `wsgi.py` file utilizes Gunicorn, a WSGI compliant HTTP server, and is accessible via a Unix socket saved to the running directory. The systemd unit file allows the web app to be handled by Ubuntu's service system. Nginx is configured as a reverse proxy to serve HTTP traffic on port 80, passing communication to the Unix socket. 
