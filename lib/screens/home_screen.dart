import 'package:badges/badges.dart';
import 'package:ecommerce_app/providers/cart.dart';
import 'package:ecommerce_app/providers/products.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/order_screen.dart';
import 'package:ecommerce_app/widgets/app_drawer.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(
              child: SingleChildScrollView(
                child: HomeScreenBody(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 27,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Get.toNamed(OrderScreen.routeName);
              },
              child: const Icon(
                Icons.shopping_bag,
              ),
            ),
            label: 'OrderPage',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              badgeContent: Text(
                cart.itemsCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              badgeColor: Colors.purple,
              child: GestureDetector(
                onTap: () => Get.toNamed(CartScreen.routeName),
                child: const Icon(
                  Icons.shopping_cart,
                  size: 27,
                ),
              ),
            ),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}
