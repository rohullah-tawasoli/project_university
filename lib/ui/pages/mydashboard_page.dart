import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/controllers/dashboard_contrpller.dart';
import 'package:flutter_note_app/core/navigation/custom_animated_bottom_bar.dart';
import 'package:flutter_note_app/ui/pages/home_page.dart';
import 'package:flutter_note_app/ui/pages/note_page.dart';
import 'package:flutter_note_app/ui/pages/profile_page.dart';
import 'package:get/get.dart';

class MyDashBoard extends StatefulWidget {
  @override
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFF252525),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                ProfilePage(),
                HomePage(),
                NotePage(),
              ],
            ),
          ),
          bottomNavigationBar: CustomAnimatedBottomBar(
            containerHeight: 70,
            backgroundColor: Color(0xFF252525),
            selectedIndex: controller.tabIndex,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: controller.changeTabIndex,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
                activeColor: Colors.green,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Colors.purpleAccent,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.notification_add),
                title: Text(
                  'Notification',
                ),
                activeColor: Colors.pink,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
