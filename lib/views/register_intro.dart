import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/strings.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/views/categories_selection.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.techbot.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: ProjectStrings.welcomeText,
                        style: textTheme.titleSmall!.merge(const TextStyle(
                            fontWeight: FontWeight.w700,
                            color:
                                ProjectSolidColors.textTitleMediumOpacity)))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return EmailModalBottomSheetContent(
                            textTheme: textTheme);
                      },
                    );
                  },
                  child: const Text(ProjectStrings.welcomeTextButton),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EmailModalBottomSheetContent extends StatelessWidget {
  const EmailModalBottomSheetContent({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                ProjectStrings.enterYourEmail,
                style: textTheme.titleMedium!
                    .merge(const TextStyle(fontWeight: FontWeight.normal)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 24, 32, 46),
              child: TextField(
                  onChanged: (value) => true,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: ProjectStrings.techBotEmailHint,
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return ActivationCodeModalBottomSheetContent(
                          textTheme: textTheme);
                    },
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(ProjectStrings.continueText),
                ))
          ],
        ),
      ),
    );
  }
}

class ActivationCodeModalBottomSheetContent extends StatelessWidget {
  const ActivationCodeModalBottomSheetContent({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                ProjectStrings.enterActivationCode,
                style: textTheme.titleMedium!
                    .merge(const TextStyle(fontWeight: FontWeight.normal)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 24, 32, 46),
              child: TextField(
                  onChanged: (value) => true,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: ProjectStrings.activationCodeHint,
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(CupertinoPageRoute(
                    builder: (context) => const CategoriesSelection(),
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(ProjectStrings.continueText),
                ))
          ],
        ),
      ),
    );
  }
}
