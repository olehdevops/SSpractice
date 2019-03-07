import urllib.request, json 
with urllib.request.urlopen("https://api.opendota.com/api/heroes") as url:
    data = json.loads(url.read())#.decode())
    for i in data :
        print(i,"\n")
