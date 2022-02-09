import logging
import mysql.connector
import azure.functions as func
import json

def main(req: func.HttpRequest) -> func.HttpResponse:
    try:
        post = req.get_json()
    except ValueError:
        return func.HttpResponse(status_code=405)
    pic_num = len(post['pics'])
    pics = ""
    for pic in post['pics']:
        pics = pics + pic + "|"
    if pic_num:
        pics = pics[:-1]
    sql = "INSERT INTO blog_post (author, text, pic_num, pics) VALUES (%s, %s, %s, %s)"
    val = (post['author'], post['text'], pic_num, pics)
    cnx = mysql.connector.connect(user="YOUR-UserName", password="YOUR-Password", host="YOUR-Server", port=3306, database="YOUR-Database")
    cursor = cnx.cursor()
    try:
        cursor.execute(sql, val)
        cnx.commit()
    except:
        return func.HttpResponse(status_code=500)
    if "x-forwarded-for" in req.headers:
        source_ip = req.headers["x-forwarded-for"].split(':')[0]
    else:
        source_ip = "127.0.0.1"
    logging.info(source_ip + " "+ post['author'])
    return func.HttpResponse(json.dumps({'success':True,'post_id':cursor.lastrowid}, indent=4, separators=(',', ': ')),status_code=200)