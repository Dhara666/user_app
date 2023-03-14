import 'package:flutter/material.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validator;
  final Widget icon;
  final TextInputType textInputType;
  final double radius;
  final bool isObscureText;
  final bool readOnly;
  final ValueChanged<String> onChanged;
  final Widget suffix;
  final String initialValue;

  CommonTextField(
      {this.controller,
      this.hintText,
      this.validator,
      this.icon,
      this.textInputType,
      this.radius,
      this.isObscureText = false,
      this.onChanged,
      this.suffix,
      this.readOnly = false,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: height*0.010),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        autofocus: false,
        readOnly: readOnly,
        obscureText: isObscureText,
        decoration: InputDecoration(
            filled: true,
            fillColor: ColorResource.bgLightPink.withOpacity(0.75),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorResource.lightPink),
                borderRadius: BorderRadius.circular(radius ?? 30)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorResource.lightPink),
                borderRadius: BorderRadius.circular(radius ?? 30)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 30)),
            contentPadding: EdgeInsets.only(left: width*0.050,top: height*0.025,bottom: height*0.025),
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: height*0.025,
                color: ColorResource.lightGrey,
                fontWeight: FontWeight.w300),
            prefixIcon: icon,
            suffixIcon: suffix),
        validator: validator,
        onChanged: onChanged,
        keyboardType: textInputType,
      ),
    );
  }
}
