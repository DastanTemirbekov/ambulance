import 'package:ambulance/pages/profile/phone_number_screen.dart';
import 'package:ambulance/pages/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../ambulance_colors.dart';
import '../ambulance_textstyle.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  final List<Widget> pages = [
    const ProfileScreen(),
    const PhoneNumberScreen(),
    const ProfileScreen(),
    const ProfileScreen(),
    const ProfileScreen()
  ];

  void onChangeIndex(int index, BuildContext context) {
    switch (index) {
      case 0:
        currentIndex = index;
        break;
      case 1:
        currentIndex = index;
        break;
      case 2:
        currentIndex = index;
        break;
      case 3:
        currentIndex = index;
        break;
      case 4:
        currentIndex = index;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => onChangeIndex(value, context),
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AmbulanceColors.greyItem,
        selectedItemColor: AmbulanceColors.buttonColor,
        selectedLabelStyle: AmbulanceTextStyle.sfW500S10,
        unselectedLabelStyle:
            AmbulanceTextStyle.sfW500S10.copyWith(color: Colors.black),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Доктора',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: 'Статьи',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.car_rental,
              color: Colors.transparent,
              size: 0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Мои доктора',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AmbulanceColors.buttonColor,
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.car_rental,
              color: AmbulanceColors.appBarColor,
            ),
            Text('Call', style: AmbulanceTextStyle.sfW500S10White)
          ],
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
    );
  }
}
