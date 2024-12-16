import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_islami/app_colors.dart';
import 'package:home_islami/model/sura_model.dart';
import 'package:home_islami/Quran/sura_content_item.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      LoadSuraFile(args.fileName);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnglishName,
          style: TextStyle(color: AppColors.primaryDark,
          fontSize: 25),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
           Container(
              color: AppColors.blackColor,
              child: Expanded(
                child: Image.asset(
                  'assets/images/details_screen_bg.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),

          Column(
            children: [
              const SizedBox(height: 20),
              Text(
                args.suraArabicName,
                style: const TextStyle(color: AppColors.primaryDark,
                fontSize: 25),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: verses.isEmpty
                    ?  Center(
                          child: Container(
                            width: 20,
                            height: 10,
                            child: CircularProgressIndicator(

                            color: AppColors.primaryDark,

                                                  ),
                          ),
                        )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return SuraContentItem(
                              content: verses[index], index: index);
                        },
                        itemCount: verses.length),
              ),
            ],
          )
        ],
      ),
    );
  }

  void LoadSuraFile( String fileName) async {
    String suraContent =
        await rootBundle.loadString('assets/files/$fileName');
    List<String> suraLines = suraContent.split('\n');

    /// content
    for (int i = 0; i < suraLines.length; i++) {
      print(suraLines[i]);
    }
    verses = suraLines;
    setState(() {});
  }
}
