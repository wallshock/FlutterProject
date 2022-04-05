import 'package:flutter/material.dart';
import 'package:thirtysevenhours/routes/routes.dart';
import 'package:thirtysevenhours/services/auth_service.dart';
import 'package:thirtysevenhours/views/login.dart';
import 'package:thirtysevenhours/views/notesView.dart';
import 'package:thirtysevenhours/views/register.dart';
import 'package:thirtysevenhours/views/verifiedemail.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          LoginRoute: (context) => const LoginView(),
          RegisterRoute: (context) => const RegisterView(),
          NotesRoute: (context) => const NotesView(),
          VerifyEmailRoute: (context) => const VerifyEmailView(),
        });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthService.firebase().currentUser;
              if (user != null) {
                if (user.isEmailVerified) {
                  return const NotesView();
                } else {
                  return const VerifyEmailView();
                }
              } else {
                return const LoginView();
              }

              return const Text("Done");
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
