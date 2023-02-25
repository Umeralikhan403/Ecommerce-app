import 'package:ecommerce_app/providers/cart.dart';
import 'package:ecommerce_app/providers/products.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../screens/detail_screen2.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final String price;

  const ProductItem({
    Key? key,
    // required this.id,
    // required this.title,
    // required this.imageUrl,
    // required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width20,
      ),
      child: Row(children: [
        GestureDetector(
          onTap: () => Get.to(const DetailScreen2(), arguments: product.id),
          child: Container(
            width: Dimensions.listViewImgSize,
            height: Dimensions.listViewImgSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white30,
              image: DecorationImage(
                  image: AssetImage(product.imageUrl), fit: BoxFit.cover),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius15),
                bottomRight: Radius.circular(Dimensions.radius15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                      text: product.title,
                      size: 18,
                    ),
                    SizedBox(
                      height: Dimensions.height7,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: 'Starting at\$ ${product.price}',
                          size: 15,
                        ),
                        SizedBox(
                          width: Dimensions.width15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: AppColor.mainColor,
                              size: 27,
                            ),
                            onPressed: () {
                              cart.addItem(
                                  product.id, product.price, product.title);
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Added item to cart!',
                                  ),
                                  duration: const Duration(seconds: 2),
                                  action: SnackBarAction(
                                    label: 'UNDO',
                                    onPressed: () {
                                      // cart.removeSingleItem(product.id);
                                    },
                                  ),
                                ),
                              );
                            }),
                        SizedBox(
                          width: Dimensions.width30,
                        ),
                        IconButton(
                          onPressed: () {
                            product.toggleFavorite();
                          },
                          icon: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.mainColor,
                            size: 27,
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
