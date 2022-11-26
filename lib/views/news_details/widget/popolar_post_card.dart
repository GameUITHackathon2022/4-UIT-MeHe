import 'package:flutter/material.dart';
import 'package:hackathon2022/constants.dart';
import 'package:hackathon2022/constants/images.dart';

import '../../../constants/colors.dart';

class PopularPostCard extends StatelessWidget {
  const PopularPostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 92,
              width: 112,
              child: Image.asset(
                ImageAssets.post_png,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Threats to whales",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 20 / 14,
                    fontFamily: 'SVN-Poppins',
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 8),
                  child: Text(
                    "Threats to whales include commercial whaling, pollution, ozone depletion, global warming an whale watching.",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      height: 12 / 8,
                      fontFamily: 'SVN-Poppins',
                      fontStyle: FontStyle.normal,
                    ),
                    maxLines: 4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    3,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
