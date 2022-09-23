import 'package:flutter/material.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/components/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyPadding,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyPadding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          HomeScreenBanner(size: size, textTheme: textTheme),
          const SizedBox(
            height: 24,
          ),
          HomeScreenTagList(bodyPadding: bodyPadding, textTheme: textTheme),
          const SizedBox(
            height: 32,
          ),
          HottestArticlesHeadline(bodyPadding: bodyPadding, textTheme: textTheme),
          HomeScreenBlogList(size: size, bodyPadding: bodyPadding, textTheme: textTheme),
          const SizedBox(
            height: 24,
          ),
          HottestPodcastsHeadline(bodyPadding: bodyPadding, textTheme: textTheme),
          HomeScreenPodcastList(size: size, bodyPadding: bodyPadding, textTheme: textTheme),
          SizedBox(
            height: size.height / 10,
          )
        ],
      ),
    );
  }
}

class HottestPodcastsHeadline extends StatelessWidget {
  const HottestPodcastsHeadline({
    Key? key,
    required this.bodyPadding,
    required this.textTheme,
  }) : super(key: key);

  final double bodyPadding;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyPadding),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.microphone.image().image,
            size: 20,
            color: ProjectSolidColors.headlinesDefColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(ProjectStrings.moreHottestPodcasts,
              style: textTheme.titleSmall!.merge(const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ProjectSolidColors.headlinesDefColor))),
        ],
      ),
    );
  }
}

class HottestArticlesHeadline extends StatelessWidget {
  const HottestArticlesHeadline({
    Key? key,
    required this.bodyPadding,
    required this.textTheme,
  }) : super(key: key);

  final double bodyPadding;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyPadding),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluePen.image().image,
            size: 20,
            color: ProjectSolidColors.headlinesDefColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(ProjectStrings.moreHottestArticles,
              style: textTheme.titleSmall!.merge(const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ProjectSolidColors.headlinesDefColor))),
        ],
      ),
    );
  }
}

class HomeScreenPodcastList extends StatelessWidget {
  const HomeScreenPodcastList({
    Key? key,
    required this.size,
    required this.bodyPadding,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyPadding;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: podcastList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // * blog item
          return Padding(
            padding: EdgeInsets.fromLTRB(
                8, 12, index == 0 ? bodyPadding : 8, 0),
            child: Column(
              children: [
                Container(
                  width: size.width / 2.6,
                  height: size.height / 5.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(podcastList[index].poster),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                    width: size.width / 2.6,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                      child: Text(podcastList[index].title,
                          textAlign: TextAlign.center,
                          style: textTheme.caption!.merge(const TextStyle(
                              color: Colors.black, height: 1.3)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeScreenBlogList extends StatelessWidget {
  const HomeScreenBlogList({
    Key? key,
    required this.size,
    required this.bodyPadding,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyPadding;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // * blog item
          return Padding(
            padding: EdgeInsets.fromLTRB(
                8, 12, index == 0 ? bodyPadding : 8, 0),
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
                            image: NetworkImage(blogList[index].imageUrl),
                            fit: BoxFit.cover),
                      ),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: ProjectGradients.textOverlayGradient),
                      ),
                    ),
                    Positioned(
                      bottom: 6,
                      right: 8,
                      left: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            blogList[index].writer,
                            style: textTheme.caption!.merge(
                                const TextStyle(
                                    color: ProjectSolidColors
                                        .homeBannerSubTitle)),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(blogList[index].views,
                                    style: textTheme.caption!.merge(
                                        const TextStyle(
                                            color: ProjectSolidColors
                                                .homeBannerSubTitle))),
                              ),
                              const SizedBox(width: 4.0),
                              const Icon(
                                Icons.remove_red_eye_sharp,
                                color:
                                    ProjectSolidColors.homeBannerSubTitle,
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
                      padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                      child: Text(blogList[index].title,
                          style: textTheme.caption!.merge(const TextStyle(
                              color: Colors.black, height: 1.3)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeScreenTagList extends StatelessWidget {
  const HomeScreenTagList({
    Key? key,
    required this.bodyPadding,
    required this.textTheme,
  }) : super(key: key);

  final double bodyPadding;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: generalHashtags.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                8, 8, index == 0 ? bodyPadding : 8, 8),
            child: TagWidget(textTheme: textTheme, index: index,),
          );
        },
      ),
    );
  }
}

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 1.25,
      height: size.height / 4.2,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(bannerFakeData["bannerImageAsset"]),
                  fit: BoxFit.cover,
                )),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                    colors: ProjectGradients.homeBannerOverlay,
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
                        style: textTheme.titleSmall!.merge(const TextStyle(
                            color: ProjectSolidColors.homeBannerSubTitle))),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(bannerFakeData['views'],
                              style: textTheme.titleSmall!.merge(
                                  const TextStyle(
                                      color: ProjectSolidColors
                                          .homeBannerSubTitle))),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.remove_red_eye_sharp,
                          color: ProjectSolidColors.homeBannerSubTitle,
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
                  style: textTheme.titleMedium!.merge(const TextStyle(
                      color: ProjectSolidColors.homeBannerTitle)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
