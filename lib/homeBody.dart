// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locare/UserBody.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:locare/bookingsPage.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

int _Index = 0;
final List<Widget> _pages = [
  UserBody(),
  BookingsPage(),
  // BookMarkPage(),
  // ProfilePage()
];

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(
            child: Text("Locare"),
          ),
          backgroundColor: const Color(0xFF345EA8),
          elevation: 0,
        ),
        body: IndexedStack(
          index: _Index,
          children: _pages,
        ),
        bottomNavigationBar: Container(
          height: height * 0.08,
          color: Color(0xFF345EA8),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: GNav(
              gap: 8,
              activeColor: Color(0xFF345EA8),
              backgroundColor: Color(0xFF345EA8),
              color: Color(0xFFFDFDFD),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 600),
              tabBackgroundColor: Color(0xFFFDFDFD),
              selectedIndex: _Index,
              onTabChange: (index) {
                setState(() {
                  _Index = index;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.monetization_on_outlined,
                  text: 'Bookings',
                ),
                GButton(
                  icon: Icons.favorite_border_outlined,
                  text: 'Favorites',
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 50),
          child: SizedBox(
            width: width * 0.18,
            height: height * 0.2,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFF345EA8),
              onPressed: () {},
              elevation: 0,
              child: CircleAvatar(
                radius: width * 0.2,
                backgroundColor: Color(0xFF345EA8),
                child: CircleAvatar(
                  backgroundColor: Color(0xFF345EA8),
                  radius: width * 0.2,
                  child: Image.asset('assets/Ellipse 1.png'),
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}