// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_mentor/features/nav/presentation/profile_page.dart';
import 'package:my_mentor/features/nav/presentation/search.dart';

import '../../home/presentation/home_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _currentIndex = 0;
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomePage(),
      const SearchPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          //color: Colors.black.withOpacity(.2),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 70,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.all(15),
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          //this is very important, without it the whole screen will be blurred
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            //I'm using BackdropFilter for the blurring effect
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ),
              child: Opacity(
                //you can change the opacity to whatever suits you best
                opacity: 0.6,
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  elevation: 0,
                  backgroundColor: Colors.black12.withOpacity(0.1),
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black.withOpacity(0.3),
                  items: const [
                    BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.house, size: 20),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.floppyDisk, size: 20),
                      label: 'Saved',
                    ),
                  ],
                  onTap: onTap,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
