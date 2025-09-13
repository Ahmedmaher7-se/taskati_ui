import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_ui/core/constants/app_images.dart';
import 'package:taskati_ui/core/functions/navigation.dart';
import 'package:taskati_ui/core/services/local_helper.dart';
import 'package:taskati_ui/core/utils/text_styles.dart';
import 'package:taskati_ui/features/home/page/home_screen.dart';
import 'package:taskati_ui/features/upload/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isUploaded = LocalHelper.getData(LocalHelper.kIsUploaded) ?? false;
    Future.delayed(Duration(seconds: 3), () {
      if(isUploaded) {
      pushWithReplacement(context,const HomeScreen());
        
      } else {
      pushWithReplacement(context,const UploadScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppImages.logo, width: 250),
        Gap(15),
        Text('Taskati', style: TextStyles.bodyStyle(fontSize: 24),),
        Gap(15),
        Text('it\'s Time to Get Orgnized', style: TextStyles.smallStyle(fontSize: 16),),
      ],
    )));
  }
}
