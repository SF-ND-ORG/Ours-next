from flask import Flask, render_template, request, Response, jsonify
import MySQLdb
from flask_cors import CORS
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
cors = CORS()
cors.init_app(app=app, resources={r"/*": {"origins": "*"}})


@app.route('/dev/posts/<post_id>', methods=['GET'])
def GetPost(post_id):
    sql = "SELECT * FROM `blog_post` WHERE `post_id` = %s" % (post_id)
    cursor.execute(sql)
    db.commit()
    results = cursor.fetchall()
    if results == ():
        abort(404)
    res = {}
    res['time'] = results[0][1].isoformat()
    res['author'] = results[0][2]
    res['content'] = results[0][3]
    res = results[0][4]
    res['pics'] = str(results[0][5]).split("|", pic_num-1)
    return Response(json.dumps(res, ensure_ascii=False), mimetype='application/json')


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
        if len(item[3]) > 233:
            post['summary'] = item[3][:233]+"……"
        else:
            post['summary'] = item[3]
        pic_num = item[4]
        post['pics'] = str(item[5]).split("|", pic_num-1)
        res.append(post)
    return Response(json.dumps(res, ensure_ascii=False), mimetype='application/json')


app.run(host="0.0.0.0")
db.close()
