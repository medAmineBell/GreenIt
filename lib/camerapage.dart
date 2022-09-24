import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/detail.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<Product> _product = [
    Product(
      image: '1.png',
      title: 'Succulent Plant',
      price: 29.99,
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    Product(
      image: '5.png',
      title: 'Dragon Plant',
      price: 25.99,
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
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
      image: '4.png',
      title: 'Ipsum Plant',
      price: 30.99,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18, left: 14, right: 14),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GreenIt',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Do you have soil or balcony ?',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  "assets/images/soil.jpg",
                  height: 150,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'OR',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  "assets/images/balcony.jpg",
                  height: 150,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            size: 30,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget _sortButton() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: RotatedBox(
        quarterTurns: 45,
        child: Icon(
          Icons.tune,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _categoryItem({bool isActived = false, @required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: TextStyle(
              color: isActived ? Colors.green : Colors.grey,
              fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          height: 4,
          width: 35,
          decoration: isActived
              ? BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                )
              : BoxDecoration(),
        )
      ],
    );
  }

  Widget _productItem({String title, image, price, bool isFavorited}) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 25,
                        width: 100,
                        decoration: new BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(100, 25)),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/$image',
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: isFavorited
                        ? Colors.green.shade100
                        : Colors.grey.shade400,
                  ),
                  child: Icon(Icons.favorite,
                      color: isFavorited ? Colors.green : Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '$title',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade400,
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Product {
  String title;
  double price;
  String image;
  String desc;

  Product({this.title, this.price, this.image, this.desc});
}
