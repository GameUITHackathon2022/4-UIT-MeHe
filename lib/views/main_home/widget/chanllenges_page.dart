import 'package:flutter/material.dart';
import 'package:hackathon2022/constants/colors.dart';
import 'package:hackathon2022/views/challenges_detail/challenges_detail_page.dart';
import 'package:hackathon2022/widget/inkwell_wrapper.dart';
import 'package:iconsax/iconsax.dart';

import '../../challenges/widget/chanllenges_widget.dart';
import '../../news_details/news_page.dart';
import '../../news_details/widget/popolar_post_card.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({Key? key}) : super(key: key);

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  String finalDate = '';

  var now = new DateTime.now();

  List<DateTime> ListTime = [];

  var selectedTime = DateTime.now();
  int selectIndex = 2;

  getListTime() {
    ListTime.add(now.subtract(Duration(days: 2)));
    ListTime.add(now.subtract(Duration(days: 1)));
    ListTime.add(now);
    ListTime.add(now.add(Duration(days: 1)));
    ListTime.add(now.add(Duration(days: 1)));
  }

  @override
  void initState() {
    getListTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: Icon(
          Iconsax.arrow_circle_left,
          color: AppColors.black,
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
            Iconsax.global,
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
            children: [
              Row(
                children: [
                  Text(
                    "${selectedTime.day}",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      height: 48 / 40,
                      color: AppColors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 12),
                    child: Container(
                      height: 48,
                      width: 1,
                      color: AppColors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 47),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${selectedTime.month}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 16 / 12,
                            fontFamily: 'SVN-Poppins',
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          "${selectedTime.year}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 16 / 12,
                            fontFamily: 'SVN-Poppins',
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWellWrapper(
                              onTap: () {
                                setState(() {
                                  selectedTime = ListTime[index];
                                  selectIndex = index;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selectIndex == index ? AppColors.green : AppColors.grey100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: 46,
                                height: 70,
                                child: Center(
                                  child: Text(
                                    "${ListTime[index].day}",
                                    style: TextStyle(color: selectIndex == index ? AppColors.white : AppColors.black),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              width: 16,
                            );
                          },
                          itemCount: ListTime.length),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
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
                        "Daily Challenges",
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
                  itemBuilder: (context, index) {
                    return InkWellWrapper(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChallengesDetailPage(),
                          ),
                        );
                      },
                      child: ChallengesCard(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  },
                  itemCount: 4),
            ],
          ),
        ),
      ),
    );
  }
}
