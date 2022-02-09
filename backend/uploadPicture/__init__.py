import logging
import azure.functions as func
import os
import imghdr
import time
import json
from azure.storage.blob import BlobServiceClient


conn_string = os.getenv("CUSTOMCONNSTR_blob")
blob_service_client = BlobServiceClient.from_connection_string(conn_string)
container_client = blob_service_client.get_container_client("$web")

def main(req: func.HttpRequest) -> func.HttpResponse:
    try:
        pic = req.get_body()
    except ValueError:
        return func.HttpResponse(status_code=405)
    else:
        name = str(int(time.time()*1000))+"."+imghdr.what(None,pic)
    if "x-forwarded-for" in req.headers:
        source_ip = req.headers["x-forwarded-for"].split(':')[0]
    if pic:
        blob_client = container_client.get_blob_client(name)
        blob_client.upload_blob(pic, blob_type="BlockBlob")
        logging.info(source_ip + " " + name)
        ret = {}
        ret['success'] = True
        ret['link'] = "https://pic.api.sfnd.nl/"+name
        return func.HttpResponse(json.dumps(ret, ensure_ascii=False, indent=4, separators=(',', ': ')))
    else:
        return func.HttpResponse(status_code=400)
