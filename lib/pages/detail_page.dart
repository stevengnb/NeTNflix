import 'package:flutter/material.dart';
import 'package:netnflix/cust_class.dart';
import 'package:netnflix/models/detail_model.dart';
import 'package:netnflix/theme/dark_theme.dart';
import 'package:netnflix/theme/light_theme.dart';

class DetailPage extends StatefulWidget {
  DetailModel curr;
  String username;
  DetailPage({super.key, required this.curr, required this.username});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController reviewController = TextEditingController();

  String? reviewError;

  void resetError() {
    setState(() {
      reviewError = null;
    });
  }

  void handleReview() {
      bool isReviewValid = false;
      resetError();
      String review = reviewController.text;

      if(review.length >= 15) {
        isReviewValid = true;
      }

      if(!isReviewValid) {
        setState(() {
          reviewError = "Minimum 15 characters.";
        });
        return;
      }

      SnackBar snackBar = const SnackBar(
        content: Text("Your review has been uploaded!"),
        duration:  Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      CustClass.reviewList.add([widget.curr.title, widget.username, review]);

      reviewController.text = "";
    }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: CustClass.isLight ? lightTheme : darkTheme,
      child: DefaultTabController(
        length: 2, 
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Detail Page"),
          ),
          body: Column(
            children: [
              const TabBar(
                indicatorColor: Color(0xFFE50914),
                tabs: [
                  Tab(
                    icon: Icon(Icons.movie_creation_outlined)
                  ),
                  Tab(
                    icon: Icon(Icons.rate_review_outlined)
                  )
                ]
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                        child: 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(image: AssetImage(widget.curr.previewPath)),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                widget.curr.title,
                                style: const TextStyle(
                                  fontSize: 20
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.curr.year,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    widget.curr.minAge,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    widget.curr.season,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                      minimumSize: const Size(250, 50),
                                    ),
                                    onPressed: (){}, 
                                    child: 
                                      const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Play",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey[800],
                                      minimumSize: const Size(250, 50),
                                    ),
                                    onPressed: (){}, 
                                    child: 
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.file_download,
                                            color: CustClass.colorText,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            "Download",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.curr.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Starring: ${widget.curr.starring}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[400],
                                  ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.add),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "My List",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.thumb_up_alt_outlined),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Rate",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.share),
                                      SizedBox(
                                        height: 2.5,
                                      ),
                                      Text(
                                        "Share",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              const Text(
                                "EPISODES",
                                style: TextStyle(
                                  fontSize: 15
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              TextButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(const Size(135, 40)),
                                      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                          if (states.contains(MaterialState.pressed)) {
                                            return Colors.grey[900];
                                          } else {
                                            return Colors.grey[800];
                                          }
                                        },
                                      ),
                                    ),
                                    onPressed: (){},
                                    child: 
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Season 1",
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: CustClass.colorText,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: CustClass.colorText,
                                          ),
                                        ],
                                      )
                                ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.curr.epsTitle.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(4),
                                                child: Image.asset(
                                                  widget.curr.epsPic[index],
                                                  width: 165,
                                                ),
                                              ),
                                              const Positioned.fill(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    Icons.play_circle_outline_outlined, 
                                                    size: 40
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${index+1}. ${widget.curr.epsTitle[index]}",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: CustClass.colorText,
                                                fontSize: 13
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10
                                      ),
                                      Text(
                                        widget.curr.epsDescription[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]
                                  );
                                }
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "REVIEW",
                                style: TextStyle(
                                  fontSize: 15
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: reviewController,
                                style: const TextStyle(
                                ),
                                decoration: InputDecoration(
                                  hintText: "Add your review",
                                  hintStyle: const TextStyle(
                                  ),
                                  filled: true,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFE50914)),
                                  ),
                                  errorText: reviewError,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: handleReview,
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFFE50914),
                                      minimumSize: const Size(200, 50),
                                    ),
                                    child: const Text(
                                      "Send",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                      ), 
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15
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
                          )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "Reviews",
                                  style: TextStyle(fontSize: 22),
                                )
                              ],
                            ),
                            Column(
                              children: CustClass.reviewList.map((review) {
                                return SizedBox(
                                  width: 300,
                                  child: Card(
                                    elevation: 2,
                                    margin: const EdgeInsets.all(6),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            review[0],
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "User: ${review[1]}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Review: ${review[2]}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 5),
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
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    )

                  ]
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}