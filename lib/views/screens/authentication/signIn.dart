import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:blur/blur.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon2022/controllers/authController.dart';
import 'package:hackathon2022/views/screens/authentication/recoveryPassword.dart';
import 'package:hackathon2022/views/screens/authentication/signUp.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';

class signinScreen extends StatefulWidget {
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<signinScreen> {
  bool isHiddenPassword = true;

  // final formKey = new GlobalKey<FormState>();

  // final emailController = TextEditingController();

  // final passwordController = TextEditingController();

  // // final authService = Provider.of<AuthService>(context);

  // late String email, password;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String email, password, userid;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // void login() {
  //   if (formKey.currentState!.validate()) {
  //     formKey.currentState!.save();
  //     signin(email, password, context).then((value) {
  //       if (value != null) {
  //         Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => TasksPage(required, uid: value.uid),
  //             ));
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(color: AppColors.white),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 48),
              Container(
                height: 50,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.iconApp2),
                      fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: 48),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 39, right: 39),
                      width: width,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(top: 26),
                            child: const Text(
                                'Sign In to' + '\n' + 'Govern Together!',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: AppColors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          SizedBox(height: 40),
                          Form(
                            key: formKey,
                            child: Container(
                              width: 335,
                              height: 64,
                              margin: const EdgeInsets.symmetric(vertical: 13),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.white),
                              alignment: Alignment.topLeft,
                              child: TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: [AutofillHints.email],
                                  // validator: (email) => email != null &&
                                  //         !EmailValidator.validate(email)
                                  //     ? 'Enter a valid email'
                                  //     : null,
                                  // validator: MultiValidator([
                                  //   RequiredValidator(
                                  //       errorText: "This Field Is Required"),
                                  //   EmailValidator(
                                  //       errorText: "Invalid Email Address"),
                                  // ]),
                                  // onChanged: (val) {
                                  //   email = val;
                                  // },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: AppColors.grey900,
                                    ),
                                    hintText: "Enter your email",
                                  )),
                            ),
                          ),
                          Form(
                            // key: formKey,
                            child: Container(
                              width: 335,
                              height: 64,
                              margin: EdgeInsets.symmetric(vertical: 13),
                              padding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.white),
                              alignment: Alignment.topLeft,
                              child: TextFormField(
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  autofillHints: [AutofillHints.password],
                                  // validator: (value) => value.isEmpty
                                  //     ? 'Password is required'
                                  //     : null,
                                  // validator: MultiValidator([
                                  //   RequiredValidator(
                                  //       errorText: "Password Is Required"),
                                  //   MinLengthValidator(6,
                                  //       errorText:
                                  //           "Minimum 6 Characters Required"),
                                  // ]),
                                  // onChanged: (val) {
                                  //   password = val;
                                  // },
                                  obscureText: isHiddenPassword,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                        onTap: _togglePasswordView,
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
                                    border: InputBorder.none,
                                    hintText: "Enter your password",
                                    hintStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: AppColors.grey900),
                                  )),
                            ),
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(top: 16),
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => recoveryScreen()),
                                  // );
                                },
                                child: const Text('Recovery password',
                                    style: TextStyle(
                                      color: AppColors.grey700,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    )),
                              )),
                          Container(
                              padding: EdgeInsets.only(top: 16),
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () => loginUser(emailController.text,
                                    passwordController.text, context),
                                // onTap: () => login(),
                                child: AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 300),
                                  height: 56,
                                  width: 335,
                                  decoration: BoxDecoration(
                                    color: AppColors.alt500,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.black.withOpacity(0.4),
                                        spreadRadius: 0,
                                        blurRadius: 8,
                                        offset: Offset(0, 10),
                                      ),
                                      BoxShadow(
                                        color: AppColors.black.withOpacity(0.1),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(4, 0),
                                      ),
                                    ],
                                  ),
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                              )),
                          SizedBox(height: 8),
                          Container(
                              alignment: Alignment.topCenter,
                              child: const Text(
                                "or continue with",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: AppColors.grey200,
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
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              ImageAssets.googleIcon)),
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
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              ImageAssets.facebookIcon)),
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
                                  child: const Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  )),
                              Container(
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => signupScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Register here!",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: AppColors.alt900,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    )),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Create function
  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
