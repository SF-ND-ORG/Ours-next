import MySQLdb
from flask import Flask, request, abort
import json
import os

if not os.path.exists("config.json"):
    print("File config.json does not exist! Creating now.....")
    fl_data={
        'mysql_server': '127.0.0.1',
        'mysql_user': 'root',
        'mysql_pass': 'your_passwd',
        'database_name': 'your_database_name',
        'mysql_port' : 'your_port'
    }
    fl=open("config.json","w")
    fl.write(json.dumps(fl_data))
    fl.close()
    print("Write successful. Please change the config inside it.")
    exit()
else:
    fl=open("config.json","r")
    cfg=json.loads(fl.read())

db = MySQLdb.connect(cfg['mysql_server'], cfg['mysql_user'], cfg['mysql_pass'], cfg['database_name'], charset='utf8',port=cfg['mysql_port'] ) 
cursor = db.cursor()
app = Flask(__name__)

@app.route('/dev/posts',methods = ['GET','POST'])
def posts():
    if request.method == "GET":
        pid = request.args.get("post_id")
        sql = "SELECT * FROM `blog_post` WHERE `post_id` = %s" % (pid)
        cursor.execute(sql)
        results = cursor.fetchall()
        if results == ():
            abort(404)
        post={}
        post['time'] = results[0][1].isoformat()
        post['author'] = results[0][2]
        post['text'] = results[0][3]
        pic_num = results[0][4]
        post['pics'] = str(results[0][5]).split("|",pic_num-1)
        return json.dumps(post, ensure_ascii=False)
    #if request.method == "POST":
        #data = json.loads(request.get_data())
        

app.run(host="0.0.0.0")
db.close()