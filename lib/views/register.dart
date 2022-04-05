import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thirtysevenhours/routes/routes.dart';
import 'package:thirtysevenhours/utilities/errorDialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Register Panel"))),
      body: Column(
        children: [
          TextField(
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            controller: _email,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
          TextField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            controller: _password,
            decoration: const InputDecoration(
              hintText: 'Enter your password',
            ),
          ),
          TextButton(
            onPressed: () async {
              try {
                final email = _email.text;
                final password = _password.text;
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email, password: password);
                Navigator.of(context).pushNamed(VerifyEmailRoute);
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  await showErrorDialog(context, 'Error: Weak Password');
                } else if (e.code == 'email-already-in-use') {
                  await showErrorDialog(
                      context, 'Error: Email is already in use');
                } else if (e.code == 'invalid-email') {
                  await showErrorDialog(context, 'Error: Invalid Email');
                } else {
                  await showErrorDialog(context, 'Error: ${e.code}');
                }
              }
            },
            child: const Text('Register'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginRoute,
                  (route) => false,
                );
              },
              child: const Text("Already Registered? Log In"))
        ],
      ),
    );
  }
}
