import 'package:flutter/material.dart';

import '../../../constants/images.dart';
import '../../../model/title_news_model.dart';

class NewsCard extends StatelessWidget {
  final  TitleNewsModel tititleNewsModel;
  const NewsCard({Key? key,  required this.tititleNewsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: tititleNewsModel.type == "text",
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              tititleNewsModel.title??"",
              style: TextStyle(
                fontSize: 12,
                height: 16 / 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'SVN-Poppins',
              ),
            ),
          ),
        ),
        Visibility(
          visible: tititleNewsModel.type == "image",
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 176,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  tititleNewsModel.title??"",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
