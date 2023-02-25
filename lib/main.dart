import 'package:ecommerce_app/providers/cart.dart';
import 'package:ecommerce_app/providers/order.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/edit_product_screen.dart';
import 'package:ecommerce_app/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/detail_screen2.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import './providers/products.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PopularProducts(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Order(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Muli",
        ),
        home: const HomeScreen(),
        getPages: [
          GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
          // GetPage(name: DetailScreen.routeName, page: () => DetailScreen()),
          GetPage(
              name: DetailScreen2.routeName, page: () => const DetailScreen2()),
          GetPage(name: CartScreen.routeName, page: () => const CartScreen()),
          GetPage(name: OrderScreen.routeName, page: () => const OrderScreen()),
          GetPage(
              name: EditProductScreen.routeName,
              page: () => const EditProductScreen()),
        ],
      ),
    );
  }
}
