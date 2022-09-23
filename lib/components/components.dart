import 'package:flutter/material.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.25,
      color: ProjectSolidColors.dividerColor,
      indent: size.width / 10,
      endIndent: size.width / 10,
    );
  }
}

class TagWidget extends StatelessWidget {
  const TagWidget({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient:
              const LinearGradient(colors: ProjectGradients.homeHashtagList)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          ImageIcon(
            Assets.icons.hashtag.image().image,
            size: 14,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Text(
              generalHashtags[index].title,
              style: textTheme.titleSmall!
                  .merge(const TextStyle(color: Colors.white)),
              textAlign: TextAlign.center,
            ),
          )
        ]),
      ),
    );
  }
}
