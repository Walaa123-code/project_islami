import 'package:flutter/material.dart';
import 'package:home_islami/app_colors.dart';


class SebhaTab extends StatefulWidget {


  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int _counter = 0;
  double turns = 0.0;
  int index = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sebha_bg.png'),
              fit: BoxFit.cover)),
      child: InkWell(
        autofocus: false,
        hoverColor: AppColors.whiteColor,
        focusColor: AppColors.whiteColor,
        highlightColor: AppColors.whiteColor,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() => turns += 1 / 33);
          _counter++;
          if (_counter == 33) {
            _counter = 0;
            index++;
          }

          if (_counter == 33) {
            _counter = 0;
            index++;
          }
          if (index == azkar.length) {
            index = 0;
          }
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/islami_image.png'),
              SizedBox(height: 20),
              const Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: AppColors.whiteColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          azkar[index],
                          style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$_counter',
                          style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    AnimatedRotation(
                        turns: turns,
                        duration: const Duration(milliseconds: 50),
                        child: Image.asset(
                          'assets/images/total_sebha.png',
                          fit: BoxFit.fitWidth,
                          centerSlice: Rect.zero,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
