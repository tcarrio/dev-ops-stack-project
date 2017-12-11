from flask import Flask
from flask import render_template
from flask import redirect
from flask import url_for
from flask import request
import psycopg2
from db_conn import conn_str

app = Flask(__name__,static_url_path="/static")
db = psycopg2.connect(conn_str)
cur = db.cursor()

@app.route("/")
def root():
    global _session
    return redirect(url_for('home'))

@app.route("/home")
def home():
    l = db_get_links()
    w = db_get_welcome()
    s = db_get_specifications()
    f = db_get_features()
    a = db_get_admins()

    return render_template('home.html',links=l,welcome=w,spec=s,features=f,admins=a)

def db_get_links():
    global cur
    links = []
    cur.execute("SELECT * FROM Links ORDER BY ID;")
    for row in cur.fetchall():
        l = {}
        l['title']=row[1]
        l['url']=row[2]
        links.append(l)
    return links

def db_get_welcome():
    global cur
    cur.execute("SELECT * FROM Welcome LIMIT 1;")
    row = cur.fetchone()
    return {
        'title':row[0],
        'subtitle':row[1],
        'link':row[2]
    }

def db_get_specifications():
    global cur
    cur.execute("SELECT * FROM Specifications LIMIT 1;")
    row = cur.fetchone()
    return {
        'title':row[0],
        'description':row[1],
        'link1':row[2],
        'link1_title':row[3],
        'link2':row[4],
        'link2_title':row[5],
        'link3':row[6],
        'link3_title':row[7]
    }

def db_get_features():
    global cur
    feat = []
    cur.execute("SELECT * FROM Features ORDER BY ID;")
    for row in cur.fetchall():
        f = {}
        f['title']=row[1]
        f['description']=row[2]
        f['icon']=row[3]
        feat.append(f)
    return feat

def db_get_admins():
    global cur
    admins=[]
    cur.execute("SELECT * FROM SysAdmins ORDER BY ID;")
    for row in cur.fetchall():
        a={}
        a['name']=row[1]
        a['description']=row[2]
        a['image']=row[3]
        a['url']=row[4]
        admins.append(a)
    return admins
