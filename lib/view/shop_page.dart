import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sushi_ui/constants/fonts.dart';
import 'package:sushi_ui/constants/route_screen.dart';
import 'package:sushi_ui/model/cart_model.dart';
import 'package:sushi_ui/model/prouduct_model.dart';
import 'package:sushi_ui/view/cart_page.dart';
import 'package:sushi_ui/view/products_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          leading: const Icon(Icons.menu),
          centerTitle: true,
          title: Text(
            'What Do You Like ?',
            style: fontsAppbar,
          ),
          actions: [
            //shopping bag
            GestureDetector(
              onTap: () => nextScreen(context, const CartPage()),
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  child: value.cartProducts.isEmpty
                      ? const Icon(Icons.shopping_cart_checkout)
                      : Badge(
                          label: Text(value.cartProducts.length.toString()),
                          offset: const Offset(8, -7),
                          child: const Icon(Icons.shopping_cart_checkout),
                        ),
                ),
              ),
            ),
          ],
        ),
        //Products GideView
        body: MasonryGridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            var eachProducts = products[index];
            return ProductsTile(eachProducts: eachProducts);
          },
        ),
      ),
    );
  }
}
