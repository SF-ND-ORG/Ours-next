import logging
import mysql.connector
import azure.functions as func
import json


def main(req: func.HttpRequest) -> func.HttpResponse:
    try:
        rand = int(req.params.get('rand'))
        try:
            limit = int(req.params.get("limit"))
            sql = "SELECT * FROM blog_post ORDER BY RAND() LIMIT %d" % (limit)
        except:
            sql = "SELECT * FROM blog_post ORDER BY RAND() LIMIT 10"
    except:
        try:
            page = int(req.params.get('page'))
            limit = int(req.params.get("limit"))
            sql = "SELECT * FROM blog_post LIMIT %d OFFSET %d" % (limit,limit*page)
        except:
            return func.HttpResponse(status_code=405)
    cnx = mysql.connector.connect(user="YOUR-UserName", password="YOUR-Password", host="YOUR-Server", port=3306, database="YOUR-Database")
    cursor = cnx.cursor()
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
    except:
        return func.HttpResponse(status_code=500)
    if results == ():
        return func.HttpResponse(status_code=404)
    res = []
    for item in results:
        post = {}
        post['id'] = item[5]
        post['time'] = item[0].isoformat()
        post['author'] = item[1].decode('utf-8')
        text = item[2].decode('utf-8')
        if len(text) > 233:
            post['summary'] = text[:233]+"……"
        else:
            post['summary'] = text
        pic_num = item[3]
        if pic_num:
            post['pics'] = str(item[4].decode('utf-8')).split("|",pic_num-1)
        else:
            post['pics'] = [] 
        res.append(post)
    return func.HttpResponse(json.dumps(res, ensure_ascii=False, indent=4, separators=(',', ': ')))
