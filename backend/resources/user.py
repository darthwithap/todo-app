from flask_restful import Resource

class User(Resource):
    def get(self):
        return {"message": "User class get"}
    def post(self):
        return {"message": "User class post"}