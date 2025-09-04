import 'package:flutter/material.dart';
import 'package:taskati_ui/core/utils/colors.dart';
import 'package:taskati_ui/core/utils/text_styles.dart';

showErrorDialog(BuildContext context, String message){
   ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(20),
                    backgroundColor: AppColors.redcolor,
                    content: Text(
                      message,
                      style: TextStyles.bodyStyle(color: AppColors.whiteColor),
                    ),
                  ),
                );
}