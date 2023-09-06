import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sushi_ui/constants/fonts.dart';
import 'package:sushi_ui/model/prouduct_model.dart';
import 'package:sushi_ui/view/products_tile.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: Text(
          'What Do You Like ?',
          style: fontsAppbar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.builder(
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
