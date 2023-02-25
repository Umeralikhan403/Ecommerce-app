import 'package:badges/badges.dart';
import 'package:ecommerce_app/providers/cart.dart';
import 'package:ecommerce_app/providers/products.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/widgets/app_icon.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DetailScreen2 extends StatelessWidget {
  static String routeName = '/detail-screen2';

  const DetailScreen2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).items.firstWhere(
              (prod) => prod.id == productId,
            );
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Get.toNamed(HomeScreen.routeName),
                    child: const AppIcon(icon: Icons.arrow_back)),
                Badge(
                  badgeContent: Text(
                    cart.itemsCount.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(CartScreen.routeName),
                    child: const AppIcon(
                      icon: Icons.shopping_cart,
                    ),
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width10,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                width: double.maxFinite,
                child: Center(
                  child: BigText(
                    text: loadedProduct.title,
                    size: Dimensions.font26,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 202, 193, 175),
            expandedHeight: 330,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                loadedProduct.imageUrl,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child:
                      ExpandandableTextWidget(text: loadedProduct.description),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: 'Price',
                size: Dimensions.font26,
              ),
              BigText(
                text: '\$${loadedProduct.price}',
                color: AppColor.mainBlackColor,
                size: Dimensions.font26,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              top: Dimensions.height10,
              bottom: Dimensions.height10,
              left: Dimensions.width20,
              right: Dimensions.width20),
          decoration: BoxDecoration(
            color: AppColor.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                Dimensions.radius30,
              ),
              topRight: Radius.circular(Dimensions.radius30),
            ),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
