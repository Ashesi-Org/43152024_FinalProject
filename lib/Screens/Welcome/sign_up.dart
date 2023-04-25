// ignore_for_file: unused_field

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:final_project/Screens/Welcome/Components/signup_helper_functions.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _studentID = '';
  String _fullName = '';
  String _email = '';
  String _dateOfBirth = '';
  String _yearGroup = '';
  String _major = '';
  String _campusResidenceStatus = '';
  String _favoriteFood = '';
  String _favoriteMovie = '';
  String _username = '';
  String _password = '';
  String _confirmPassword = '';

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _studentIDController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _yearGroupController = TextEditingController();
  TextEditingController _majorController = TextEditingController();
  TextEditingController _campusResidenceStatusController =
      TextEditingController();
  TextEditingController _favoriteFoodController = TextEditingController();
  TextEditingController _favoriteMovieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SIGN UP'),
          backgroundColor: Colors.transparent,
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
              image: AssetImage("assets/images/signup-background.jpg"),
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
                                controller: _fullNameController,
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
                                onSaved: (value) {
                                  _fullName = value!;
                                },
                              ),
                            ),

                            // Student ID
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _studentIDController,
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
                                onSaved: (value) {
                                  _studentID = value!;
                                },
                              ),
                            ),

                            // Email
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _emailController,
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
                                onSaved: (value) {
                                  _email = value!;
                                },
                              ),
                            ),

                            // Date of Birth
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _dateOfBirthController,
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
                                onSaved: (value) {
                                  _dateOfBirth = value!;
                                },
                              ),
                            ),

                            // Year Group
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _yearGroupController,
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
                                onSaved: (value) {
                                  _yearGroup = value!;
                                },
                              ),
                            ),

                            // Major
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _majorController,
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
                                onSaved: (value) {
                                  _major = value!;
                                },
                              ),
                            ),

                            // Campus Residence Status
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _campusResidenceStatusController,
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
                                onSaved: (value) {
                                  _campusResidenceStatus = value!;
                                },
                              ),
                            ),

                            // Favorite Food
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _favoriteFoodController,
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
                                onSaved: (value) {
                                  _favoriteFood = value!;
                                },
                              ),
                            ),

                            // Favorite Movie
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _favoriteMovieController,
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
                                onSaved: (value) {
                                  _favoriteMovie = value!;
                                },
                              ),
                            ),

                            // Username
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _usernameController,
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
                                onSaved: (value) {
                                  _username = value!;
                                },
                              ),
                            ),

                            // Password
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.password),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a password.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _password = value!;
                                },
                              ),
                            ),

                            // Confirm Password
                            SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _confirmPasswordController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.password),
                                    labelText: 'Confirm Password',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please confirm your password.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _confirmPassword = value!;
                                },
                              ),
                            ),

                            const SizedBox(height: 20.0),
                            // Sign Up Button
                            ElevatedButton(
                              onPressed: () {
                                createUser(
                                    context,
                                    _fullNameController.text,
                                    _emailController.text,
                                    _studentIDController.text,
                                    _dateOfBirthController.text,
                                    _yearGroupController.text,
                                    _majorController.text,
                                    _campusResidenceStatusController.text,
                                    _favoriteFoodController.text,
                                    _favoriteMovieController.text,
                                    _usernameController.text,
                                    _passwordController.text,
                                    _confirmPasswordController.text
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
                              child: const Text('Sign Up'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('Already have an account?'),
                                TextButton(
                                  onPressed: () {                                
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()),
                                    );
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 51, 120, 240)),
                                  ),
                                ),
                              ],
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
