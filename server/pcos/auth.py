__author__ = 'Xin Huang'
from flask.ext.restless import ProcessingException
from flask.ext.login import LoginManager, current_user

from pcos.model import SecurityUser


login_manager = LoginManager()


@login_manager.user_loader
def load_user(userid):
    return SecurityUser.query.get(userid)


def check_auth(**kw):
    if not current_user.is_authenticated():
        raise ProcessingException(description='Not Authorized', code=401)
