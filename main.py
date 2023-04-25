import json
# import functions_framework
from flask import Flask, request, jsonify
from datetime import datetime

from flask_cors import CORS


import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore


firebase_admin.initialize_app()
db = firestore.client()


# @functions_framework.http
# def hello_http(request):
#     if request.method == 'POST' and request.path == '/profile':
#         return(create_profile())

#     elif request.method == 'POST' and request.path == '/election':
#         return(create_election())

#     elif request.method == 'GET' and request.path == '/voter':
#         voterID = request.args.get("ID")
#         return(query_records(voterID)) 

#     elif request.method == 'GET' and request.path == '/election':
#         electionID = request.args.get("Election_ID")
#         return(query_election(electionID)) 
        
#     elif request.method == 'DELETE' and "ID" in request.args:
#         voterID = request.args.get("ID")
#         return delete_record(voterID)

#     elif request.method == 'DELETE' and "Election_ID" in request.args:
#         return delete_election(request.args.get("Election_ID"))
    
#     elif request.method == 'PUT' and "ID" in request.args:
#         voterID = request.args.get("ID")
#         return update_record(voterID)

#     elif request.method == 'PATCH':
#         Election_ID,Candidate_ID = request.path.split("/")[-2:]
#         return vote(Election_ID,Candidate_ID)


app = Flask(__name__)
CORS(app, origins="*")


#Creating user profile
@app.route('/profile', methods=['POST'])
def create_profile():

    if not request.data:
        return jsonify({"Message": "Request failed"})

    record = json.loads(request.data)

    profile_ref = db.collection("profiles").document(record["email"])
    profile = profile_ref.get()

    if profile.exists:
        return jsonify({"Error": "A profile with the username you entered already exists"}), 409
    else:
        db.collection("profiles").document(record["email"]).set(record)
        return jsonify({"Message":"Profile created successfully"}), 200

#Updating a user's profile
@app.route('/profile/<email>', methods=['PATCH'])
def updateProfile(email):
    if not request.data:
            return jsonify({"Message": "Request failed"})

    record = json.loads(request.data)

    profile_ref = db.collection("profiles").document(email)
    profile = profile_ref.get()

    if not profile.exists:
            return jsonify({"Error": "Profile does not exist"}), 404
    else:
            db.collection("profiles").document(record["email"]).update(record)
            return jsonify({"Message": "Student profile updated successfully"}), 200
            

#Viewing User Profile Page
@app.route('/profile', methods=['GET'])
def viewProfile():
    email = request.args.get("email")
    profile_ref = db.collection("profiles").document(email)
    profile = profile_ref.get()
    if not profile:
        return jsonify({"error": "no such user"})
    print(profile.to_dict())
    return jsonify (profile.to_dict()), 200


#Creating a post
@app.route('/post', methods=['POST'])
def createPost():

    if not request.data:
        return jsonify({"Message": "Request failed"})

    record = json.loads(request.data)

    # adding current date and time to the post
    current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    record["created_at"] = current_time

    #Setting the post id to timestamp
    post = db.collection("posts").document(current_time)

    post.set(record)

    return jsonify({"Message":"Post created successfully"}), 200

 
#Viewing feed page
@app.route('/feed', methods=['GET'])
def get_feed():

    #get all the posts in the "posts" database and order them based on the time created
    posts_ref = db.collection("posts")
    posts = [post.to_dict() for post in posts_ref.order_by("created_at", direction=firestore.Query.DESCENDING).stream()]

    if len(posts) == 0:
        return jsonify({"Message": "No posts found"}), 404

    return jsonify ({"Posts": posts}), 200


#Logging in to user account
profile_ref = db.collection('profiles')
@app.route('/login', methods=['POST'])
def userLogin():
    login_cred = json.loads(request.data)
    email = login_cred['email']
    password = login_cred['password']

    docs = profile_ref.where(u'email', u'==', email).stream()
   
    for doc in docs:
        userEmail = doc.to_dict()['email']
        if doc.to_dict()['password'] == password:
            return jsonify({'success': 'login successful',
                            'email':userEmail}), 200
        else:
            return jsonify({'error': 'incorrect password or email'}), 400
    return jsonify({'error': 'student does not exist'}), 400

if __name__ == "__main__":
    app.run()
