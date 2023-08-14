import 'package:flutter/material.dart';
import 'package:netnflix/cust_class.dart';
import 'package:netnflix/models/detail_model.dart';
import 'package:netnflix/pages/detail_page.dart';

class ShowPage extends StatefulWidget {
  String username;
  ShowPage({super.key, required this.username});

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Only on NeTNflix",
                style: TextStyle(
                  fontSize: 22
                ),
              )
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: CustClass.detailList.length,
            itemBuilder: (context, index) {
              DetailModel currDetail = CustClass.detailList[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage(curr: currDetail, username: widget.username)),
                  );
                },
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.all(6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          currDetail.thumbnail,
                          width: 150
                        ),
                        const SizedBox(
                          width: 8
                        ),
                         Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currDetail.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 4
                              ),
                              Text(
                                currDetail.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 5
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
        ]
      ),
    );
  }
}