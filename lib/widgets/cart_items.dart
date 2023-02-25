import 'package:ecommerce_app/providers/cart.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  const CartItems(
      {super.key,
      required this.id,
      required this.productId,
      required this.title,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).itemsRemove(productId);
      },
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.all(10),
        color: AppColor.mainColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(10),
        child: const Icon(
          Icons.delete,
          size: 34,
          color: Colors.white,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColor.mainColor,
              child: SmallText(
                text: '\$$price',
                color: Colors.white,
              ),
              // backgroundImage: AssetImage(imageUrl),
            ),
            title: Text(title),
            subtitle: Text('Total : \$${(price * quantity)}'),
            trailing: Text('${quantity}X')),
      ),
    );
  }
}
