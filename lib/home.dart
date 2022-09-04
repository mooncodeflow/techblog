import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/colors.dart' as project_colors;
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/strings.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  TextEditingController instagramIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: project_colors.ProjectSolidColors.scaffoldBG,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            Image(
                height: size.height / 15,
                image: Assets.images.logo.image().image),
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // * banner
                SizedBox(
                  width: size.width / 1.25,
                  height: size.height / 4.2,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(
                                  bannerFakeData["bannerImageAsset"]),
                              fit: BoxFit.cover,
                            )),
                        foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                                colors: project_colors
                                    .ProjectGradients.homeBannerOverlay,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
                      Positioned(
                        right: 16,
                        left: 16,
                        bottom: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    bannerFakeData['writer'] +
                                        ' - ' +
                                        bannerFakeData['date'],
                                    style: textTheme.titleSmall!.merge(
                                        const TextStyle(
                                            color: project_colors
                                                .ProjectSolidColors
                                                .homeBannerSubTitle))),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(bannerFakeData['views'],
                                          style: textTheme.titleSmall!.merge(
                                              const TextStyle(
                                                  color: project_colors
                                                      .ProjectSolidColors
                                                      .homeBannerSubTitle))),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: project_colors.ProjectSolidColors
                                          .homeBannerSubTitle,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              bannerFakeData['title'],
                              style: textTheme.titleMedium!.merge(
                                  const TextStyle(
                                      color: project_colors
                                          .ProjectSolidColors.homeBannerTitle)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                // * hashtags list
                SizedBox(
                  height: 55,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: generalHashtags.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                            8, 8, index == 0 ? size.width / 10 : 8, 8),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                  colors: project_colors
                                      .ProjectGradients.homeHashtagList)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              ImageIcon(
                                Assets.icons.hashtag.image().image,
                                size: 14,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                child: Text(
                                  generalHashtags[index].title,
                                  style: textTheme.titleSmall!.merge(
                                      const TextStyle(color: Colors.white)),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                // * hottest articles headline
                Padding(
                  padding: EdgeInsets.only(right: size.width / 10),
                  child: Row(
                    children: [
                      ImageIcon(
                        Assets.icons.bluePen.image().image,
                        size: 20,
                        color:
                            project_colors.ProjectSolidColors.headlinesDefColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(ProjectStrings.moreHottestArticles,
                          style: textTheme.titleSmall!.merge(const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: project_colors
                                  .ProjectSolidColors.headlinesDefColor))),
                    ],
                  ),
                ),
                // * hottest articles list section
                SizedBox(
                  height: size.height / 3.5,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: blogList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // * blog item
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                            8, 12, index == 0 ? size.width / 10 : 8, 0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: size.width / 2.6,
                                  height: size.height / 5.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            blogList[index].imageUrl),
                                        fit: BoxFit.cover),
                                  ),
                                  foregroundDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: project_colors.ProjectGradients
                                            .textOverlayGradient),
                                  ),
                                ),
                                Positioned(
                                  bottom: 6,
                                  right: 8,
                                  left: 8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        blogList[index].writer,
                                        style: textTheme.caption!.merge(
                                            const TextStyle(
                                                color: project_colors
                                                    .ProjectSolidColors
                                                    .homeBannerSubTitle)),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child: Text(blogList[index].views,
                                                style: textTheme.caption!.merge(
                                                    const TextStyle(
                                                        color: project_colors
                                                            .ProjectSolidColors
                                                            .homeBannerSubTitle))),
                                          ),
                                          const SizedBox(width: 4.0),
                                          const Icon(
                                            Icons.remove_red_eye_sharp,
                                            color: project_colors
                                                .ProjectSolidColors
                                                .homeBannerSubTitle,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                width: size.width / 2.6,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 8, 4, 0),
                                  child: Text(blogList[index].title,
                                      style: textTheme.caption!.merge(
                                          const TextStyle(
                                              color: Colors.black,
                                              height: 1.3)),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                )),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                // * hottest podcast headline
                Padding(
                  padding: EdgeInsets.only(right: size.width / 10),
                  child: Row(
                    children: [
                      ImageIcon(
                        Assets.icons.microphone.image().image,
                        size: 20,
                        color:
                            project_colors.ProjectSolidColors.headlinesDefColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(ProjectStrings.moreHottestPodcasts,
                          style: textTheme.titleSmall!.merge(const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: project_colors
                                  .ProjectSolidColors.headlinesDefColor))),
                    ],
                  ),
                ),
                // * hottest podcasts list section
                SizedBox(
                  height: size.height / 3.5,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: podcastList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // * blog item
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                            8, 12, index == 0 ? size.width / 10 : 8, 0),
                        child: Column(
                          children: [
                            Container(
                              width: size.width / 2.6,
                              height: size.height / 5.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(podcastList[index].poster),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                                width: size.width / 2.6,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 8, 4, 0),
                                  child: Text(podcastList[index].title,
                                      textAlign: TextAlign.center,
                                      style: textTheme.caption!.merge(
                                          const TextStyle(
                                              color: Colors.black,
                                              height: 1.3)),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                )),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                )
              ],
            ),
          ),
          // * bottom nabvar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height / 7,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors:
                          project_colors.ProjectGradients.bottomNavUnderlay)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: project_colors
                              .ProjectGradients.bottomNavigationGradient)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: ImageIcon(
                            Assets.icons.home.image().image,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: ImageIcon(Assets.icons.write.image().image,
                              color: Colors.white)),
                      IconButton(
                          onPressed: () {},
                          icon: ImageIcon(Assets.icons.user.image().image,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
