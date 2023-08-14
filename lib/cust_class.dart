import 'package:flutter/material.dart';
import 'package:netnflix/models/detail_model.dart';
import 'package:netnflix/models/show_model.dart';

class CustClass {
  static const MaterialColor customBlack = MaterialColor(0xFF141414, {
      50: Color(0xFFE0E0E0),
      100: Color(0xFFB3B3B3),
      200: Color(0xFF808080),
      300: Color(0xFF4D4D4D),
      400: Color(0xFF262626),
      500: Color(0xFF141414),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
  });

  static const MaterialColor customWhite = MaterialColor(0xFFFFFFFF, {
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  });

  static Color colorText = Colors.white;
  static List<ShowModel> showList = [
    ShowModel(title: "See You In My 19th Life", date: "17", month: "JUN", titlePath: "assets/seeyou/sytitle.jpeg", titleDesc: "Coming June 17", description: "Ji-Eum asks Yoon Cho-won out to dinner and uncovers relieving news. A mysterious figure drops by the hotel.", modelPath: ["assets/seeyou/sy1.png", "assets/seeyou/sy2.png", "assets/seeyou/sy3.png"]),
    ShowModel(title: "One Piece", date: "15", month: "AGU", titlePath: "assets/onepiece/optitle.png", titleDesc: "Season 10 Will Start Airing On Tuesday", description: "Monkey D. Luffy sails with is crew of Straw Hat Pirates through the Grand Line to find the treasure One Piece and become the new king of the pirates.", modelPath: ["assets/onepiece/op1.png", "assets/onepiece/op2.jpg", "assets/onepiece/op3.jpg"]),
  ];

  static List<DetailModel> detailList = [
    DetailModel(title: "See You in My 19th Life", year: "2023", previewPath: "assets/seeyou/previewsy.jpg", starring: "Shin Hae-sun, Ahn Bo-hyun", season: "1 Season", minAge: "13+", description: "Ji-Eum asks Yoon Cho-won out to dinner and uncovers relieving news. A mysterious figure drops by the hotel.", thumbnail: "assets/seeyou/tbsy.jpg", epsPic: ["assets/seeyou/ep1sy.jpg", "assets/seeyou/ep2sy.jpg"], epsTitle: ["Episode 1", "Episode 2"], epsDescription: ["Memories of her past lives and one true love come rushing back to 9-year-old Ban Ji-eum. But reuniting with him proves trickier than expected.", "Thanks to a new job, Ji-eum is finally back in Mun seo-ha's life but will he recognize her? Another familiar face shows up, much to Ji-eum's delight."]),
    DetailModel(title: "One Piece", year: "2004", previewPath: "assets/onepiece/previewop.jpg", starring: "Mayumi Tanaka, Akemi Okamura", season: "9 Seasons", minAge: "16+", description: "Monkey D. Luffy sails with is crew of Straw Hat Pirates through the Grand Line to find the treasure One Piece and become the new king of the pirates.", thumbnail: "assets/onepiece/tbop.jpg", epsPic: ["assets/onepiece/ep1op.jpg", "assets/onepiece/ep2op.jpg"], epsTitle: ["Episode 1", "Episode 2"], epsDescription: ["Young Monkey dm Luffy, a pirate himself, runs afoul of other pirates when they attack a cruise ship. Luckily for him, Luffy has the power of a rubber", "Coby and Luffy arrive in a town to recruit Zoro, Peering over a wall, they see a young girl and a man approach the capture bounty hunter."]),
    DetailModel(title: "Wednesday", year: "2022", previewPath: "assets/wednesday/previewwednesday.jpg", starring: "Jenna Ortega, Gwendoline Christie", season: "1 Season", minAge: "18+", description: "Smart, sarcastic and little dead inside, Wednesday Addams investigates a murder spree while making new friends — and foes — at Nevermore Academy.", thumbnail: "assets/wednesday/tbwednesday.jpg", epsPic: ["assets/wednesday/ep1wednesday.jpg", "assets/wednesday/ep2wednesday.jpg"], epsTitle: ["Wednesday’s Child Is Full of Woe", "Woe Is the Loneliest Number"], epsDescription: ["When a deliciously wicked prank gets Wednesday expelled, her parents ship her off to Nevermore Academy, the boarding school where they fell in love.", "The sheriff questions Wednesday about the night’s strange happenings. Later, Wednesday faces off against a fierce rival in the cutthroat Poe Cup race."]),
    DetailModel(title: "Hospital Playlist", year: "2021", previewPath: "assets/hosplay/previewhosplay.jpg", starring: "Jeon Mi-do, Cho Jung-seok", season: "2 Seasons", minAge: "16+", description: "Every day is extraordinary for five doctors and their patients inside a hospital, where birth, death and everything in between coexist.", thumbnail: "assets/hosplay/tbhosplay.jpg", epsPic: ["assets/hosplay/ep1hosplay.jpg", "assets/hosplay/ep2hosplay.jpg"], epsTitle: ["Episode 1", "Episode 2"], epsDescription: ["Five friends whose friendship goes back to their days in med school are brought back together when a phone call interrupts each of their busy lives.", "For the first time in 20 years, everyone's finally working under the same roof. A patient with a familiar name finds Chae Song-hwa."]),
    DetailModel(title: "Naruto", year: "2006", previewPath: "assets/naruto/previewnaruto.jpg", starring: "Junko Takeuchi, Chie Nakamura", season: "9 Seasons", minAge: "16+", description: "Guided by the sprit demon within him, orphaned Naruto learns to harness his powers as a ninja in this anime adventure series.", thumbnail: "assets/naruto/tbnaruto.jpg", epsPic: ["assets/naruto/ep1naruto.jpg", "assets/naruto/ep2naruto.jpg"], epsTitle: ["Enter: Naruto Uzumaki!", "My Name Is Konohamaru!"], epsDescription: ["Enter the Village Hidden in the Leaves, where deadly ninjas roam the land and the mischievous Naruto Uzumaki causes trouble everywhere he goes.", "Naruto finally graduates from Ninja Academy and claims to know it all. "]),
    DetailModel(title: "Alice in Borderland", year: "2022", previewPath: "assets/aib/previewaib.jpg", starring: "Kento Yamazaki, Tao Tsuchiya", season: "2 Seasons", minAge: "18+", description: "An aimless gamer and his two friends find themselves in a parallel Tokyo, where they’re forced to compete in a series of sadistic games to survive.", thumbnail: "assets/aib/tbaib.jpg", epsPic: ["assets/aib/ep1aib.jpg", "assets/aib/ep2aib.jpg"], epsTitle: ["Episode 1", "Episode 2"], epsDescription: ["Arisu and his friends run into a public bathroom to hide from the police, but when they reemerge, the streets of Tokyo are suddenly completely empty.", "Leaving an injured Chota, Arisu and Karube head out to gain more experience. They come to a sprawling apartment, where a deadly game of tag awaits."]),
    DetailModel(title: "Bridgerton", year: "2022", previewPath: "assets/bridgerton/previewbridgerton.jpg", starring: "Adjoa Andoh, Julie Andrews", season: "2 Seasons", minAge: "18+", description: "The eight close-knit siblings of the Bridgerton family look for love and happiness in London high society. Inspired by Julia Quinn’s bestselling novels.", thumbnail: "assets/bridgerton/tbbridgerton.jpg", epsPic: ["assets/bridgerton/ep1bridgerton.jpg", "assets/bridgerton/ep2bridgerton.jpg"], epsTitle: ["Diamond of the First Water", "Shock and Delight"], epsDescription: ["Daphne debuts on London’s marriage market as a new gossip sheet sets high society atwitter and Simon, the eligible Duke of Hastings, returns to town.", "Simon’s apparent courtship of Daphne angers her brother Anthony and threatens to ruin the arrangements he made. Marina opens up to a curious Penelope."]),
    DetailModel(title: "Hotel Del Luna", year: "2019", previewPath: "assets/hdl/previewhdl.jpg", starring: "IU, Yeo Jin-goo", season: "1 Season", minAge: "16+", description: "When he’s invited to manage a hotel for dead souls, an elite hotelier gets to know the establishment’s ancient owner and her strange world.", thumbnail: "assets/hdl/tbhdl.jpg", epsPic: ["assets/hdl/ep1hdl.jpg", "assets/hdl/ep2hdl.jpg"], epsTitle: ["Episode 1", "Episode 2"], epsDescription: ["Jang Man-wol agrees to save a man’s life — if he promises to give her his son. Koo Chan-sung receives an unwelcome birthday gift.", "On his way to a new job, Chan-sung stops by Hotel Del Luna to pay back his father’s debt and begs Man-wol to take back her gift."])
  ];

  // title, username, review
  static List<List<String>> reviewList = [
    ["One Piece", "Person", "Epic adventure!"],
  ];

  static bool isLight = false;
}