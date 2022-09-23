import 'package:flutter/material.dart';
import 'package:techblog/components/colors.dart' as project_colors;
import 'package:techblog/components/colors.dart';
import 'package:techblog/components/components.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/views/home_screen.dart';
import 'package:techblog/views/profile_screen.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({Key? key}) : super(key: key);

  @override
  State<PrimaryScreen> createState() => _PrimaryScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _PrimaryScreenState extends State<PrimaryScreen> {
  var selectedScreenIndex = 0;
  final TextEditingController instagramIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyPadding = size.width / 10;

    return SafeArea(
        child: Scaffold(
      key: _key,
      backgroundColor: project_colors.ProjectSolidColors.scaffoldBG,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: project_colors.ProjectSolidColors.scaffoldBG,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => _key.currentState!.openDrawer(),
              child: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
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
      drawer: Drawer(
        backgroundColor: ProjectSolidColors.scaffoldBG,
        child: ListView(
          children: [
            DrawerHeader(
                child: Image.asset(
              Assets.images.logo.path,
              scale: 3,
            )),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 36),
              title: Text(
                'پروفایل کاربری',
                style: textTheme.titleSmall,
              ),
              onTap: () {},
            ),
            TechDivider(size: size),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 36),
              title: Text(
                'درباره تک بلاگ',
                style: textTheme.titleSmall,
              ),
              onTap: () {},
            ),
            TechDivider(size: size),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 36),
              title: Text(
                'اشتراک گذاری تک بلاگ',
                style: textTheme.titleSmall,
              ),
              onTap: () {},
            ),
            TechDivider(size: size),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 36),
              title: Text(
                'تک بلاگ در گیت هاب',
                style: textTheme.titleSmall,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: IndexedStack(
            alignment: AlignmentDirectional.center,
            index: selectedScreenIndex,
            children: [
              HomeScreen(
                  size: size, textTheme: textTheme, bodyPadding: bodyPadding),
              const ProfileScreen(),
            ],
          )),
          BottomNav(
              size: size,
              bodyPadding: bodyPadding,
              changeScreen: (int value) {
                setState(() {
                  selectedScreenIndex = value;
                });
              }),
        ],
      ),
    ));
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
    required this.size,
    required this.bodyPadding,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyPadding;
  final Function(int screenIndex) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 7,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: project_colors.ProjectGradients.bottomNavUnderlay)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyPadding, vertical: 20),
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
                    onPressed: () => changeScreen(0),
                    icon: ImageIcon(
                      Assets.icons.home.image().image,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(Assets.icons.write.image().image,
                        color: Colors.white)),
                IconButton(
                    onPressed: () => changeScreen(1),
                    icon: ImageIcon(Assets.icons.user.image().image,
                        color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
