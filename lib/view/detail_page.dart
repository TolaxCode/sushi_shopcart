// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_ui/constants/fonts.dart';
import 'package:sushi_ui/constants/route_screen.dart';
import 'package:sushi_ui/model/cart_model.dart';
import 'package:sushi_ui/model/prouduct_model.dart';
import 'package:sushi_ui/view/cart_page.dart';

class DetailPage extends StatefulWidget {
  Products products;
  DetailPage({super.key, required this.products});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

int qty = 1;

class _DetailPageState extends State<DetailPage> {
  void addQty() {
    setState(() {
      qty++;
    });
  }

  void removeQty() {
    setState(() {
      qty > 1 ? qty-- : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //add product to cart
    void addProductsToCart(Products products) {
      Provider.of<Cart>(context, listen: false).addToCart(products);
      //alert dialog
      showMessage(context, 'Added Sucessfully');
    }

    return Consumer<Cart>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            centerTitle: true,
            title: Text(
              'Detail',
              style: fontsAppbar,
            ),
            //cart page
            actions: [
              GestureDetector(
                onTap: () => nextScreen(context, const CartPage()),
                child: Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: value.cartProducts.isEmpty
                      ? const Icon(Icons.shopping_cart_checkout)
                      : Badge(
                        
                          label: Text(value.cartProducts.length.toString()),
                          offset: const Offset(8, -7),
                          child: const Icon(Icons.shopping_cart_checkout),
                        ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
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
                    'Sushi is a popular food in the world that from Japan.Japan people\'s is always eats this sushi every day and it is a culture of Japan.It is very good for healty and younger than old.',
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
                        onPressed: () => addQty(),
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
