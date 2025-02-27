import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> login(String email, String password) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If login successful, navigate to home screen
      Navigator.pushReplacementNamed(context, '/');
    } on FirebaseAuthException catch (e) {
      // Handle login errors
      setState(() {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          errorMessage = 'Wrong email or password. Please try again.';
        } else {
          errorMessage = 'An error occurred. Please try again.';
        }
      });
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 35, top: 130),
            child: Text(
              'Welcome\nBack',
              style: TextStyle(color: Colors.orange, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        if (errorMessage.isNotEmpty)
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              errorMessage,
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            ),
                          ),
                        TextField(
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: Colors.black,
                            filled: true,
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: passwordController,
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.black,
                            filled: true,
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.orange,
                              child: IconButton(
                                color: Colors.black,
                                onPressed: () {
                                  setState(() {
                                    errorMessage = '';
                                  });
                                  login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                },
                                icon: Icon(Icons.arrow_forward),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'register');
                              },
                              child: Text(
                                'Sign Up',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.orange,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.orange,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
