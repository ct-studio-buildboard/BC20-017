import requests

url = 'http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/getNotification/test2/'

x = requests.get(url)

print(x.text)