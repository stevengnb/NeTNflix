import 'package:flutter/material.dart';
import 'package:netnflix/cust_class.dart';
import 'package:netnflix/pages/login_page.dart';
import 'package:netnflix/pages/main_page.dart';
import 'package:netnflix/theme/dark_theme.dart';
import 'package:netnflix/theme/light_theme.dart';

class AccountPage extends StatefulWidget {
  String username;
  AccountPage({super.key, required this.username});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void handleLogOut() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginPage();
        },
      ),
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope (
        onWillPop: () async { 
        return true;
      },
      child: Theme(
        data: CustClass.isLight ? lightTheme : darkTheme,
        child: Scaffold(
          appBar: AppBar(
            title: 
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MainPage(username: widget.username);
                        },
                      ),
                      (route) => false
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  "Manage Profiles",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/profile.png",
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          widget.username,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SwitchListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Light Theme"),
                  value: CustClass.isLight,
                  onChanged: (value) {
                    setState(() {
                      CustClass.isLight = !CustClass.isLight;
                    });
                  },
                ),
                TextButton(
                    onPressed: handleLogOut,
                    style: TextButton.styleFrom(
                      minimumSize: const Size(335, 50),
                    ),
                    child: const Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ), 
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}