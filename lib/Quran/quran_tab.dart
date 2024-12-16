import 'package:flutter/material.dart';
import 'package:home_islami/Quran/sura_details_screen.dart';
import 'package:home_islami/app_colors.dart';
import 'package:home_islami/model/sura_model.dart';
import 'package:home_islami/Quran/sura_list_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          suraEnglishName: SuraModel.suraEnglishList[i],
          suraArabicName: SuraModel.suraArabicList[i],
          numOfVerses: SuraModel.numOfVersesList[i],
          fileName: '${i + 1}.txt'));
    }
  }

  @override
  void initState(){
    // ToDo: implement initState
    super.initState();
    addSuraList();
    loadLastSura();   /// get data in shared prefs
}
List <SuraModel> filterList = SuraModel.suraList;  /// 114
  String searchText = '';
  List<SuraModel> searchResultList = [];
  Map <String,String> loadSuraList = {};

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/islami_image.png'),
          TextField(
            style: const TextStyle(
              color: AppColors.whiteColor,
            ),
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.primaryDark,
                      width: 2,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: AppColors.primaryDark,
                    width: 2,
                  ),
                ),
                prefixIcon: Image.asset(
                  'assets/images/image_prefix.png',
                  color: AppColors.primaryDark,
                ),
                hintText: 'Sura Name',
                hintStyle: const TextStyle(color: Colors.white)),
            onChanged: (text) {
              searchText = text;
              filterList = SuraModel.suraList.where((suraModel) {
                return suraModel.suraArabicName.contains(searchText) ||
                    suraModel.suraEnglishName.toLowerCase().contains(
                        searchText.toLowerCase());
              },
              ).toList();
              setState(() {

              });
            },
          ),
          const SizedBox(height: 20),
          searchText.isNotEmpty?
              const SizedBox()
          :
          builtMostRecentlyWidget(),
          const SizedBox(height: 10),
          const Text(
            'Sura List',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          // SizedBox(height: 20),
          Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: AppColors.whiteColor,
                    thickness: 2,
                    indent: 30.5,
                    endIndent: 30.5,
                  );
                },
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // save last sura
                      saveLastSura(suraEnName: filterList[index].suraEnglishName,
                          suraArName: filterList[index].suraArabicName,
                          numOfVerses:filterList[index].numOfVerses);
                      Navigator.of(context).pushNamed(
                          SuraDetailsScreen.routeName,
                          arguments: filterList[index]);
                    },

                    child: SuraListWidget(
                      index: index,
                      suraModel: filterList[index],
                    ),
                  );
                },
                itemCount: filterList.length,
              )),
        ],
      ),
    );
  }

  Widget builtMostRecentlyWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Most Recently',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        const SizedBox(height: 10),

        Container(
          color: AppColors.primaryDark,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(loadSuraList['suraEnName'] ?? ''),
                  Text(loadSuraList['suraArName'] ?? ''),
                  Text(loadSuraList['numOfVerses'] ?? ''),
                ],
              ),
              Image.asset('assets/images/most_recently_image.png'),
            ],
          ),
        ),
      ],
    );
  }
  saveLastSura({required String suraEnName,
    required String suraArName, required String numOfVerses})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numOfVerses', numOfVerses);
    await loadLastSura();
}
getLastSura()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String suraEnName = prefs.getString('suraEnName') ?? '';
  String suraArName = prefs.getString('suraArName') ?? '';
  String numOfVerses = prefs.getString('numOfVerses') ?? '';
  return {
    'suraEnName': suraEnName,
    'suraArName': suraArName,
    'numOfVerses': numOfVerses,
  };
}
/// get data from shared prefs
loadLastSura()async{
  loadSuraList = await getLastSura();
  setState(() {

  });
}

}
