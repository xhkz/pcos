__author__ = 'Xin Huang'
import json

import requests


url = 'http://127.0.0.1:5000/api/security_user'
headers = {'Content-Type': 'application/json'}

data = dict(email='hca01@pcos.org.au', password='1', name='Registered Clinician 1', role='ROLE_CLINICIAN')
response = requests.post(url, data=json.dumps(data), headers=headers)
assert response.status_code == 201

response = requests.get(url, headers=headers)
assert response.status_code == 200
print(response.json())

response = requests.get(url + '/1', headers=headers)
assert response.status_code == 200
print(response.json())

filters = [dict(name='name', op='like', val='%y%')]
params = dict(q=json.dumps(dict(filters=filters)))
response = requests.get(url, params=params, headers=headers)
assert response.status_code == 200
print(response.json())
