import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackathon2022/constants/colors.dart';

//import constants

void showSnackBar(context, text, category) {
  final snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon((category == "error") ? Icons.error_outline : Icons.verified,
            size: 24, color: AppColors.alt900),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
        ),
      ],
    ),
    backgroundColor: AppColors.white,
    duration: Duration(seconds: 3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.symmetric(horizontal: 24),
    behavior: SnackBarBehavior.floating,
    elevation: 0,
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
