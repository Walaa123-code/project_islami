import 'package:flutter/material.dart';
import 'package:home_islami/app_colors.dart';
import 'package:home_islami/Hadith/hadith_tab.dart';
import 'package:home_islami/Quran/quran_tab.dart';
import 'package:home_islami/Radio/radio_tab.dart';
import 'package:home_islami/Sebha/sebha_tab.dart';
import 'package:home_islami/Time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> backgroundImages = [
    'assets/images/quran_bg.png',
    'assets/images/hadith_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          //  '${getBackgroundImages()}',
          backgroundImages[selectedIndex],
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: AppColors.primaryDark),
              child: BottomNavigationBar(
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  //  backgroundColor: AppColors.primaryDark,
                  //   type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        icon: builtItemBottomNavBar(
                            index: 0, imageName: 'icon_quran (2)'),
                        label: 'Quran'),
                    BottomNavigationBarItem(
                        icon: builtItemBottomNavBar(
                            index: 1, imageName: 'icon_hadith'),
                        label: 'Hadith'),
                    BottomNavigationBarItem(
                        icon: builtItemBottomNavBar(
                            index: 2, imageName: 'icon_sebha'),
                        label: 'Sebha'),
                    BottomNavigationBarItem(
                        icon: builtItemBottomNavBar(
                            index: 3, imageName: 'icon_radio'),
                        label: 'Radio'),
                    BottomNavigationBarItem(
                        icon: builtItemBottomNavBar(
                            index: 4, imageName: 'icon_time'),
                        label: 'Time'),
                  ])),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  Widget builtItemBottomNavBar({required int index, required imageName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.blackBgColor,
            ),
            child: ImageIcon(
              AssetImage('assets/images/$imageName.png'),
            ))
        : ImageIcon(
            AssetImage('assets/images/$imageName.png'),
          );
  }
/*
  String getBackgroundImages(){
    switch (selectedIndex){
      case 0 :
        return 'assets/images/quran_bg.png';
      case 1 :
        return 'assets/images/hadith_bg.png';
      case 2 :
        return 'assets/images/sebha_bg.png';
      case 3 :
        return 'assets/images/radio_bg.png';
      case 4 :
        return 'assets/images/time_bg.png';
      default:
    return  'assets/images/quran_bg.png';
    }
  }
  */
}
