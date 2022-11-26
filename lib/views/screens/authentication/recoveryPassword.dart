// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';


// //import others
// import 'package:flutter/services.dart';
// import 'package:blur/blur.dart';

// class recoveryScreen extends StatefulWidget {
//   _RePasswordPageState createState() => _RePasswordPageState();
// }

// class _RePasswordPageState extends State<recoveryScreen> {

//   TextEditingController emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion(
//         value: SystemUiOverlayStyle(
//             statusBarBrightness: Brightness.light,
//             statusBarIconBrightness: Brightness.light,
//             statusBarColor: Colors.transparent),
//         child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             body: Container(
//               padding: EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(App.backgroundAuthentication), fit: BoxFit.cover),
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: 32),
//                   Container(
//                     alignment: Alignment.center,
//                     child: Image.asset(atSalyWorking, scale: 1),
//                   ),
//                   SizedBox(height: 18),
//                   Container(
//                     child: Text(
//                       'Recovery Password',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         fontSize: title28,
//                         color: black,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Container(
//                     child: Text(
//                       ' Just enter the email address you’ve used to' + '\n' + 'register with us and we’ll send you a reset link!',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontSize: content14,
//                         color: black,
//                         fontWeight: FontWeight.w400
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 19),
//                   Container(
//                     width: 300,
//                     height: 50,
//                     margin: EdgeInsets.symmetric(vertical: 12),
//                     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: purpleLight
//                     ),
//                     alignment: Alignment.topLeft,
//                     child: TextFormField(
//                       controller: emailController,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintStyle: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: content14,
//                           color: greyDark,
//                           fontWeight: FontWeight.w500
//                         ),
//                         hintText: "Enter your email",
//                       )
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(right: 19),
//                     alignment: Alignment.topRight,
//                     child: GestureDetector(
//                           onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => instructionScreen(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'Instruction manual',
//                         style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontSize: suggestion12,
//                             color: greyDark,
//                             fontWeight: FontWeight.w500,
//                             height: 1.6
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Stack(
//                     children: [
//                     Container(
//                       padding: EdgeInsets.only(top: 36, left: 22),
//                       child: Stack(
//                         alignment: Alignment.topCenter,
//                         children: [
//                           Container(
//                             height: 54,
//                             width: 260,
//                             decoration: BoxDecoration(
//                               color: purpleDark.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: black.withOpacity(0.25),
//                                   spreadRadius: 0,
//                                   blurRadius: 4,
//                                   offset: Offset(0, 4),
//                                 ),
//                                 BoxShadow(
//                                   color: black.withOpacity(0.1),
//                                   spreadRadius: 0,
//                                   blurRadius: 60,
//                                   offset: Offset(10, 10),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Blur(
//                             blur: 10,
//                             blurColor: whiteLight.withOpacity(0.3),
//                             child: Container(
//                               height: 64,
//                               width: 278,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                         padding: EdgeInsets.only(top: 26),
//                         alignment: Alignment.center,
//                         child: GestureDetector(
//                           // onTap: () => controlRePassword(),
//                           onTap: () {
//                             resetPasswordUser(emailController.text, context);
//                           },
//                           child: AnimatedContainer(
//                             alignment: Alignment.center,
//                             duration: Duration(milliseconds: 300),
//                             height: 54,
//                             width: 260,
//                             decoration: BoxDecoration(
//                               color: purpleDark,
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: black.withOpacity(0.25),
//                                   spreadRadius: 0,
//                                   blurRadius: 4,
//                                   offset: Offset(0, 4),
//                                 ),
//                                 BoxShadow(
//                                   color: black.withOpacity(0.1),
//                                   spreadRadius: 0,
//                                   blurRadius: 60,
//                                   offset: Offset(10, 10),
//                                 ),
//                               ],
//                             ),
//                             child: Text(
//                               "Recovery Password",
//                               style: TextStyle(
//                                   color: white,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: textButton),
//                             ),
//                           ),
//                         )
//                     )
//                     ]
//                   ),
//                   SizedBox(height: 8),
//                   Container(
//                       alignment: Alignment.center,
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.pop(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => signinScreen(),
//                             ),
//                           );
//                         },
//                         child: AnimatedContainer(
//                           alignment: Alignment.center,
//                           duration: Duration(milliseconds: 300),
//                           height: 54,
//                           width: 260,
//                           decoration: BoxDecoration(
//                             color: whiteLight.withOpacity(0.9),
//                             border: Border(
//                               top: BorderSide(width: 3, color: Color(0xff9857CB)),
//                               left: BorderSide(width: 3, color: Color(0xff9857CB)),
//                               right: BorderSide(width: 3, color: Color(0xff9857CB)),
//                               bottom: BorderSide(width: 3, color: Color(0xff9857CB)),
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: [
//                                 BoxShadow(
//                                   color: black.withOpacity(0.25),
//                                   spreadRadius: 0,
//                                   blurRadius: 4,
//                                   offset: Offset(0, 4),
//                                 ),
//                                 BoxShadow(
//                                   color: black.withOpacity(0.1),
//                                   spreadRadius: 0,
//                                   blurRadius: 60,
//                                   offset: Offset(10, 10),
//                                 ),
//                               ],
//                           ),
//                           child: Text(
//                               "Cancel",
//                               style: TextStyle(
//                                   color: purpleDark,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: textButton),
//                           )
//                         ),
//                       )
//                   )
//                 ],
//               ),
//             )
//         )
//     );
//   }

//   //Create function
//   controlRePassword() {}
// }
