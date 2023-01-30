import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../global/global.dart';

import '../main_screens/home_screen.dart';

import '../../widgets/custom_text_field.dart';
import '../../widgets/error_dialog.dart';
import '../../widgets/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  formValidation() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      loginNow();
    } else {
      showDialog(
        context: context,
        builder: (c) => ErrorDialog(message: "Please write email/password."),
      );
    }
  }

  loginNow() async {
    showDialog(
      context: context,
      builder: (c) {
        return LoadingDialog(
          message: "Checking Credentials..",
        );
      },
    );

    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((auth) {
      currentUser = auth.user!;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (c) => ErrorDialog(
          message: error.message.toString(),
        ),
      );
    });

    if (currentUser != null) {
      readDataAndSetDataLocally(currentUser!).then((value) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => const HomeScreen()),
        );
      });
    }
  }

  Future readDataAndSetDataLocally(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get()
        .then(
      (snapshot) async {
        await sharedPreferences!.setString("uid", currentUser.uid);
        await sharedPreferences!
            .setString("email", snapshot.data()!["userEmail"]);
        await sharedPreferences!
            .setString("name", snapshot.data()!["userName"]);
        await sharedPreferences!
            .setString("photoUrl", snapshot.data()!["userAvatarUrl"]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/images/login.png"),
              ),
              CustomTextField(
                data: Icons.email,
                controller: emailController,
                hintText: "Email",
                isObscure: false,
              ),
              CustomTextField(
                data: Icons.password,
                controller: passwordController,
                hintText: "Password",
                isObscure: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  formValidation();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: "Lobster-Regular",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
