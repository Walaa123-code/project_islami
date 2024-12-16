import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_islami/Hadith/hadith_datails_screen.dart';
import 'package:home_islami/Hadith/hadith_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_islami/app_colors.dart';

class HadithTab extends StatefulWidget {
  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
 List <HadithModel> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      loadHadithFile();
    }
    return Column(
      children: [
        Image.asset('assets/images/islami_image.png'),
        CarouselSlider.builder(
          itemCount: hadithList.length,
          itemBuilder: (BuildContext context, int itemIndex,
              int pageViewIndex) =>
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        HadithDetailsScreen.routeName,
                        arguments: hadithList[itemIndex]);
                  },
                  child: Container(
                    width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primaryDark,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/hadith_bg_image.png',
                              ),),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: // hadithList.isEmpty ?
                            Column(
                              children: [
                                Text(hadithList[itemIndex].title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                  ),),
                                SizedBox(height: 10,),
                                Expanded(child: Text(
                                  hadithList[itemIndex].content.join(''),
                                  style: const TextStyle(
                                      fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                              ],
                            )
                        )

                    ),
                  ),


          options: CarouselOptions(
              height: 300,
              viewportFraction: 0.75,
              enlargeCenterPage: true,
              enableInfiniteScroll: false
          ),
        ),
      ],
    );
  }

  void loadHadithFile() async{
    for(int i = 1; i <= 50; i++){
      String hadithContent = await rootBundle.loadString('assets/files/h$i.txt');
      List <String> hadithLines = hadithContent.split('\n');
      for(int i = 0; i <hadithLines.length; i++){
        print(hadithLines[i]);
      }
      String title = hadithLines[0];   ///title
      hadithLines.removeAt(0);        ///content
    HadithModel hadithModel = HadithModel(title: title, content: hadithLines);
    hadithList.add(hadithModel);
    setState(() {

    });
    }

  }
}

