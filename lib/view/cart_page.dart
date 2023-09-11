import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_ui/constants/fonts.dart';
import 'package:sushi_ui/constants/route_screen.dart';
import 'package:sushi_ui/model/cart_model.dart';
import 'package:sushi_ui/model/prouduct_model.dart';
import 'package:sushi_ui/view/detail_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //remove product from cart
    void removeProductsFromCart(Products products) {
      Provider.of<Cart>(context, listen: false).removeToCart(products);
      //alert dialog
      showMessage(context, 'Remove Sucessfully!');
    }

    return Consumer<Cart>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            centerTitle: true,
            title: Text(
              'My Cart',
              style: fontsAppbar,
            ),
          ),
          //cart is empty
          body: value.cartProducts.isEmpty
              ? Center(
                  child: Text(
                    'Don\'t have products!',
                    style: fontsName,
                  ),
                )
              //cart is not empty
              : ListView.builder(
                  itemCount: value.cartProducts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey.shade100,
                      child: ListTile(
                        minLeadingWidth: 100,
                        //Image
                        leading: Container(
                          width: 80,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image:
                                  AssetImage(value.cartProducts[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        //name
                        title: Text(
                          value.cartProducts[index].name,
                          style: fontsName,
                        ),
                        //price
                        subtitle: Text(
                          '${value.cartProducts[index].price * qty}\$',
                          style: fontsPrice,
                        ),
                        //btn remove
                        trailing: IconButton(
                          onPressed: () =>
                              removeProductsFromCart(value.cartProducts[index]),
                          icon: const Icon(
                            Icons.close,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //total price
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
                    alignment: Alignment.center,
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal,
                    ),
                    child: Text(
                      'Pay Now',
                      style: fontsButton,
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
