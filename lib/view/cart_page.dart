import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_ui/constants/fonts.dart';
import 'package:sushi_ui/model/cart_model.dart';
import 'package:sushi_ui/model/prouduct_model.dart';
import 'package:sushi_ui/view/detail_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    void removeProductsFromCart(Products products) {
      Provider.of<Cart>(context, listen: false).removeToCart(products);
      //alert dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.teal[700],
            title: Text(
              'Remove Sucessfully',
              style: fontsButton,
            ),
            icon: const Icon(
              Icons.check,
              size: 30,
              color: Colors.white,
            ),
          );
        },
      );
    }

    return Consumer<Cart>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.grey[400],
          appBar: AppBar(
            backgroundColor: Colors.grey[400],
            centerTitle: true,
            title: Text(
              'My Cart',
              style: fontsAppbar,
            ),
          ),
          body: value.cartProducts.isEmpty
              ? Center(
                  child: Text(
                    'Don\'t have products!',
                    style: fontsName,
                  ),
                )
              : ListView.builder(
                  itemCount: value.cartProducts.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          color: Colors.grey.shade400,
                          child: ListTile(
                            minLeadingWidth: 100,
                            leading: Container(
                              width: 80,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                      value.cartProducts[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(
                              value.cartProducts[index].name,
                              style: fontsName,
                            ),
                            subtitle: Text(
                              '${value.cartProducts[index].price * qty}\$',
                              style: fontsPrice,
                            ),
                            trailing: IconButton(
                              onPressed: () => removeProductsFromCart(
                                  value.cartProducts[index]),
                              icon: const Icon(
                                Icons.delete_sharp,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total : ',
                        style: fontsButton,
                      ),
                      Text(
                        '${(value.totalPrice()) * qty}\$',
                        style: fontsButton,
                      ),
                    ],
                  ),
                ),
                //btn add to cart
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pay Now',
                          style: fontsButton,
                        ),
                        const Icon(
                          Icons.arrow_right_alt,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
