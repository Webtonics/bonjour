import 'package:bonjour/models/user.dart' as model;
import 'package:bonjour/providers/user_provider.dart';
import 'package:bonjour/utils/colors.dart';
import 'package:bonjour/views/appscreens/add_post.dart';
import 'package:bonjour/views/appscreens/feed_screen.dart';
import 'package:bonjour/views/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onpageChange(int page) {
    page = currentPage;
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      // body: pages[currentPage],
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          FeedScreen(),
          Center(
            child: Text("Search"),
          ),
          AddPostScreen(),
          Center(
            child: Text("Favorites"),
          ),
          ProfileScreen(),
        ],
      ),

      bottomNavigationBar: CupertinoTabBar(
        iconSize: 25,
        currentIndex: currentPage,

        backgroundColor: mobileBackgroundColor,
        // inactiveColor: secondaryColor,
        // activeColor: primaryColor,

        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: currentPage == 0 ? primaryColor : secondaryColor,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: currentPage == 1 ? primaryColor : secondaryColor,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
                color: currentPage == 2 ? primaryColor : secondaryColor,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: currentPage == 3 ? primaryColor : secondaryColor,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: currentPage == 4 ? primaryColor : secondaryColor,
              ),
              label: ""),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
