import requests

url = 'http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/createGroup/'
myobj = {'userName': 'test', 'groupName': 'Cornell Tech2', 'groupDesc': 'for testing', 'members': ['test2', 'test5']}

x = requests.post(url, data = myobj)

print(x.text)