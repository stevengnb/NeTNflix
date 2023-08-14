import 'package:flutter/material.dart';
import 'package:netnflix/cust_class.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:netnflix/models/show_model.dart';
import 'package:netnflix/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  String username;
  HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/wednesday.jpg"),
            const SizedBox(
              height: 15,
            ),
            Container (
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Column(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        height: 2.5,
                      ),
                      Text(
                        "My List",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      minimumSize: const Size(100, 50),
                    ),
                    onPressed: (){}, 
                    child: 
                    const Row(
                      children: [
                        Icon(
                          Icons.play_arrow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Play",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    )
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailPage(curr: CustClass.detailList[2], username: widget.username)),
                      );
                    },
                    child: const Column(
                      children: [
                        Icon(Icons.info_outline_rounded),
                        SizedBox(
                          height: 2.5,
                        ),
                        Text(
                          "Info",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: const Text(
                "Coming Soon",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: CustClass.showList.length,
              itemBuilder: (BuildContext context, int index) {
                ShowModel showItem = CustClass.showList[index];

                return Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: showItem.modelPath.map((thePath) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: Image.asset(
                              thePath,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 200.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                showItem.month,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                showItem.date,
                                style: const TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                showItem.titlePath,
                                width: 175,
                              ),
                              const SizedBox(width: 15),
                              const Column(
                                children: [
                                  Icon(Icons.notifications_none),
                                  SizedBox(height: 2.5),
                                  Text(
                                    "Remind Me",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DetailPage(curr: CustClass.detailList[index], username: widget.username)),
                                  );
                                },
                                child: const Column(
                                  children: [
                                    Icon(Icons.info_outline_rounded),
                                    SizedBox(height: 2.5),
                                    Text(
                                      "Info",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Text(showItem.titleDesc),
                          const SizedBox(height: 5),
                          Text(
                            showItem.description,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              },
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "© 2023, TN23-2",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10
            ),
          ],
        ),
    );
  }
}