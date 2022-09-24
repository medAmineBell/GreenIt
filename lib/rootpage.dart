import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/camerapage.dart';
import 'package:flutter_plant_shop_ui/cartpage.dart';
import 'package:flutter_plant_shop_ui/gardenpage.dart';
import 'package:flutter_plant_shop_ui/profilepage.dart';

import 'home.dart';

class RootPage extends StatefulWidget {
  @override
  RootPageState createState() => RootPageState();
}

enum TabItem { home, favorite, notification, account, cart }

class RootPageState extends State<RootPage> {
  TabItem _currentItem = TabItem.home;
  final List<TabItem> _bottomTabs = [
    TabItem.home,
    TabItem.favorite,
    TabItem.notification,
    TabItem.account
  ];

  void _onSelectTab(int index) {
    TabItem selectedTabItem = _bottomTabs[index];

    setState(() {
      _currentItem = selectedTabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart_outlined),
        onPressed: () {
          setState(() {
            _currentItem = TabItem.cart;
          });
        },
      ),
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _bottomTabs
                .map((tabItem) => _bottomNavigationBarItem(tabItem))
                .toList(),
            onTap: _onSelectTab,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
      body: SafeArea(
        child: _buildPage(),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(TabItem tabItem) {
    Color color = _currentItem == tabItem ? Colors.green : Colors.grey.shade400;

    IconData _icon(TabItem item) {
      switch (item) {
        case TabItem.home:
          return Icons.home_outlined;
        case TabItem.favorite:
          return Icons.camera_alt_outlined;
        case TabItem.notification:
          return Icons.nature_people_outlined;
        case TabItem.account:
          return Icons.person_outline;
        default:
          throw 'Unknown $item';
      }
    }

    return BottomNavigationBarItem(
      icon: Icon(
        _icon(tabItem),
        color: color,
        size: 30,
      ),
      label: '',
    );
  }

  Widget _buildPage() {
    switch (_currentItem) {
      case TabItem.home:
        return HomePage();
      case TabItem.favorite:
        return CameraPage();
      case TabItem.notification:
        return GardenPage();
      case TabItem.account:
        return ProfilePage();
      case TabItem.cart:
        return CartPage();
      default:
        return HomePage();
    }
  }
}
