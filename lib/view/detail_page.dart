// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_ui/constants/fonts.dart';
import 'package:sushi_ui/model/cart_model.dart';
import 'package:sushi_ui/model/prouduct_model.dart';
import 'package:sushi_ui/view/cart_page.dart';

class DetailPage extends StatefulWidget {
  Products products;
  DetailPage({super.key, required this.products});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

dynamic qty = 1;

class _DetailPageState extends State<DetailPage> {
  void addQty() {
    setState(() {
      qty++;
    });
  }

  void removeQty() {
    setState(() {
      if (qty > 1) {
        qty--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //add product to cart
    void addProductsToCart(Products products) {
      Provider.of<Cart>(context, listen: false).addToCart(products, qty);
      //alert dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.teal[700],
            title: Text(
              'Added Sucessfully',
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
              'Detail',
              style: fontsAppbar,
            ),
            //cart page
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ),
                ),
                icon: const Icon(Icons.shopping_cart_checkout_rounded),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(widget.products.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //name
                        Text(
                          widget.products.name,
                          style: fontsName,
                        ),
                        //price
                        Text(
                          '${widget.products.price}\$',
                          style: fontsPrice,
                        ),
                      ],
                    ),
                  ),
                  //weigth
                  Text(
                    '${widget.products.weigth}g',
                    style: fontsWeigth,
                  ),
                  //description
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Text(
                      'Description',
                      style: fontsName,
                    ),
                  ),

                  Text(
                    'Sushi is a popular food in the world that from Japan.Japan people\'s is always eats this sushi every day and it is a culture of Japan',
                    style: fontsWeigth,
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal[700],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //remove
                      IconButton.outlined(
                        color: Colors.white,
                        onPressed: () => removeQty(),
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                      //qty
                      Text(
                        qty.toString(),
                        style: fontsQty,
                      ),
                      //add
                      IconButton.outlined(
                        color: Colors.white,
                        onPressed: () {
                          addQty();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                //btn add to cart
                GestureDetector(
                  onTap: () => addProductsToCart(widget.products),
                  child: Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal[700],
                    ),
                    child: Center(
                      child: Text(
                        'Add To Cart',
                        style: fontsButton,
                      ),
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
