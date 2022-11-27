import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon2022/constants/colors.dart';
import 'package:hackathon2022/views/main_home/widget/chanllenges_page.dart';
import 'package:hackathon2022/views/main_home/widget/news_widget.dart';
import 'package:hackathon2022/views/widgets/FABBottomBarNavigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import '../../constants.dart';
import '../../constants/images.dart';
import '../../speech_text_recognizer.dart';
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
  String _lastSelected = 'TAB: 0';

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
      if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChallengesPage()));
      }
    });
  }

  String recognizedText = "Recognize text is";
  bool isEnabled = false;

  List<String> keyWords = [
    'hello',
    'hi',
    'morning',
    'afternoon',
    'night',
    'home',
    'campaign',
    'challenge',
    'weather',
    'oxygen',
    'news',
    'reward',
    'point',
    'are you',
    'your name',
    'environment',
    'call you'
  ];
  List<String> audioUrls = [
    'https://audio.jukehost.co.uk/lh0kVoUpY0f5BYWG0HPL780i4I80gzpd', // Hello
    'https://audio.jukehost.co.uk/gn3vIz1e8L3df2Yj0ryhmYq1XKxRqmfo', // Command
    'https://audio.jukehost.co.uk/FZ3uuu1psGYf3Lq2aZNAuXSM8khETFgM', // Null
    'https://audio.jukehost.co.uk/6uTRQP9fxXk02a4krGheheyMgOX68Nxp', // Weather, oxygen
    'https://audio.jukehost.co.uk/40lDo8Bx3Chcfv1kIyDbZmarwD8WLWua', // News
    'https://audio.jukehost.co.uk/DFgm5v8jW3Cfi79qNheQxb1UBHw70gDl', // Reward
    'https://audio.jukehost.co.uk/jGna2HrVKx3uni24QdJWRcEwtXlU7Dhl', // Who are you?
    'https://audio.jukehost.co.uk/H5viVFxquTm1E8reawdDu9m3WZlHR3Kv', // Environment
  ];

  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _checkSpeechAvailability();
  }

  playAudio(item) {
    audioPlayer.play(item);
  }

  _checkSpeechAvailability() async {
    isEnabled = await SpeechTextRecognizer.initialize();
    setState(() {});
  }

  _recognizedText() {
    SpeechTextRecognizer.startListning(speechRecogListner);
  }

  void speechRecogListner(SpeechRecognitionResult result) {
    print(result.recognizedWords);
    //keyword value
    recognizedText = result.recognizedWords;
    String thisKeyWord = '';
    for (int i = 0; i < keyWords.length; i++) {
      if (recognizedText.toLowerCase().contains(keyWords[i])) {
        thisKeyWord = keyWords[i];
        break;
      }
    }
    if (result.finalResult == true) {
      switch (thisKeyWord) {
        case 'hi':
        case 'hello':
        case 'morning':
        case 'afternoon':
        case 'night':
          playAudio(audioUrls[0]);
          break;
        case 'home':
          playAudio(audioUrls[1]);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainHomePage()));
          break;
        case 'campaign':
          playAudio(audioUrls[1]);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => MainHomePage()));
          break;
        case 'challenge':
          playAudio(audioUrls[1]);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChallengesPage()));
          break;
        case 'weather':
        case 'oxygen':
          playAudio(audioUrls[3]);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainHomePage()));
          break;
        case 'news':
          playAudio(audioUrls[4]);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainHomePage()));
          break;
        case 'point':
        case 'reward':
          playAudio(audioUrls[5]);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChallengesPage()));
          break;
        case 'are you':
        case 'your name':
        case 'call you':
          playAudio(audioUrls[6]);
          break;
        case 'environment':
          playAudio(audioUrls[7]);
          break;
        default:
          playAudio(audioUrls[2]);
          break;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _selectedFab,
        items: [
          FABBottomAppBarItem(iconData: Iconsax.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Iconsax.flag_2, text: 'Campaign'),
          FABBottomAppBarItem(iconData: Iconsax.cup, text: 'Challenge'),
          FABBottomAppBarItem(iconData: Iconsax.user, text: 'Account'),
        ],
        backgroundColor: AppColors.white,
        color: AppColors.grey900,
        notchedShape: const CircularNotchedRectangle(),
        selectedColor: AppColors.alt700,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          SpeechTextRecognizer.isListning()
              ? SpeechTextRecognizer.stopListning
              : _recognizedText();
        },
        child: Container(
          height: 55,
          width: 55,
          decoration: const BoxDecoration(
            color: AppColors.alt700,
            shape: BoxShape.circle,
          ),
          child:
              const Icon(Iconsax.emoji_happy, color: AppColors.white, size: 24),
        ),
      ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                                    fontWeight: FontWeight.w400,
                                    height: 16 / 12,
                                    color: AppColors.black,
                                    fontSize: 12),
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
                              padding: const EdgeInsets.only(
                                  left: 16, right: 9, bottom: 16),
                              child: SvgPicture.asset(
                                  VectorImageAssets.filter_svg),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Container(
                                  height: 33,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(right: 16),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return FilterCard(
                                        filterItem:
                                            AppConstants().filterItem[index],
                                        onSelected: (bool value) {
                                          if (value) {
                                            selectedItem.add(AppConstants()
                                                .filterItem[index]);
                                          } else {
                                            selectedItem.removeWhere(
                                                (element) =>
                                                    element ==
                                                    AppConstants()
                                                        .filterItem[index]);
                                          }
                                        },
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
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
                                        border: Border.all(
                                            color: AppColors.grey200),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFF282828)
                                                .withOpacity(0.08),
                                            offset: Offset(2, 2),
                                            blurRadius: 8,
                                          )
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, bottom: 12, left: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color(0xFF282828)
                                                            .withOpacity(0.08),
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    bottomLeft:
                                                        Radius.circular(16),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8,
                                                      vertical: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Sunny',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          height: 16 / 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              'SVN-Poppins',
                                                          fontStyle:
                                                              FontStyle.normal,
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              'SVN-Poppins',
                                                          fontStyle:
                                                              FontStyle.normal,
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
                                        border: Border.all(
                                            color: AppColors.grey200),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFF282828)
                                                .withOpacity(0.08),
                                            offset: Offset(2, 2),
                                            blurRadius: 8,
                                          )
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, bottom: 12, left: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color(0xFF282828)
                                                            .withOpacity(0.08),
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    bottomLeft:
                                                        Radius.circular(16),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8,
                                                      vertical: 10),
                                                  child: Container(
                                                    width: 76,
                                                    child: Center(
                                                      child: Text(
                                                        'Good!',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          height: 16 / 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              'SVN-Poppins',
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color:
                                                              AppColors.green,
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
