import requests

url = 'http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/acceptInvitation/'
myobj = {'userName': 'test2', 'groupName': 'Cornell Tech2'}

x = requests.post(url, data = myobj)

print(x.text)