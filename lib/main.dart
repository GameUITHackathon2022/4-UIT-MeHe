import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon2022/constants/colors.dart';
import 'package:hackathon2022/firebase_options.dart';
import 'package:hackathon2022/views/main_home/main_home_page.dart';
import 'package:hackathon2022/views/screens/authentication/signIn.dart';
import 'package:iconsax/iconsax.dart';

import 'views/widgets/FABBottomBarNavigation.dart';
import 'dart:ffi';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'speech_text_recognizer.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'hi',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
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
          //pushtoHome
          break;
        case 'campaign':
          playAudio(audioUrls[1]);
          //pushtoCampaign
          break;
        case 'challenge':
          playAudio(audioUrls[1]);
          //pushtoChallenge
          break;
        case 'weather':
        case 'oxygen':
          playAudio(audioUrls[3]);
          //pushtoHome
          break;
        case 'news':
          playAudio(audioUrls[4]);
          //pushtoHome
          break;
        case 'point':
        case 'reward':
          playAudio(audioUrls[5]);
          //pushtoChallenge
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
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
    );
  }
}
