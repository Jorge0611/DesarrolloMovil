import 'package:flutter/material.dart';
import 'package:multi_store_app/views/buyers/screens/account_screen.dart';
import 'package:multi_store_app/views/buyers/screens/cart_screen.dart';
import 'package:multi_store_app/views/buyers/screens/category_screen.dart';
import 'package:multi_store_app/views/buyers/screens/home_screen.dart';
import 'package:multi_store_app/views/buyers/screens/search_screen.dart';
import 'package:multi_store_app/views/buyers/screens/store_screen.dart';

class BuyerMainScreen extends StatefulWidget {
  const BuyerMainScreen({super.key});

  @override
  State<BuyerMainScreen> createState() => _BuyerMainScreenState();
}

class _BuyerMainScreenState extends State<BuyerMainScreen> {
  int _pageIndex = 0;

  final List<Widget> _pageList = <Widget>[
    const HomeScreen(),
    const CategoryScreen(),
    const StoreScreen(),
    const CartScreen(),
    const SearchScreen(),
    const AccountScreen(),
  ];

  void onTabTapped(int index) {
    debugPrint('onTabTapped: $index');
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pageList[_pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.yellow.shade600,
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
