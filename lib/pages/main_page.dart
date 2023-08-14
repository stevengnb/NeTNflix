import 'package:flutter/material.dart';
import 'package:netnflix/cust_class.dart';
import 'package:netnflix/pages/account_page.dart';
import 'package:netnflix/pages/home_page.dart';
import 'package:netnflix/pages/show_page.dart';
import 'package:netnflix/theme/dark_theme.dart';
import 'package:netnflix/theme/light_theme.dart';

class MainPage extends StatefulWidget {
  String username;
  MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late String usernamee;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    usernamee = widget.username;
    pages = [
      HomePage(username: usernamee),
      ShowPage(username: usernamee)
    ];
  }

  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: CustClass.isLight ? lightTheme : darkTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Row (
            children: [
              Expanded(
                child: Text(
                  "Hello, ${widget.username}!",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.search,
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AccountPage(username: widget.username);
                      },
                    ),
                    (route) => false
                  );
                },
                child: Image.asset(
                  "assets/profile.png",
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          )
        ),
        body: pages[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xFFE50914),
          unselectedItemColor: Colors.grey,
          onTap: ((value) {
            setState(() {
              selectedPage = value;
            });
          }),
          currentIndex: selectedPage,
          items: const[
            BottomNavigationBarItem(
              tooltip: "Home",
              label: "Home",
              icon: Icon(Icons.home_rounded, color: Colors.grey),
              activeIcon: Icon(Icons.home_rounded, color: Color(0xFFE50914))
            ),
            BottomNavigationBarItem(
              tooltip: "Show",
              label: "Show",
              icon: Icon(Icons.shop_two_rounded, color: Colors.grey),
              activeIcon: Icon(Icons.shop_two_rounded, color: Color(0xFFE50914))
            )
          ]
        ),
      ),
    );
  }
}