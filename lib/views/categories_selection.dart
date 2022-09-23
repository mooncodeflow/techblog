import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/data_models.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/components/strings.dart';

class CategoriesSelection extends StatefulWidget {
  const CategoriesSelection({super.key});

  @override
  State<CategoriesSelection> createState() => _CategoriesSelectionState();
}

class _CategoriesSelectionState extends State<CategoriesSelection> {
  List<Hashtags> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 36,
            ),
            SvgPicture.asset(
              Assets.images.techbot.path,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                  ProjectStrings.completeRegisterInfoAfterEmailSubmition,
                  textAlign: TextAlign.center,
                  style: textTheme.titleSmall!.merge(const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ProjectSolidColors.textTitleMediumOpacity))),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: ProjectStrings.firstNameLastName,
                ),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Text(ProjectStrings.chooseFavoriteCategories,
                style: textTheme.titleSmall!.merge(const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: ProjectSolidColors.textTitleMediumOpacity))),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  // physics: const ClampingScrollPhysics(),
                  physics: const BouncingScrollPhysics(),
                  itemCount: bannerFakeData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.35),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            if (!selectedItems.contains(generalHashtags[index])) {
                              selectedItems.add(generalHashtags[index]);
                            }
                          });
                        },
                        child: TagWidget(textTheme: textTheme, index: index));
                  }),
            ),
            const SizedBox(
              height: 24,
            ),
            Image.asset(
              Assets.images.categoryArrowDwon.path,
              scale: 2.5,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 52,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 36),
                scrollDirection: Axis.horizontal,
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ProjectSolidColors.surfaceColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectedItems[index].title),
                            const SizedBox(
                              width: 16,
                            ),
                            InkWell(
                                onTap: (() => setState(
                                    (() => selectedItems.removeAt(index)))),
                                child: const Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.grey,
                                  size: 20,
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(ProjectStrings.continueText),
                )),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
