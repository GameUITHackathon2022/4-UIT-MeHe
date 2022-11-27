import 'package:flutter/material.dart';
import 'package:hackathon2022/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../widget/text_input_widget.dart';
import '../challenges/widget/chanllenges_widget.dart';

class SubmitsionPage extends StatefulWidget {
  const SubmitsionPage({Key? key}) : super(key: key);

  @override
  State<SubmitsionPage> createState() => _SubmitsionPageState();
}

class _SubmitsionPageState extends State<SubmitsionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Iconsax.arrow_circle_left,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Challenges",
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        actions: [
          Icon(
            Iconsax.more,
            color: AppColors.black,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 22,),
              Row(
                children: [
                  Container(
                    height: 28,
                    width: 2,
                    color: AppColors.green,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Text(
                      "About the challenge",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 28 / 20,
                        fontFamily: 'SVN-Poppins',
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              ChallengesCard(),
              SizedBox(height: 32,),
              Row(
                children: [
                  Container(
                    height: 28,
                    width: 2,
                    color: AppColors.green,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Text(
                      "Upload your progress",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 28 / 20,
                        fontFamily: 'SVN-Poppins',
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Text('Short description',style: TextStyle(fontSize: 16,height: 24/16,fontWeight: FontWeight.w600),),
              SizedBox(height: 12,),
              TextInputWidget(maxLine: 4,fillColor: AppColors.grey200,),
            ],
          ),
        ),
      ),
    );
  }
}
