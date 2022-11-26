import 'package:hackathon2022/constants/images.dart';

import 'model/title_news_model.dart';

class AppConstants {
  List<String> filterItem = ["Pickup", "Sort", "Top Eats", "Price Range", "Dietary", "People"];
  List<String> title = ["Plants", "Ecosystem", "Daily"];
  List<TitleNewsModel> ListTitle = [
    TitleNewsModel(
      title:
          "The National Arbor Day Foundation and American Forests Global Releaf 2000 have shown to us a large number of reasons why we should plant trees.",
      type: "text"
    ),
    TitleNewsModel(
      title:
      ImageAssets.post_png,
      type: "image",
    ),
    TitleNewsModel(
      title:
      "1. Trees conserve energy in the summer and save you money. Properly planted trees can cut your air-conditioning costs by 15 to 35 %. Trees reduce the amount of re-radiated and reflected heat from streets, buildings, and sidewalks.",
      type: "text",
    ),
    TitleNewsModel(
      title:
      "2. Trees conserve energy in the winter. Trees can slow cold winter winds and can cut your heating costs 10 to 20 %.",
      type: "text",
    ),
    TitleNewsModel(
      title:
      "3. Trees help clean the air. Trees produce the pure oxygen we breathe, and remove air pollution by lowering air temperature, through respiration and by retaining particulates.",
      type: "text",
    ),
    TitleNewsModel(
      title:
      ImageAssets.post_png,
      type: "image",
    ),
    TitleNewsModel(
      title:
      "4. Trees bring songbirds close by. Bird songs will fill the air as trees provide nesting sites, food, and cover for countless species.",
      type: "text",
    ),
    TitleNewsModel(
      title:
      "5. Trees shelter and nourish wildlife from bears to bald eagles and salmon to salamanders.",
      type: "text",
    ),
    TitleNewsModel(
      title:
      "6. Trees reduce the cost of controlling stormwater. Trees reduce the peak stormwater flow; they increase the time to reach peak flow; and trees decrease total runoff volume.",
      type: "text",
    ),
  ];
}
