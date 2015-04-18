__author__ = 'Xin Huang'
import json

import requests

url_login = 'http://127.0.0.1:5000/login'
url_data = 'http://127.0.0.1:5000/api/security_user'
headers = {'Content-Type': 'application/json'}

# add security user
# data = dict(email='hca01@pcos.org.au', password='1', name='Registered Clinician 1', role='ROLE_CLINICIAN')
# response = requests.post(url, data=json.dumps(data), headers=headers)
# assert response.status_code == 201

# login security user
with requests.Session() as s:
    data = dict(email='hca01@pcos.org.au')
    login_response = s.post(url_login, data=json.dumps(data), headers=headers)
    assert login_response.status_code == 200

    response = s.get(url_data)
    assert response.status_code == 200
    print response.json()

    response = s.get(url_data + '/1')
    assert response.status_code == 200
    print response.json()

    filters = [dict(name='name', op='like', val='%y%')]
    params = dict(q=json.dumps(dict(filters=filters)))
    response = s.get(url_data, params=params)
    assert response.status_code == 200
    print response.json()