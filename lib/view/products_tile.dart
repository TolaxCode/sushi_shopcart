import 'package:flutter/material.dart';
import 'package:sushi_ui/constants/fonts.dart';
import 'package:sushi_ui/model/prouduct_model.dart';
import 'package:sushi_ui/view/detail_page.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({
    super.key,
    required this.eachProducts,
  });

  final Products eachProducts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          //on tap
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailPage(
                    products: eachProducts,
                  );
                },
              ),
            ),
            //image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(eachProducts.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //name food
                Text(
                  eachProducts.name,
                  style: fontsName,
                ),
                //price
                Text(
                  '${eachProducts.price}\$',
                  style: fontsPrice,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
