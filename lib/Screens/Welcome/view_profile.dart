// ignore_for_file: unused_import, unused_field

import 'package:flutter/material.dart';
import 'package:final_project/Screens/Welcome/edit_profile.dart';
import 'package:final_project/Screens/Welcome/create_post.dart';
import 'package:final_project/Screens/Welcome/profile.dart';
import 'package:final_project/Screens/Welcome/Components/viewprofile_helper_functions.dart';

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ViewProfilePageState createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  // final _formKey = GlobalKey<FormState>();

  String namee = '';
  String email = '';
  String dob = '';
  String studentID = '';
  String yearGroup = '';
  String major = '';
  String campusResidence = '';
  String favoriteFood = '';
  String favoriteMovie = '';

  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> profile = viewProfile(searchController.text);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/images/logo.jpg'),
        title: Container(
          height: 36.0,
          width: 900,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
              icon: Icon(Icons.search),
            ),
            onSubmitted: (value) => {
              searchController.text = value,
              Navigator.pushNamed(context, '/search')
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<Map<String, dynamic>>(
                future: profile,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // namee = snapshot.data!['name'];
                    email = snapshot.data!['email'];
                    dob = snapshot.data!['dob'];
                    studentID = snapshot.data!['studentID'];
                    yearGroup = snapshot.data!['yearGroup'];
                    major = snapshot.data!['major'];
                    favoriteFood = snapshot.data!['favoriteFood'];
                    favoriteMovie = snapshot.data!['favoriteMovie'];

                    return Column(
                      children: [
                        const CircleAvatar(
                          radius: 70.0,
                          backgroundImage:
                              AssetImage("assets/images/profile-picture.png"),
                        ),
                        const SizedBox(width: 16.0),
                        Container(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Name:',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Email:$email',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Student ID:$studentID',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Date of Birth:$dob',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Year Group:$yearGroup',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Major:$major',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Campus Residence Status:$campusResidence',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Favorite Food:$favoriteFood',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Favorite Movie:$favoriteMovie',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("ERROR");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  // );
}
// }