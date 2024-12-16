import 'package:flutter/material.dart';
import 'package:home_islami/Hadith/hadith_content_item.dart';
import 'package:home_islami/Hadith/hadith_model.dart';
import 'package:home_islami/app_colors.dart';

class HadithDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadith_details_screen';

  @override
  State <HadithDetailsScreen> createState() => HadithDetailsScreenState();
}

class HadithDetailsScreenState extends State<HadithDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadithModel;

    return Scaffold(
      appBar: AppBar(
        /*
        title: Text(
          args.title,
          style: TextStyle(color: AppColors.primaryDark),
        ),*/
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.blackColor,
            child: Image.asset(
              'assets/images/details_screen_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 30),
              Text(
                args.title,
                style: const TextStyle(color: AppColors.primaryDark,
                fontSize: 25),
              ),

              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index){
                  return HadithContentItem(
                      content: args.content[index]);
                    },
                    itemCount: args.content.length),
              ),
            ],
          )
        ],
      ),
    );
  }

}





























