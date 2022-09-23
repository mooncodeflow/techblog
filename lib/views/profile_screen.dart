import 'package:flutter/material.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/components/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Image(
            image: Assets.images.avatar.image().image,
            height: 86,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                Assets.icons.bluePen.image().image,
                size: 20,
                color: ProjectSolidColors.headlinesDefColor,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(ProjectStrings.editImageProfile,
                  style: textTheme.titleSmall!.merge(const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ProjectSolidColors.headlinesDefColor))),
            ],
          ),
          const SizedBox(
            height: 64,
          ),
          Text(
            'فاطمه امیری',
            style: textTheme.titleSmall!
                .merge(const TextStyle(color: Colors.black)),
          ),
          Text('fatemeamiri@gmail.com',
              style: textTheme.titleSmall!
                  .merge(const TextStyle(color: Colors.black))),
          const SizedBox(
            height: 46,
          ),
          TechDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: ProjectSolidColors.primaryColor,
            child: SizedBox(
              height: 32,
              child: Center(
                child: Text(ProjectStrings.favoriteArticles,
                    style: textTheme.titleSmall!
                        .merge(const TextStyle(color: Colors.black))),
              ),
            ),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: ProjectSolidColors.primaryColor,
            child: SizedBox(
              height: 32,
              child: Center(
                child: Text(ProjectStrings.favoritePodcasts,
                    style: textTheme.titleSmall!
                        .merge(const TextStyle(color: Colors.black))),
              ),
            ),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: ProjectSolidColors.primaryColor,
            child: SizedBox(
              height: 32,
              child: Center(
                child: Text(ProjectStrings.signOutFromAccount,
                    style: textTheme.titleSmall!
                        .merge(const TextStyle(color: Colors.black))),
              ),
            ),
          ),
        SizedBox(height: size.height / 10,),
        ],
      ),
    );
  }
}
