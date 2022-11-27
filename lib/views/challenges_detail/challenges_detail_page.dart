import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon2022/constants.dart';
import 'package:hackathon2022/views/submission/submission_page.dart';
import 'package:hackathon2022/widget/inkwell_wrapper.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';

class ChallengesDetailPage extends StatefulWidget {
  const ChallengesDetailPage({Key? key}) : super(key: key);

  @override
  State<ChallengesDetailPage> createState() => _ChallengesDetailPageState();
}

class _ChallengesDetailPageState extends State<ChallengesDetailPage> {
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
                padding: const EdgeInsets.only(top: 24, bottom: 12),
                child: Text(
                  "Plant a tree",
                  style: TextStyle(fontSize: 24, height: 32 / 24),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  2,
                  (index) => Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.grey200),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        child: Text(
                          AppConstants().title[index],
                          style: TextStyle(
                            height: 12 / 8,
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "Plant any tree inside your house now then capture it and send us your progress. A big reward is waiting for you to gain!",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: Text(
                  "Time:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey200),
                  borderRadius: BorderRadius.circular(8),
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Text(
                    'Ends at: 23:59 30/11/2022',
                    style: TextStyle(fontSize: 14, height: 20 / 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Reward:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    VectorImageAssets.coppon_png,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Coupon code",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "For shopping at Shoppe",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    VectorImageAssets.free_tiket_png,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Free ticket to join the Webinar",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "About: Environment and why we should protect it",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    VectorImageAssets.point_png,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "+500 points",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Save for later exchanges!",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              InkWellWrapper(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubmitsionPage(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80.5),
                  child: Center(
                    child: Text(
                      'Accept the challenge',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.green),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80.5),
                child: Center(
                  child: Text(
                    'Save to favourites',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.green
                    ),
                  ),
                ),
              ),
              SizedBox(height: 88,),
            ],
          ),
        ),
      ),
    );
  }
}
