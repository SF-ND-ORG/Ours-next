import MySQLdb
from flask import Flask, request, abort
import json
import os

if not os.path.exists("./config.json"):
    print("File config.json does not exist! Creating now.....")
    fl_data = {
        'mysql_server': '127.0.0.1',
        'mysql_user': 'root',
        'mysql_pass': 'your_passwd',
        'database_name': 'your_database_name',
        'mysql_port': 'your_port'
    }
    fl = open("./config.json", "w")
    fl.write(json.dumps(fl_data))
    fl.close()
    print("Write successful. Please change the config inside it.")
    exit()
else:
    fl = open("./config.json", "r")
    cfg = json.loads(fl.read())

db = MySQLdb.connect(cfg['mysql_server'], cfg['mysql_user'], cfg['mysql_pass'],
                     cfg['database_name'], charset='utf8', port=int(cfg['mysql_port']))
cursor = db.cursor()
app = Flask(__name__)


@app.route('/dev/posts/<post_id>', methods=['GET'])
def GetPost(post_id):
    sql = "SELECT * FROM `blog_post` WHERE `post_id` = %s" % (post_id)
    cursor.execute(sql)
    db.commit()
    results = cursor.fetchall()
    if results == ():
        abort(404)
    post = {}
    post['time'] = results[0][1].isoformat()
    post['author'] = results[0][2]
    post['content'] = results[0][3]
    pic_num = results[0][4]
    post['pics'] = str(results[0][5]).split("|", pic_num-1)
    return json.dumps(post, ensure_ascii=False)


@app.route('/dev/posts/', methods=['GET'])
def GetPostsList():
    limit = request.args.get("limit")
    if limit is not None:
        sql = "SELECT * FROM blog_post ORDER BY RAND() LIMIT %s;" % (limit)
    else:
        sql = "SELECT * FROM blog_post ORDER BY RAND() LIMIT 10;"
    cursor.execute(sql)
    db.commit()
    results = cursor.fetchall()
    if results == ():
        abort(404)
    res = []
    for item in results:
        post = {}
        post['time'] = item[1].isoformat()
        post['author'] = item[2]
        if len(item[3]) > 40:
            post['summary'] = item[3][:40]+"……"
        else:
            post['summary'] = item[3]
        pic_num = item[4]
        post['pics'] = str(item[5]).split("|", pic_num-1)
        res.append(post)
    return json.dumps(res, ensure_ascii=False)


app.run(host="0.0.0.0")
db.close()
