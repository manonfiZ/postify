import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postify/screens/home/home.dart';
import 'package:postify/screens/profile/profile.dart';

class Screen {
  final String title;
  final Widget icon;
  final Widget page;

  Screen({required this.title, required this.icon, required this.page});
}

final List<Screen> screens = [
  Screen(
      title: 'Profile',
      icon: Image.asset(
        'assets/icons/home.png',
        width: 32,
      ),
      page: const Home()),
  Screen(
      title: 'Profile',
      icon: Image.asset(
        'assets/icons/rss.png',
        width: 32,
      ),
      page: const Profile()),
  Screen(
      title: 'Profile',
      icon: Image.asset(
        'assets/icons/plus.png',
        width: 32,
      ),
      page: const Profile()),
  Screen(
      title: 'Profile',
      icon: Image.asset(
        'assets/icons/cam.png',
        width: 32,
      ),
      page: const Profile()),
  Screen(
      title: 'Profile',
      icon: Image.asset(
        'assets/images/user.jpg',
        width: 32,
      ),
      page: const Profile()),
];
