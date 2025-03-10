import 'package:flutter/material.dart';


import '../../../core/utils/colors.dart';
import '../../../core/utils/style.dart';


class TextFormFieldWithTitle extends StatelessWidget {
  final String? title;
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final bool readOnly;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  const TextFormFieldWithTitle({super.key,  this.title,  this.hintText, this.suffixIcon,  this.readOnly=false, this.onTap, this.controller, this.onChanged, this.validator,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ??" ",style: AppTextStyle.fontStyle20Bold,),
        SizedBox(height: 10,),
        TextFormField(
          validator: validator,
          onChanged:onChanged ,
          onTap:onTap ,
          readOnly: readOnly,
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon:suffixIcon ,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.primaryColor)
              )
          ),
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}