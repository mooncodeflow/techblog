import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/views/primary_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2500)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const PrimaryScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  // width: , // * not set, depends on height
                  height: 64,
                  image: Assets.images.logo.image().image),
              const SizedBox(height: 24),
              const SpinKitFadingCube(
                color: ProjectSolidColors.primaryColor,
                size: 32.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
