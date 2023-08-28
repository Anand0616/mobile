import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/pages/desktop.dart';
import 'package:mobile/pages/layout.dart';
import 'package:mobile/pages/mobile.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title, required this.email});

  final String title;
  final String email;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final box = GetStorage();
  String storedEmail = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadStoredEmail();
  }

  void _loadStoredEmail() {
    setState(() {
      storedEmail = box.read('email') ??
          ''; // Get the email or use an empty string if not found.
    });
  }

  void _saveEmail(String email) {
    box.write('email', email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
                height: 300,
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                )),
            SizedBox(
              width: 300,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                              icon: Icon(Icons.mail)),
                          validator: (value) {
                            if (GetUtils.isEmail(emailController.text)) {
                              return null;
                            }
                            return 'Please enter your email';
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              icon: Icon(Icons.password)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              String email = emailController.text.trim();
                              _saveEmail(email);
                              _loadStoredEmail();
                              if (true) {
                                // _formKey.currentState!.validate()
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Layout(
                                            desktop: const Desktop(),
                                            mobile: const Mobile(),
                                          )
                                      // MainScreen(
                                      //   title: '',
                                      //   storedEmail: email,
                                      // ),
                                      ),
                                );
                              }
                              // else {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //         content: Text('Please fill input')),
                              //   );
                              // }
                            },
                            child: const Text('Log in'),
                          ),
                        ),
                      ),
                    ],
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
