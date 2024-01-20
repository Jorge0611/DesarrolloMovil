import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:multi_store_admin/views/side_screens/categories_screen.dart';
import 'package:multi_store_admin/views/side_screens/dashboard_screen.dart';
import 'package:multi_store_admin/views/side_screens/orders_screen.dart';
import 'package:multi_store_admin/views/side_screens/products_screen.dart';
import 'package:multi_store_admin/views/side_screens/upload_banner_screen.dart';
import 'package:multi_store_admin/views/side_screens/vendors_screen.dart';
import 'package:multi_store_admin/views/side_screens/withdrawal_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = const DashboardScreen();

  screenSelector(String screen) {
    switch (screen) {
      case DashboardScreen.screenRoute:
        setState(() {
          _selectedScreen = const DashboardScreen();
        });
        break;
      case VendorsScreen.screenRoute:
        setState(() {
          _selectedScreen = const VendorsScreen();
        });
      case WithdrawalScreen.screenRoute:
        setState(() {
          _selectedScreen = const WithdrawalScreen();
        });
        break;
      case CategoriesScreen.screenRoute:
        setState(() {
          _selectedScreen = const CategoriesScreen();
        });
        break;
      case OrdersScreen.screenRoute:
        setState(() {
          _selectedScreen = const OrdersScreen();
        });
        break;
      case ProductsScreen.screenRoute:
        setState(() {
          _selectedScreen = const ProductsScreen();
        });
        break;
      case UploadBannerScreen.screenRoute:
        setState(() {
          _selectedScreen = const UploadBannerScreen();
        });
        break;
      default:
        setState(() {
          _selectedScreen = const DashboardScreen();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: const Text('Hello World!'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
              title: 'Dashboard',
              route: DashboardScreen.screenRoute,
              icon: Icons.dashboard),
          AdminMenuItem(
              title: 'Vendor',
              route: VendorsScreen.screenRoute,
              icon: Icons.shopping_bag),
          AdminMenuItem(
              title: 'Withdrawal',
              route: WithdrawalScreen.screenRoute,
              icon: Icons.money),
          AdminMenuItem(
              title: 'Upload Banner',
              route: UploadBannerScreen.screenRoute,
              icon: Icons.upload),
          AdminMenuItem(
              title: 'Categories',
              route: CategoriesScreen.screenRoute,
              icon: Icons.category),
        ],
        selectedRoute: '',
        onSelected: (item) {
          debugPrint(item.title);
          if (item.route != null) {
            screenSelector(item.route!);
          }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xFF444444),
          child: const Center(
            child: Text(
              'Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xFF444444),
          child: const Center(
            child: Text(
              'Footer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: _selectedScreen,
    );
  }
}
