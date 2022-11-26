// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';


// //import others
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class onboardingScreen2 extends StatelessWidget {
//   const onboardingScreen2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Change status bar color to white
//     return AnnotatedRegion(
//       value: SystemUiOverlayStyle(
//           statusBarBrightness: Brightness.dark,
//           statusBarIconBrightness: Brightness.light,
//           statusBarColor: Colors.transparent),
//       child: Scaffold(
//         body: Container(
//           padding: EdgeInsets.all(38),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(backgroundOnboarding), fit: BoxFit.cover),
//           ),
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(top: 140),
//                         width: 240,
//                         height: 372,
//                         decoration: BoxDecoration(
//                             color: white.withOpacity(0.5),
//                             borderRadius: BorderRadius.circular(30)
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 122),
//                         width: 270,
//                         height: 372,
//                         decoration: BoxDecoration(
//                             color: white.withOpacity(0.5),
//                             borderRadius: BorderRadius.circular(30)
//                         ),
//                       ),
//                       Container(
//                           padding:
//                               EdgeInsets.only(top: 142, left: 19, right: 19),
//                           margin: EdgeInsets.only(top: 104),
//                           height: 372,
//                           decoration: BoxDecoration(
//                               color: white,
//                               borderRadius: BorderRadius.circular(30)
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     'Build the target' + '\n' + 'you want',
//                                     style: TextStyle(
//                                       fontFamily: 'Poppins',
//                                       fontSize: title32,
//                                       color: black,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                     textAlign: TextAlign.left,
//                                   )
//                               ),
//                               SizedBox(height: 8),
//                               Container(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     'Build the target you want.' + '\n' + 'Customize Grow to make it work' + '\n' + 'the way you want it to.',
//                                     style: TextStyle(
//                                         fontFamily: 'Poppins',
//                                         fontSize: content16,
//                                         color: black,
//                                         fontWeight: FontWeight.w400,
//                                         height: 1.6),
//                                     textAlign: TextAlign.left,
//                                   )
//                               ),
//                             ],
//                           )
//                       ),
//                     ],
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     child: Image.asset(obTargetDynamic, scale: 1),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
