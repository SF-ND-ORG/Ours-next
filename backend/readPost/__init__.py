import logging
import mysql.connector
import azure.functions as func
import json


def main(req: func.HttpRequest) -> func.HttpResponse:
    id = req.params.get('id')
    if not id:
        return func.HttpResponse(status_code=405)
    cnx = mysql.connector.connect(user="YOUR-UserName", password="YOUR-Password", host="YOUR-Server", port=3306, database="YOUR-Database")
    cursor = cnx.cursor()
    sql = "SELECT * FROM `blog_post` WHERE `post_id` = %s" % (id)
    try:
        cursor.execute(sql)
        result = cursor.fetchall()
    except:
        return func.HttpResponse(status_code=500)
    if result == ():
        return func.HttpResponse(status_code=404)
    post={}
    post['success'] = True
    post['time'] = result[0][0].isoformat()
    post['author'] = result[0][1].decode('utf-8')
    post['text'] = result[0][2].decode('utf-8')
    pic_num = result[0][3]
    if pic_num:
        post['pics'] = str(result[0][4].decode('utf-8')).split("|",pic_num-1)
    else:
        post['pics'] = [] 
    return func.HttpResponse(json.dumps(post, ensure_ascii=False, indent=4, separators=(',', ': ')))
    