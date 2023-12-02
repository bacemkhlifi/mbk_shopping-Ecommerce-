import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbkshopping/controllers/favorites_controller.dart';
import 'package:mbkshopping/screens/categoryScreen.dart';
import 'package:mbkshopping/screens/homeScreen.dart';
import 'package:mbkshopping/screens/panier/CartScreen.dart';

import '../controllers/cart_controller.dart';
import '../services/theme_services.dart';
import '../widgets/appDrawer.dart';
import '../widgets/theme.dart';
import 'accountScreen.dart';
import 'favoritesScreen.dart';
import 'package:badges/badges.dart' as badges;
import 'helpScreen.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
   final FavoriteController controller_fav = Get.find();
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    // Access the argument
    int? argument = Get.arguments;
    if (argument != null) {
      // Use the argument to update the current index
      setState(() {
        _currentIndex = argument;
      });
    }
  }

  final List<Widget> _screens = [
    const HomePage(),
    CategoryScreen(),
    FavoritesScreen(),
    ProfilePage(),
    HelpPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
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
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
            position: BadgePosition.topEnd(top: 3, end: 18),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Obx(()=> Text(
                '${controller_fav.favoriteProducts.length}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            child: IconButton(
                icon: Icon(Icons.favorite, ),
                padding: EdgeInsets.only(right: 30.0),
                onPressed: () {
                  
                }),
          ),
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

AppBar _appbar(BuildContext context) {
    final CartController controller = Get.find();
  return AppBar(
    title: const Text('MBK shopping'),
    actions: [
      IconButton(
          onPressed: () {
            ThemeServices().switchTheme();
          },
          icon: Icon(
            Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            size: 24,
          )),
    
       Obx(()=> badges.Badge(
              position: BadgePosition.topEnd(top: 3, end: 18),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                '${controller.products.length}',
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  icon: Icon(Icons.shopping_cart, ),
                  padding: EdgeInsets.only(right: 30.0),
                  onPressed: () {
                    Get.to(CartScreen());
                  }),
            ),
       )
    ],
  );
}
