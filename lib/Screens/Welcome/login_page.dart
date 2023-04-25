// ignore_for_file: unused_field, unused_import, duplicate_ignore

import 'package:final_project/Screens/Welcome/sign_up.dart';
// ignore: unused_import
import 'package:final_project/Screens/Welcome/profile.dart';
import 'package:flutter/material.dart';

import 'Components/login_helper_functions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LOG IN'),
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
              image: AssetImage("assets/images/login-background.jpg"),
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
                      width: 550,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1.0)),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
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

                            // Forgot Password
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 51, 120, 240)),
                              ),
                            ),

                            const SizedBox(height: 20.0),
                            //Log In Button
                            ElevatedButton(
                              onPressed: () {
                                userLogin(context, _emailController.text,
                                    _passwordController.text);

                                if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                  }
                              },
                              
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                              child: const Text('Log In'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text("Don't have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()),
                                    );
                                  },
                                  child: const Text(
                                    'Sign Up',
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
