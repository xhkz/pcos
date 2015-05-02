from flask import request, jsonify
from flask.ext.login import login_user

from pcos import app, SecurityUser


@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data['email']
    matches = SecurityUser.query.filter_by(email=email).all()
    if len(matches) > 0:
        user = matches[0]
        login_user(user)
        return jsonify({"result": "success", "name": user.name})

    return jsonify({"result": "fail"})