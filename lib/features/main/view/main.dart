import 'package:flutter/material.dart';
import 'package:grab_clone/features/account/view/account.dart';
import 'package:grab_clone/features/activity/view/activity.dart';
import 'package:grab_clone/features/home/view/home.dart';
import 'package:grab_clone/features/messages/view/messages.dart';
import 'package:grab_clone/features/payment/view/payment.dart';
import 'package:grab_clone/generated/l10n.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final double _bottomNavBarHeight = 56;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    ActivityScreen(),
    PaymentScreen(),
    MessagesScreen(),
    AccountScreen()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: _bottomNavBar,
      ),
    );
  }

  Widget get _bottomNavBar {
    return SizedBox(
      height: _bottomNavBarHeight,
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore_outlined),
            activeIcon: const Icon(Icons.explore),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.feed_outlined),
            activeIcon: const Icon(Icons.feed),
            label: S.of(context).activity,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_balance_wallet_outlined),
            activeIcon: const Icon(Icons.account_balance_wallet),
            label: S.of(context).payment,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.sms_outlined),
            activeIcon: const Icon(Icons.sms),
            label: S.of(context).messages,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle_outlined),
            activeIcon: const Icon(Icons.account_circle),
            label: S.of(context).account,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
