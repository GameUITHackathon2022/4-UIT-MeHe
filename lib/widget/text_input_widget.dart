import 'package:flutter/material.dart';
import 'package:hackathon2022/constants/colors.dart';

class TextInputWidget extends StatelessWidget {
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? validatorText;
  final TextEditingController? textEditingController;
  final bool obscureText;
  final Function()? onTapSuffixIcon;
  final Color? fillColor;
  final int? minLine;
  final int? maxLine;
  const TextInputWidget({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validatorText,
    this.textEditingController,
    this.obscureText = false,
    this.onTapSuffixIcon,
    this.fillColor, this.minLine, this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLine,
      maxLines: maxLine,
      obscureText: obscureText,
      initialValue: null,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: fillColor?.withOpacity(0.6),
          fontWeight: FontWeight.w400,
        ),
        contentPadding: prefixIcon != null
            ? EdgeInsets.symmetric(vertical: 15)
            : EdgeInsets.symmetric(
            vertical: 15, horizontal: 20),
        prefixIcon: prefixIcon,
        suffixIcon: onTapSuffixIcon == null
            ? suffixIcon
            : GestureDetector(
          onTap: onTapSuffixIcon,
          child: suffixIcon,
        ),
        fillColor: fillColor ?? AppColors.grey200,
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0.0, color: AppColors.grey200),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0.0, color: AppColors.grey200),
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.0, color: Colors.redAccent),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.0, color: Colors.redAccent),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      validator: (value) => (value?.isEmpty ?? true) ? validatorText : null,
    );
  }
}