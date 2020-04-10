import requests

url = 'http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/getGroup/Cornell Tech/'

x = requests.get(url)

print(x.text)