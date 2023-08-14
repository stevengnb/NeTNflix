import 'package:flutter/material.dart';
import 'package:netnflix/cust_class.dart';
import 'package:netnflix/models/detail_model.dart';
import 'package:netnflix/pages/detail_page.dart';
import 'package:netnflix/theme/dark_theme.dart';
import 'package:netnflix/theme/light_theme.dart';

class SearchPage extends StatefulWidget {
  String username;
  SearchPage({super.key, required this.username});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<DetailModel> searchList = List.from(CustClass.detailList);

  void searching(String value) {
    setState(() {
      searchList = CustClass.detailList.where((element) => element.title.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: CustClass.isLight ? lightTheme : darkTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search Page"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  onChanged: (value) => searching(value),
                  style: const TextStyle(
                  ),
                  decoration: const InputDecoration(
                    hintText: "eg: Hospital Playlist",
                    hintStyle: TextStyle(
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE50914)),
                    ),
                    prefixIcon: Icon(Icons.search_rounded),
                    prefixIconColor: Colors.grey
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  DetailModel currDetail = searchList[index];
      
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
        ),
      ),
    );
  }
}