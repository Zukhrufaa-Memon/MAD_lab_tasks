import 'package:flutter/material.dart';
import 'package:todoo_list/constants/images.dart';
import 'package:todoo_list/pages/data_input_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName ='/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToDataInputPage();

  }


  void navigateToDataInputPage() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, DataInputScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      backgroundColor:Color.fromRGBO(124, 77, 255, 1),//const Color(0xFF311C61),
      body: Center(
        child:Image.asset(
          Images.logo,
          height: 200,
        )
      ),
    ); 
  }
}