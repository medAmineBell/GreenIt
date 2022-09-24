import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/detail.dart';
import 'package:flutter_plant_shop_ui/models/product.dart';
import 'package:flutter_plant_shop_ui/rootpage.dart';
import 'package:flutter_plant_shop_ui/signin/signin.dart';

class FeaturedPage extends StatefulWidget {
  @override
  _FeaturedPageState createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  Map<String, bool> types = {
    "Tree": false,
    "Plant": false,
    "Flower": false,
    "Grass": false,
    "Cactus": false,
    "Indoor": false,
  };

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Next',
        onClicked: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => RootPage()));
        },
      );

  Widget buildTypes() {
    List<Widget> chips = [];

    types.forEach((key, value) {
      FilterChip filterChip = FilterChip(
        selected: types[key] as bool,
        label: Text(key, style: TextStyle(color: Colors.black)),
        elevation: 2,
        pressElevation: 1,
        //shadowColor: Colors.teal,
        backgroundColor: Colors.white,
        selectedColor: Theme.of(context).primaryColor,
        onSelected: (bool selected) {
          setState(() {
            types[key] = selected;
          });
        },
      );
      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: filterChip));
    });

    return Column(
      children: [
        if (chips.isNotEmpty)
          Text(
            "Choose your best type of plants",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        SizedBox(
          height: 20,
        ),
        Wrap(
          // This next line does the trick.
          alignment: WrapAlignment.start,

          children: chips,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset("assets/images/logo.png"),
            ),
            buildTypes(),
            SizedBox(
              height: 100,
            ),
            Center(child: buildUpgradeButton()),
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    this.text,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        child: Text(text),
        onPressed: onClicked,
      );
}
