import 'package:flutter/material.dart';
import 'package:home_islami/app_colors.dart';
import 'package:home_islami/model/sura_model.dart';

class SuraListWidget extends StatelessWidget {
  int index;
  SuraModel suraModel;
  SuraListWidget({required this.suraModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/vector_image.png'),
            Text(
              '${index + 1}',
              style: TextStyle(
                color: AppColors.whiteColor,
              ),
            )
          ],
        ),
        SizedBox(width: 24),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${suraModel.suraEnglishName}',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${suraModel.numOfVerses}Verses',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Text(
                '${suraModel.suraArabicName}',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
