// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:example/screens/chat_page.dart';
import 'package:example/screens/test.dart';
import 'package:flutter/material.dart';
import 'calendar_screen.dart';

class HomePage extends StatefulWidget {
@override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> pages = [
    // TODO - add other pages (calendar and tasks)
    ChatPage(),
    CalendarScreen(),
    Screen1(),
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
            currentIndex: _pageIndex,
            onTap: onTabTapped,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey.shade600,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: "Chats",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: "Calendar",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_tree_outlined),
                label: "Tasks",
              ),
            ],
        ),
      body: PageView(
        children: pages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}