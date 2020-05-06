from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy

ma = Marshmallow()
db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'
    __table_args__ = tuple(db.UniqueConstraint('id', 'username', name='my_2uniq'))
    user_id = db.Column(db.String(), primary_key=True, unique=True)
    api_key = db.Column(db.String(), primary_key=True, unique=True)
    username = db.Column(db.String(100), unique=True)
    first_name = db.Column(db.String())
    last_name = db.Column(db.String())
    password = db.Column(db.String())
    email_address = db.Column(db.String())
    # creation_date = db.Column(db.TIMESTAMP, server_default=db.func.current_timestamp(), nullable=False)
    # category_id = db.Column(db.Integer, db.ForeignKey('categories.id', ondelete='CASCADE'), nullable=False)
    # category = db.relationship('Category', backref=db.backref('comments', lazy='dynamic' ))

    def __init__(self, user_id, api_key, username, first_name, last_name, email_address,password):
        self.user_id = user_id
        self.api_key = api_key
        self.username = username
        self.first_name = first_name
        self.last_name = last_name
        self.email_address = email_address  
        self.password = password

    def _repr_(self):
        return '<user_id {}>'.format(self.user_id)

    def serialize(self):
        return {
            'user_id': self.user_id,
            'api_key': self.api_key,
            'username': self.username,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'email_address': self.email_address,
            'password': self.password
        }
