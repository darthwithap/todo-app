from flask_restful import Resource 
from flask import request
from models import User, db
from binascii import hexlify
import os

class Register(Resource):
    def get(self):
        users = User.query.all()
        user_list = []
        for user in users:
            user_list.append(User.serialize(user))
        return {"status" : "success", "data" : user_list}, 200

    def post(self):
        json_data = request.get_json(force=True)
        if not json_data:
               return {'message': 'No input data provided'}, 400    

        # validate and deserialize input
        # data, errs = User.load(json_data)
        # if errs:
        #     return errs, 422

        # check if username and email_address already exists
        user = User.query.filter_by(username=json_data['username']).first()
        if user:
            return {'message': 'username not available'}, 400
        user = User.query.filter_by(email_address=json_data['email_address']).first()
        if user:
            return {'message': 'email address already exists'}, 400
        # create api_key and user_id for user
        user_id = hexlify(os.urandom(3)).decode()
        user_id = 'uid_' + user_id    
        user = User.query.filter_by(user_id=user_id).first()
        if user:
            return {'message': 'user id generation error'}, 400
        api_key = hexlify(os.urandom(8)).decode()
        user = User.query.filter_by(api_key=api_key).first()
        if user:
            return {'message': 'api key generation error'}, 400

        # add user to database
        user = User(
            user_id=user_id,
            api_key=api_key,
            username=json_data['username'],
            first_name=json_data['first_name'],
            last_name=json_data['last_name'],
            email_address=json_data['email_address'],
            password=json_data['password']
            )

        db.session.add(user)
        db.session.commit()
        result = User.serialize(user)

        return {
             "status": 'success',
              'data': result
               }, 201