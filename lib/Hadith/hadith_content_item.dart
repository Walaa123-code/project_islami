import 'package:flutter/material.dart';
import 'package:home_islami/app_colors.dart';

class HadithContentItem extends StatelessWidget {
  String content;
 // int index;
 HadithContentItem({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(content,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.primaryDark,
          fontSize: 20,
        ),
      ),
    );
  }
}
