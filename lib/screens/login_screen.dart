// import 'package:flutter/material.dart';
// import 'package:globalchat/controllers/login_controller.dart';
// import 'package:globalchat/screens/signup_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final userForm = GlobalKey<FormState>();
//   bool isLoading = false;
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Spacer(), // Space at the top to center the content
//             Form(
//               key: userForm,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 100,
//                     width: 100,
//                     child: Image.asset("assets/images/logo.png"),
//                   ),
//                   SizedBox(height: 30),
//                   TextFormField(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     controller: email,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Email is required';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(label: Text('Email')),
//                   ),
//                   SizedBox(height: 30),
//                   TextFormField(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     controller: password,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Password is required';
//                       }
//                       return null;
//                     },
//                     obscureText: true,
//                     enableSuggestions: false,
//                     autocorrect: false,
//                     decoration: InputDecoration(label: Text('Password')),
//                   ),
//                   SizedBox(height: 30),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(0, 50),
//                       foregroundColor: Colors.white,
//                       backgroundColor: Colors.deepPurpleAccent,
//                     ),
//                     onPressed: () async {
//                       if (userForm.currentState!.validate()) {
//                         setState(() => isLoading = true);
//                         await LoginController.login(
//                           context: context,
//                           email: email.text,
//                           password: password.text,
//                         );
//                         setState(() => isLoading = false);
//                       }
//                     },
//                     child: isLoading
//                         ? CircularProgressIndicator(color: Colors.white)
//                         : Text('Login'),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Don't have an account?"),
//                       SizedBox(width: 10),
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SignupScreen(),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           "Signup here",
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(), // Space at the bottom to push copyright down
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "© 2024 Jerry O.",
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[700],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:globalchat/controllers/login_controller.dart';
import 'package:globalchat/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userForm = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Main content with flex: 9
            Expanded(
              flex: 9,
              child: Form(
                key: userForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(label: Text('Email')),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      obscureText: true,
                      autocorrect: false,
                      decoration: InputDecoration(label: Text('Password')),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 50),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.deepPurpleAccent,
                            ),
                            onPressed: () async {
                              if (userForm.currentState!.validate()) {
                                setState(() => isLoading = true);
                                await LoginController.login(
                                  context: context,
                                  email: email.text,
                                  password: password.text,
                                );
                                setState(() => isLoading = false);
                              }
                            },
                            child: isLoading
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  )
                                : Text('Login'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Signup here",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Footer with flex: 1 to hold the copyright notice
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "© 2024 Jerry O.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
