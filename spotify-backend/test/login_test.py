import requests

url = 'http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/login/'
myobj = {'userName': 'test5'}

x = requests.post(url, data = myobj)

print(x.text)