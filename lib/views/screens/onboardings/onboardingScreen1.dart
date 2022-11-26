import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import others
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon2022/constants/colors.dart';
import 'package:hackathon2022/constants/images.dart';

class onboardingScreen1 extends StatelessWidget {
  const onboardingScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Change status bar color to white
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              SizedBox(height: 60),
              Container(
                alignment: Alignment.topRight,
                child: Image.asset(ImageAssets.iconApp, scale: 1),
              ),
              SizedBox(height: 47),
              Container(
                padding: EdgeInsets.only(right: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'For the better life',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 32,
                            color: AppColors.alt700,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.right,
                        )),
                    const SizedBox(height: 8),
                    Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'We’re more than a application.' +
                              '\n' +
                              'Customize Grow to work the way you do.',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: AppColors.grey900,
                              fontWeight: FontWeight.w400,
                              height: 1.6),
                          textAlign: TextAlign.right,
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
