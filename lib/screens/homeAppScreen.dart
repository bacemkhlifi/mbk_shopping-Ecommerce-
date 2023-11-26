import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbkshopping/screens/categoryScreen.dart';
import 'package:mbkshopping/screens/homeScreen.dart';

import '../services/theme_services.dart';
import '../widgets/appDrawer.dart';
import '../widgets/theme.dart';
import 'accountScreen.dart';
import 'cartScreen.dart';
import 'helpScreen.dart';

class HomeApp extends StatefulWidget {
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int _currentIndex = 0;
@override
  void initState() {
    super.initState();
    
  }
  final List<Widget> _screens = [
    const HomePage(),
    CategoryScreen(),
    Container(),
ProfilePage(),
    HelpPage()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('MBK shopping'),
        
        actions: [
          IconButton(
          color: Get.isDarkMode ? primaryClr : darkGreyClr,
          onPressed: () {
            ThemeServices().switchTheme();
          },
          icon: Icon(
            Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            size: 24,
          )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              child: Icon(Icons.shopping_cart),
              onTap: () => Get.to(CartScreen(isEmpty: true)),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          Get.back(); // Close the drawer
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.purple,
        selectedItemColor: Get.isDarkMode ? primaryClr : Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

