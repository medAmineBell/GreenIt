import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/detail.dart';
import 'package:flutter_plant_shop_ui/models/product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> product = [
    Product(
      image: '6.png',
      title: 'Raevnea Plant',
      price: 22.99,
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    Product(
      image: '2.png',
      title: 'Potted Plant',
      price: 24.99,
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    Product(
      image: '3.png',
      title: 'Lorem Plant',
      price: 19.99,
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
  ];

  String getTotal() {
    double total = 0;
    product.forEach((element) {
      total += element.price;
    });
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18, left: 14, right: 14),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'GreenIt',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  getTotal(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          product: product[index],
                        ),
                      ),
                    );
                  },
                  child: _productItem(
                    title: product[index].title,
                    image: product[index].image,
                    price: product[index].price.toString(),
                  ),
                );
              },
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _productItem({String title, image, price}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Image.asset(
                'assets/images/$image',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              '$title',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '$price',
            ),
          ],
        ),
      ),
    );
  }
}
