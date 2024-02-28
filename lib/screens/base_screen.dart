import 'package:flutter/material.dart';
import 'package:postify/core/models/screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _activeDestination = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 60,
        padding: EdgeInsets.zero,
        child: NavigationBar(
          elevation: 2,
          surfaceTintColor: Colors.transparent,
          selectedIndex: _activeDestination,
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (value) {
            setState(() {
              _activeDestination = value;
            });
          },
          destinations: [
            ...screens.map((screen) {
              return NavigationDestination(
                icon: screen.icon,
                label: '',
              );
            })
          ],
        ),
      ),
      body: screens[_activeDestination].page,
    );
  }
}
