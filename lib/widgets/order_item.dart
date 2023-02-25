import 'dart:math';

import 'package:ecommerce_app/providers/order.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'big_text.dart';

class OrderItems extends StatefulWidget {
  final OrderItem orders;

  const OrderItems({super.key, required this.orders});

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(
          top: Dimensions.height10,
          left: Dimensions.radius10,
          right: Dimensions.radius10),
      child: Column(
        children: [
          ListTile(
            title: BigText(text: '\$${widget.orders.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.orders.dateTime),
              style: const TextStyle(color: AppColor.mainColor),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10,
                  vertical: Dimensions.height10),
              height: min(widget.orders.products.length * 25 + 18, 140),
              child: ListView(
                children: widget.orders.products
                    .map((prod) => Row(
                          children: [
                            SmallText(
                              text: prod.title,
                              size: 14,
                              color: AppColor.paraColor,
                            ),
                            SmallText(
                              text: ' ${prod.quantity}x  \$ ${prod.price}',
                              size: 14,
                              color: Colors.purple,
                            )
                          ],
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
