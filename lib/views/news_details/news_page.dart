import 'package:flutter/material.dart';
import 'package:hackathon2022/constants/colors.dart';
import 'package:hackathon2022/views/news_details/widget/news_card.dart';
import 'package:hackathon2022/widget/inkwell_wrapper.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants.dart';
import 'widget/popolar_post_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWellWrapper(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Iconsax.arrow_circle_left,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          title: Text(
            "News",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 28 / 20,
              fontFamily: 'SVN-Poppins',
              fontStyle: FontStyle.normal,
            ),
          ),
          centerTitle: true,
          actions: [
            Icon(
              Iconsax.more,
              color: AppColors.black,
            ),
            SizedBox(
              width: 20,
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "7 reasons why you should plant trees",
                  style: TextStyle(
                    fontSize: 24,
                    height: 32 / 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SVN-Poppins',
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context,index){
                return NewsCard(tititleNewsModel: AppConstants().ListTitle[index],);
              }, separatorBuilder: (context,index){
                return SizedBox(height: 0);
              }, itemCount: AppConstants().ListTitle.length),
              SizedBox(height: 14,),
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
                  SizedBox(height: 24,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
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
                        "Most Viewed",
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
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return PopularPostCard();
                  }, separatorBuilder: (context,index){
                return SizedBox(height: 16);
              }, itemCount: 4),
            ],
          ),
        ),
      ),
    );
  }
}
