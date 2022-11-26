import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon2022/constants/colors.dart';
import 'package:hackathon2022/views/main_home/widget/news_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants.dart';
import '../../constants/images.dart';
import '../../widget/inkwell_wrapper.dart';
import 'widget/filtter_card.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final ScrollController controller = ScrollController();
  List<String> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage(ImageAssets.homebg_png),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CustomScrollView(
            scrollDirection: Axis.vertical,
            controller: controller,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                pinned: true,
                expandedHeight: 275,
                stretch: true,
                floating: false,
                snap: false,
                // stretch: true,
                title: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/da/51/c2/da51c26fe3398b0f8314fee17a98e0e7.jpg',
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: AppColors.grey500)),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        child: Row(
                          children: const [
                            Icon(
                              Iconsax.location,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: Text(
                                'Quan 1, Thanh pho Ho Chi Minh',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, height: 16 / 12, color: AppColors.black, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        Icon(
                          Iconsax.notification,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(42.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: AppColors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16, right: 9, bottom: 16),
                              child: SvgPicture.asset(VectorImageAssets.filter_svg),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Container(
                                  height: 33,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(right: 16),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, int index) {
                                      return FilterCard(
                                        filterItem: AppConstants().filterItem[index],
                                        onSelected: (bool value) {
                                          if (value) {
                                            selectedItem.add(AppConstants().filterItem[index]);
                                          } else {
                                            selectedItem
                                                .removeWhere((element) => element == AppConstants().filterItem[index]);
                                          }
                                        },
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return SizedBox(
                                        width: 16,
                                      );
                                    },
                                    itemCount: AppConstants().filterItem.length,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), // Add this code
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 124,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.grey100,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: AppColors.grey200),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFF282828).withOpacity(0.08),
                                            offset: Offset(2, 2),
                                            blurRadius: 8,
                                          )
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Weather",
                                            style: TextStyle(
                                              fontSize: 16,
                                              height: 16 / 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors.white,
                                                    borderRadius: BorderRadius.circular(100),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color(0xFF282828).withOpacity(0.08),
                                                        offset: Offset(2, 2),
                                                        blurRadius: 8,
                                                      )
                                                    ]),
                                                height: 36,
                                                width: 36,
                                                child: Center(
                                                  child: Icon(Iconsax.cloud),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(16),
                                                    bottomLeft: Radius.circular(16),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Sunny',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          height: 16 / 12,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: 'SVN-Poppins',
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 12,
                                                      ),
                                                      Text(
                                                        '28 C',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          height: 16 / 12,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: 'SVN-Poppins',
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.green,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: AppColors.grey200),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFF282828).withOpacity(0.08),
                                            offset: Offset(2, 2),
                                            blurRadius: 8,
                                          )
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Oxygen",
                                            style: TextStyle(
                                                fontSize: 16,
                                                height: 16 / 12,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors.white,
                                                    borderRadius: BorderRadius.circular(100),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color(0xFF282828).withOpacity(0.08),
                                                        offset: Offset(2, 2),
                                                        blurRadius: 8,
                                                      )
                                                    ]),
                                                height: 36,
                                                width: 36,
                                                child: Center(
                                                  child: Icon(
                                                    Iconsax.bubble,
                                                    color: AppColors.green,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(16),
                                                    bottomLeft: Radius.circular(16),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                                  child: Container(
                                                    width: 76,
                                                    child: Center(
                                                      child: Text(
                                                        'Good!',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          height: 16 / 12,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: 'SVN-Poppins',
                                                          fontStyle: FontStyle.normal,
                                                          color: AppColors.green,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              /// after appbar
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                          "Latest News",
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
              ),
              SliverToBoxAdapter(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return NewsWidget();
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: 8,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
