import 'package:flutter/material.dart';
import 'package:hackathon2022/constants.dart';
import 'package:hackathon2022/constants/colors.dart';
import 'package:hackathon2022/constants/images.dart';
import 'package:iconsax/iconsax.dart';

import '../../news_details/news_page.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewsPage()));
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 176,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    ImageAssets.post_png,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8),
                child: Text(
                  "13 reasons why you should plant trees",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600, height: 24 / 16,
                    fontFamily: 'SVN-Poppins',
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Text(
                "Trees conserve energy in the summer and save you money. Properly planted trees can cut your air-conditioning costs by 15 to 35 %...",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400, height: 16 / 12,
                  fontFamily: 'SVN-Poppins',
                  fontStyle: FontStyle.normal,
                ),
                maxLines: 4,
              ),
            ],
          ),
        ),
        
        SizedBox(height: 12,),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(3, (index) => Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.grey200),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 8),
                      child: Text(AppConstants().title[index]),
                    ),
                  )
                )),
              ),
            ),
            Icon(Iconsax.archive_1),
          ],
        )
      ],
    );
  }
}
