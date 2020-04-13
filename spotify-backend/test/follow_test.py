import requests

url = 'http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/follow/'
myobj = {'userInfo': 'test', 'followingUserInfo': 'test3'}

x = requests.post(url, data = myobj)

print(x.text)