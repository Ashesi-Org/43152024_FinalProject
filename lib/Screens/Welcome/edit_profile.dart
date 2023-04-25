// ignore_for_file: unused_field, library_private_types_in_public_api, unused_local_variable

import 'package:final_project/Screens/Welcome/Components/editprofile_helper_functions.dart';
import 'package:final_project/Screens/Welcome/Components/viewprofile_helper_functions.dart';
import 'package:final_project/Screens/Welcome/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController yearGroupController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController campusResidenceStatusController =
      TextEditingController();
  TextEditingController favoriteFoodController = TextEditingController();
  TextEditingController favoriteMovieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> userData = viewProfile(
        Provider.of<UserProvider>(context, listen: false).userEmail);

    userData.then((value) {
      nameController.text = value['name'];
      studentIDController.text = value['id'];
      emailController.text = value['email'];
      usernameController.text = value['username'];
      dateOfBirthController.text = value['dob'];
      yearGroupController.text = value['yearGroup'];
      majorController.text = value['major'];
      campusResidenceStatusController.text = value['campusResidence'];
      favoriteFoodController.text = value['favouriteFood'];
      favoriteMovieController.text = value['favouriteMovie'];
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('EDIT PROFILE'),
          backgroundColor: Colors.black,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Copperplate Gothic Bold',
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/edit-profile.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    'assets/images/logo-3.png',
                    width: 150.0,
                    height: 100.0,
                  ),
                  const SizedBox(height: 5.0),

                  // Form

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 600,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1.0)),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Name
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                enabled: false,
                                controller: nameController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    labelText: 'Full Name:',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name.';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Student ID
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                enabled: false,
                                controller: studentIDController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.numbers),
                                    labelText: 'Student ID:',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your student ID.';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Email
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                enabled: false,
                                controller: emailController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    labelText: 'Email:',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email.';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Date of Birth
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: dateOfBirthController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_today),
                                    labelText: 'Date of Birth:',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                //Setting the input type to date
                                keyboardType: TextInputType.datetime,

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your date of birth.';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Year Group
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: yearGroupController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.dataset),
                                    labelText: 'Year Group:',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your year group.';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Major
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: majorController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.school),
                                    labelText: 'Major:',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your major.';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Campus Residence Status
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: campusResidenceStatusController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.house),
                                    labelText: 'Campus Residence Status:',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your campus residence status.';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Favorite Food
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: favoriteFoodController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.food_bank),
                                    labelText: 'Favorite Food:',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your favorite food.';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Favorite Movie
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: favoriteMovieController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.movie),
                                    labelText: 'Favorite Movie:',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your favorite movie.';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            // Username
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: usernameController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person_2),
                                    labelText: 'Username',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a username.';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            const SizedBox(height: 20.0),
                            // Sign Up Button
                            ElevatedButton(
                              onPressed: () {
                                updateProfile(
                                    context,
                                    emailController.text,
                                    dateOfBirthController.text,
                                    yearGroupController.text,  
                                    majorController.text,
                                    campusResidenceStatusController.text,  
                                    favoriteFoodController.text,
                                    favoriteMovieController.text,
                                    usernameController.text   
                                    );

                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  // Process the form data
                                  // ...
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
