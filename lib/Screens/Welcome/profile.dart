// ignore_for_file: unused_import, unused_field, unused_local_variable

import 'package:final_project/Screens/Welcome/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Screens/Welcome/edit_profile.dart';
import 'package:final_project/Screens/Welcome/create_post.dart';
import 'package:final_project/Screens/Welcome/view_profile.dart';
import 'package:final_project/Screens/Welcome/Components/viewprofile_helper_functions.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

TextEditingController searchController = TextEditingController();
TextEditingController emailController = TextEditingController();

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String email = '';
  String username = '';
  String id = '';
  String dob = '';
  String major = '';
  String yearGroup = '';
  String campusResidence = '';
  String favouriteFood = '';
  String favouriteMovie = '';
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: viewProfile(Provider.of<UserProvider>(context, listen: false).userEmail),

        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return (Text("Error: ${snapshot.error}"));
          } else {
            name = snapshot.data!['name'] ?? 'N/A';
            email = snapshot.data!['email'] ?? 'N/A';
            id = snapshot.data!['id'] ?? 'N/A';
            username = snapshot.data!['username'] ?? 'N/A';
            dob = snapshot.data!['dob'] ?? 'N/A';
            major = snapshot.data!['major'] ?? 'N/A';
            yearGroup = snapshot.data!['yearGroup'] ?? 'N/A';
            campusResidence = snapshot.data!['campusResidence'] ?? 'N/A';
            favouriteFood = snapshot.data!['favouriteFood'] ?? 'N/A';
            favouriteMovie = snapshot.data!['favouriteMovie'] ?? 'N/A';
          }
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ViewProfilePage()),
                    )
                  },
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // Navigate to create post page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreatePostPage()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // Navigate to notifications page
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.message),
                  onPressed: () {
                    // Navigate to messages page
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    // Navigate to the edit profile page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfilePage()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Navigate to settings page
                  },
                ),
              ],
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 70.0,
                          backgroundImage:
                              AssetImage("assets/images/profile-picture.png"),
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: $name',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Email: $email',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Student ID: $id',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Username: $username',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Date of Birth: $dob',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Major: $major',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Year Group: $yearGroup',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Campus Residence: $campusResidence',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Favourite Movie: $favouriteMovie',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Favourite Food: $favouriteFood',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
