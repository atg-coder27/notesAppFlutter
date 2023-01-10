import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as devtools;
import 'package:notesapp/routes/constants.dart';
import 'package:notesapp/services/auth/auth_exceptions.dart';
import 'package:notesapp/services/auth/auth_service.dart';
import 'package:notesapp/utilities/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Enter your email"),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: "Enter your password"),
          ),
          TextButton(
            onPressed: (() async {
              final email = _email.text;
              final password = _password.text;
              try {
                final userCredential = await AuthService.firebase()
                    .createUser(email: email, password: password);

                final user = AuthService.firebase().currentUser;

                await AuthService.firebase().sendEmailVerification();
                Navigator.of(context).pushNamed(verifyEmailRoute);
                devtools.log(userCredential.toString());
              } on WeakPasswordException {
                await showErrorDialog(context, "Weak Password");
              } on EmailAlreadyInUseAuthException {
                await showErrorDialog(context, "Email already in use");
              } on InvalidEmailAuthException {
                await showErrorDialog(context, "Invalid Email");
              } on GenericAuthException {
                await showErrorDialog(context, "Error : Auth Exception");
              } catch (e) {
                await showErrorDialog(context, "Error :${e.toString()}");
              }
            }),
            child: const Text("Register"),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text("Already registered? Login Here"))
        ],
      ),
    );
  }
}
