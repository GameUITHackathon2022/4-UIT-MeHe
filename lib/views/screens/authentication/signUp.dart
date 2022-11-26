import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import firebase
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:flutter/services.dart';
import 'package:blur/blur.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:hackathon2022/constants/colors.dart';
import 'package:hackathon2022/constants/images.dart';
import 'package:hackathon2022/controllers/authController.dart';
import 'package:hackathon2022/views/screens/authentication/signIn.dart';
import 'package:hackathon2022/views/widgets/snackBarWidget.dart';
import 'package:iconsax/iconsax.dart';

class signupScreen extends StatefulWidget with InputValidationMixin {
  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signupScreen> with InputValidationMixin {
  bool isHiddenPassword = true;
  bool checkBoxValue = false;

  final GlobalKey<FormState> _formEmailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPasswordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPhoneNumberKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Color notiColorEmail = Colors.red;
  Color notiColorName = Colors.red;
  Color notiColorPhoneNumber = Colors.red;
  Color notiColorPassword = Colors.red;

  // late String email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                decoration: const BoxDecoration(color: AppColors.white),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(height: 28),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 32, left: 37),
                        child: const Text(
                          "Sign Up to join with " + "\n" + "Ecolour",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      // Container(
                      //   alignment: Alignment.topRight,
                      //   child: Image.asset(atPhoneExciting, scale: 1),
                      // ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Container(
                      child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 36, right: 36),
                        child: Column(
                          children: [
                            Form(
                                key: _formEmailKey,
                                child: Stack(
                                  children: [
                                    TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      autofillHints: [AutofillHints.email],
                                      style:
                                          TextStyle(color: AppColors.grey900),
                                      decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                            child: Stack(
                                                alignment:
                                                    Alignment.centerRight,
                                                children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.error_outline,
                                                      size: 24,
                                                      color: notiColorEmail),
                                                  tooltip:
                                                      'Your email must be valid',
                                                ),
                                              )
                                            ])),
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 8),
                                        hintStyle: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          color: AppColors.grey900,
                                        ),
                                        hintText: "Enter your email",
                                        filled: true,
                                        fillColor: AppColors.alt100,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorStyle: TextStyle(
                                          color: Colors.transparent,
                                          fontSize: 0,
                                          height: 0,
                                          // foreground: Paint()..shader = redGradient
                                        ),
                                      ),
                                      //validator
                                      validator: (email) {
                                        if (isEmailValid(email.toString())) {
                                          WidgetsBinding.instance!
                                              .addPostFrameCallback((_) {
                                            setState(() {
                                              notiColorEmail = AppColors.green;
                                            });
                                          });
                                          return null;
                                        } else {
                                          WidgetsBinding.instance!
                                              .addPostFrameCallback((_) {
                                            setState(() {
                                              notiColorEmail = AppColors.error;
                                            });
                                          });
                                          return '';
                                        }
                                      },
                                    ),
                                  ],
                                )),
                            SizedBox(height: 20),
                            Form(
                                key: _formNameKey,
                                child: Stack(
                                  children: [
                                    TextFormField(
                                      controller: nameController,
                                      keyboardType: TextInputType.name,
                                      autofillHints: [AutofillHints.name],
                                      style:
                                          TextStyle(color: AppColors.grey900),
                                      decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                            child: Stack(
                                                alignment:
                                                    Alignment.centerRight,
                                                children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.error_outline,
                                                      size: 24,
                                                      color: notiColorName),
                                                  tooltip:
                                                      'Your name must have more than 3 characters',
                                                ),
                                              )
                                            ])),
                                        contentPadding:
                                            EdgeInsets.only(left: 20, right: 8),
                                        hintStyle: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          color: AppColors.grey900,
                                        ),
                                        hintText: "Enter your name",
                                        filled: true,
                                        fillColor: AppColors.alt100,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorStyle: const TextStyle(
                                          color: Colors.transparent,
                                          fontSize: 0,
                                          height: 0,
                                          // foreground: Paint()..shader = redGradient
                                        ),
                                      ),
                                      //validator
                                      validator: (name) {
                                        if (isNameValid(name.toString())) {
                                          WidgetsBinding.instance!
                                              .addPostFrameCallback((_) {
                                            setState(() {
                                              notiColorName = AppColors.green;
                                            });
                                          });
                                          return null;
                                        } else {
                                          WidgetsBinding.instance!
                                              .addPostFrameCallback((_) {
                                            setState(() {
                                              notiColorName = AppColors.error;
                                            });
                                          });
                                          return '';
                                        }
                                      },
                                    ),
                                  ],
                                )),
                            // Form(
                            //   autovalidate: true,
                            //   key: _formNameKey,
                            //   child: TextFormField(
                            //     controller: nameController,
                            //     keyboardType: TextInputType.name,
                            //     autofillHints: [AutofillHints.name],
                            //     style: TextStyle(color: AppColors.grey900),
                            //     decoration: InputDecoration(
                            //       contentPadding:
                            //           EdgeInsets.only(left: 20, right: 20),
                            //       hintStyle: TextStyle(
                            //         fontFamily: 'Poppins',
                            //         fontSize: 14,
                            //         color: AppColors.grey900,
                            //       ),
                            //       hintText: "Enter your name",
                            //       filled: true,
                            //       fillColor: AppColors.alt100,
                            //       border: OutlineInputBorder(
                            //         borderSide: BorderSide.none,
                            //         borderRadius: BorderRadius.circular(10.0),
                            //       ),
                            //       errorStyle: TextStyle(
                            //           foreground: Paint()
                            //             ..shader = AppColors.errorGradient),
                            //     ),
                            //     //validator
                            //     // validator: MultiValidator([
                            //     //   RequiAppColors.errorValidator(
                            //     //       errorText: "Please enter your name"),
                            //     //   MinLengthValidator(3,
                            //     //       errorText: "Your name must be at least 3 digits length"),
                            //     // ]),
                            //     // onChanged: (String? value) {
                            //     //   name = value;
                            //     // },
                            //     validator: (name) {
                            //       if (isNameValid(name.toString()))
                            //         return null;
                            //       else
                            //         return 'Enter a valid name';
                            //     },
                            //   ),
                            // ),
                            SizedBox(height: 20),
                            Form(
                                key: _formPhoneNumberKey,
                                child: Stack(
                                  children: [
                                    TextFormField(
                                      controller: phoneNumberController,
                                      keyboardType: TextInputType.phone,
                                      autofillHints: [
                                        AutofillHints.telephoneNumber
                                      ],
                                      style:
                                          TextStyle(color: AppColors.grey900),
                                      decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                            child: Stack(
                                                alignment:
                                                    Alignment.centerRight,
                                                children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.error_outline,
                                                      size: 24,
                                                      color:
                                                          notiColorPhoneNumber),
                                                  tooltip:
                                                      'Your phone numbers must be valid',
                                                ),
                                              )
                                            ])),
                                        contentPadding:
                                            EdgeInsets.only(left: 20, right: 8),
                                        hintStyle: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          color: AppColors.grey900,
                                        ),
                                        hintText: "Enter your phone numbers",
                                        filled: true,
                                        fillColor: AppColors.alt100,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorStyle: TextStyle(
                                          color: Colors.transparent,
                                          fontSize: 0,
                                          height: 0,
                                          // foreground: Paint()..shader = AppColors.errorGradient
                                        ),
                                      ),
                                      //validator
                                      validator: (phoneNumber) {
                                        if (isPhoneNumberValid(
                                            phoneNumber.toString())) {
                                          WidgetsBinding.instance!
                                              .addPostFrameCallback((_) {
                                            setState(() {
                                              notiColorPhoneNumber =
                                                  AppColors.green;
                                            });
                                          });
                                          return null;
                                        } else {
                                          WidgetsBinding.instance!
                                              .addPostFrameCallback((_) {
                                            setState(() {
                                              notiColorPhoneNumber =
                                                  AppColors.error;
                                            });
                                          });
                                          return '';
                                        }
                                      },
                                    ),
                                  ],
                                )),
                            // Form(
                            //   autovalidate: true,
                            //   key: _formPhoneNumberKey,
                            //   child: TextFormField(
                            //     controller: phoneNumberController,
                            //     keyboardType: TextInputType.phone,
                            //     autofillHints: [AutofillHints.telephoneNumber],
                            //     style: TextStyle(color: AppColors.grey900),
                            //     decoration: InputDecoration(
                            //       contentPadding:
                            //           EdgeInsets.only(left: 20, right: 20),
                            //       hintStyle: TextStyle(
                            //         fontFamily: 'Poppins',
                            //         fontSize: 14,
                            //         color: AppColors.grey900,
                            //       ),
                            //       hintText: "Enter your phone numbers",
                            //       filled: true,
                            //       fillColor: AppColors.alt100,
                            //       border: OutlineInputBorder(
                            //         borderSide: BorderSide.none,
                            //         borderRadius: BorderRadius.circular(10.0),
                            //       ),
                            //       errorStyle: TextStyle(
                            //           foreground: Paint()
                            //             ..shader = AppColors.errorGradient),
                            //     ),
                            //     //validator
                            //     // validator: MultiValidator([
                            //     //   RequiAppColors.errorValidator(
                            //     //       errorText: "Please enter your phone numbers"),
                            //     //   MinLengthValidator(10,
                            //     //       errorText:
                            //     //           "Your phone numbers is not valid"),
                            //     // ]),
                            //     // onChanged: (String? value) {
                            //     //   phoneNumber = value;
                            //     // },
                            //     validator: (phoneNumber) {
                            //       if (isPhoneNumberValid(
                            //           phoneNumber.toString()))
                            //         return null;
                            //       else
                            //         return 'Enter a valid phone numbers';
                            //     },
                            //   ),
                            // ),
                            SizedBox(height: 20),
                            Row(children: [
                              Container(
                                width: 248,
                                child: Form(
                                  key: _formPasswordKey,
                                  child: TextFormField(
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    autofillHints: [AutofillHints.password],
                                    obscureText: isHiddenPassword,
                                    style: TextStyle(color: AppColors.grey900),
                                    decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                          // onTap: _togglePasswordView,
                                          child: Container(
                                        width: 56,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            // isHiddenPassword
                                            //     ? Stack(
                                            //         alignment: Alignment
                                            //             .centerRight,
                                            //         children: [
                                            //             Container(
                                            //                 padding: EdgeInsets
                                            //                     .only(
                                            //                         right:
                                            //                             8),
                                            //                 child: SvgPicture.asset(
                                            //                     eyeVisibility,
                                            //                     color:
                                            //                         AppColors.grey900,
                                            //                     height:
                                            //                         24,
                                            //                     width:
                                            //                         24))
                                            //           ])
                                            //     : Stack(
                                            //         alignment: Alignment
                                            //             .centerRight,
                                            //         children: [
                                            //             Container(
                                            //                 padding: EdgeInsets
                                            //                     .only(
                                            //                         right:
                                            //                             8),
                                            //                 child: SvgPicture.asset(
                                            //                     eyeInvisibility,
                                            //                     color:
                                            //                         AppColors.grey900,
                                            //                     height:
                                            //                         24,
                                            //                     width:
                                            //                         24))
                                            //           ]),
                                            Stack(
                                                alignment:
                                                    Alignment.centerRight,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        right: 8),
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                          Icons.error_outline,
                                                          size: 24,
                                                          color:
                                                              notiColorPassword),
                                                      tooltip:
                                                          'Your password must have more than 6 characters',
                                                    ),
                                                  )
                                                ])
                                          ],
                                        ),
                                      )),
                                      contentPadding:
                                          EdgeInsets.only(left: 20, right: 8),
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: AppColors.grey900,
                                      ),
                                      hintText: "Enter your password",
                                      filled: true,
                                      fillColor: AppColors.alt100,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorStyle: TextStyle(
                                        color: Colors.transparent,
                                        fontSize: 0,
                                        height: 0,
                                        // foreground: Paint()..shader = AppColors.errorGradient
                                      ),
                                    ),
                                    //validator
                                    validator: (password) {
                                      if (isPasswordValid(
                                          password.toString())) {
                                        WidgetsBinding.instance!
                                            .addPostFrameCallback((_) {
                                          setState(() {
                                            notiColorPassword = AppColors.green;
                                          });
                                        });
                                        return null;
                                      } else {
                                        WidgetsBinding.instance!
                                            .addPostFrameCallback((_) {
                                          setState(() {
                                            notiColorPassword = AppColors.error;
                                          });
                                        });
                                        return '';
                                      }
                                    },
                                  ),
                                ),
                              ),
                              new Spacer(),
                              InkWell(
                                onTap: _togglePasswordView,
                                child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: isHiddenPassword
                                            ? AppColors.alt100
                                            : AppColors.alt900,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: isHiddenPassword
                                        ? const Icon(
                                            Iconsax.eye_slash,
                                            color: AppColors.grey900,
                                            size: 24,
                                          )
                                        : const Icon(
                                            Iconsax.eye,
                                            color: AppColors.grey900,
                                            size: 24,
                                          )),
                              )
                            ])
                          ],
                        ),
                      )
                    ],
                  )),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 23.0),
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: new CustomCheckBox(
                            value: checkBoxValue,
                            shouldShowBorder: true,
                            borderColor: AppColors.black,
                            checkedFillColor: AppColors.white,
                            checkedIconColor: AppColors.black,
                            borderRadius: 4,
                            borderWidth: 1.5,
                            checkBoxSize: 16,
                            // onChanged: _activeCheckAccept,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkBoxValue = newValue;
                              });
                            }),
                      ),
                      Container(
                        child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => conditionScreen(),
                              //   ),
                              // );
                            },
                            child: Text(
                              "Accept terms & Conditions",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        if (_formEmailKey.currentState!.validate() &&
                            _formNameKey.currentState!.validate() &&
                            _formPhoneNumberKey.currentState!.validate() &&
                            _formPasswordKey.currentState!.validate()) {
                          if (checkBoxValue == true) {
                            _formEmailKey.currentState!.save();
                            _formNameKey.currentState!.save();
                            _formPhoneNumberKey.currentState!.save();
                            _formPasswordKey.currentState!.save();
                            registerUser(
                                emailController.text,
                                passwordController.text,
                                nameController.text,
                                phoneNumberController.text,
                                context);
                          } else {
                            showSnackBar(context,
                                'Please accept terms & conditions!', 'error');
                          }
                        } else {
                          showSnackBar(
                              context, 'Please confirm validation!', 'error');
                        }
                      },
                      child: AnimatedContainer(
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 300),
                          height: 54,
                          width: 260,
                          decoration: BoxDecoration(
                            color: AppColors.alt900,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.white.withOpacity(0.1),
                                spreadRadius: 0,
                                blurRadius: 64,
                                offset: Offset(
                                    15, 15), // changes position of shadow
                              ),
                              BoxShadow(
                                color: AppColors.white.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 20,
                                offset:
                                    Offset(8, 8), // changes position of shadow
                              ),
                            ],
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          )),
                    ),
                  ),
                  SizedBox(height: 32),
                  Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "or sign up with",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.grey100,
                            fontSize: 12),
                      )),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () => googleSignIn(context),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImageAssets.googleIcon)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () => facebookSignIn(context),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImageAssets.facebookIcon)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Already have an account? ",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          )),
                      Container(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => signinScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Login here!",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: AppColors.alt900,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            )),
                      )
                    ],
                  ),
                ]))));
  }

  //Create function
  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}

//Create validation
mixin InputValidationMixin {
  bool isEmailValid(String email) {
    RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  bool isNameValid(String name) => name.length >= 3;

  bool isPasswordValid(String password) => password.length >= 6;

  bool isPhoneNumberValid(String phoneNumber) {
    RegExp regex = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regex.hasMatch(phoneNumber);
  }
}
