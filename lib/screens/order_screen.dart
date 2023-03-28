import 'package:flutter/material.dart';
import 'package:ecommerce_app/providers/order.dart';
import 'package:ecommerce_app/widgets/order_item.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = '/order-screen';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(
        child: FutureBuilder(
          future:
              Provider.of<Order>(context, listen: false).fetchAndSetOrders(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Consumer<Order>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (context, index) =>
                      OrderItems(orders: orderData.orders[index]),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
