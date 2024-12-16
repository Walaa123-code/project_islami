
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_islami/app_colors.dart';

class RadioTab extends StatefulWidget {
  @override

  int selectedIndex = 0 ;

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  List<String> reciters = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Image.asset('assets/images/islami_image.png'),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: (){
                      setState((){
                        widget.selectedIndex == 0;
                      });
                    },
                    style:
                    ElevatedButton.styleFrom(
                     backgroundColor: widget.selectedIndex==0?
                          AppColors.primaryDark: AppColors.blackColor,
                    ),
                    child: Text('Radio',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 17,
                    ),)),
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: (){
                      setState((){
                        widget.selectedIndex == 1;
                      });
                    },
                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor: widget.selectedIndex==1?
                      AppColors.primaryDark: AppColors.blackColor,
                    ),
                    child: Text('Reciters',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 17,
                      ),)),
               ),
               ]

             ),

        Container(
         // color: AppColors.primaryDark,
          child: Row(
            children: [
          ListView.builder(
              itemCount: reciters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(reciters[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(CupertinoIcons.heart_fill),
                      Icon(CupertinoIcons.play),
                      Icon(Icons.volume_up),
                    ],
                  ),
                );
              },
            ),
              ]
              ),
    )
    ]
      )
    );
  }
}

