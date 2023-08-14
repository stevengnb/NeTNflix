import 'package:flutter/material.dart';
import 'package:netnflix/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAgree = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? usernameError;
  String? passwordError;

  void resetError() {
    setState(() {
      usernameError = null;
      passwordError = null;
    });
  }

  void handleLogin() {
    bool isPassLength = false;
    bool isUnameValid = false;
    int atIndex = 0;
    resetError();
    String username = usernameController.text;
    String password = passwordController.text;

    if ((username.startsWith("0") || username.endsWith("@gmail.com"))) {
      isUnameValid = true;
    }

    if(username.endsWith("@gmail.com")) {
      if(username.length <= 10) {
        isUnameValid = false;
      }
    }

    if(!isUnameValid) {
      setState(() {
        usernameError = "Must start with '0' or end with '@gmail.com'.";
      });
      return;
    }

    if(password.length >= 4 && password.length <= 30) {
      isPassLength = true;
    }

    if(!isPassLength) {
      setState(() {
        passwordError = "Must consist of 4 to 30 characters.";
      });
      return;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          if(username.endsWith("@gmail.com")) {
            atIndex = username.indexOf('@');
            String newUsername = username.substring(0, atIndex);
            return MainPage(username: newUsername);
          } else {
            return MainPage(username: username);
          }
        },
      ),
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/netflix2.png",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Sign In", 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox (
                width: 335,
                child: TextField(
                  controller: usernameController,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Email or phone number",
                    hintStyle: const TextStyle(
                      color: Colors.white
                    ),
                    filled: true,
                    fillColor: const Color(0xFF333333),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE50914)),
                    ),
                    errorText: usernameError,
                  ),
                )
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox (
                width: 335,
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)
                    ),
                    filled: true,
                    fillColor: const Color(0xFF333333),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE50914)),
                    ),
                    errorText: passwordError,
                  ),
                )
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: handleLogin,
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFE50914),
                  minimumSize: const Size(335, 50),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  ), 
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Remember me",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.white,
                  checkColor: Colors.grey,
                  value: isAgree, 
                  onChanged: (value) {
                    setState(() {
                      isAgree = value!;
                    });
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}