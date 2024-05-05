import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app_ui/animation/RotationRoute.dart';
import 'package:flutter_food_delivery_app_ui/animation/ScaleRoute.dart';
import 'package:flutter_food_delivery_app_ui/pages/AccountsPage.dart';
import 'package:flutter_food_delivery_app_ui/pages/FoodDetailsPage.dart';
import 'package:flutter_food_delivery_app_ui/pages/FoodOrderPage.dart';
import 'package:flutter_food_delivery_app_ui/pages/HomePage.dart';
import 'package:flutter_food_delivery_app_ui/pages/NearbyScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../model/SelectedIndex.dart';

class BottomNavBarWidget extends StatefulWidget {
  final Function(int) onIndexChanged;

  BottomNavBarWidget({required this.onIndexChanged});

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  void navigateToScreens(int index) {
    if (index == 0) {
      Navigator.push(context, ScaleRoute(page: HomePage()));
    } else if (index == 1) {
      Navigator.push(context, ScaleRoute(page: NearbyScreen()));
    } else if (index == 2) {
      Navigator.push(context, ScaleRoute(page: FoodOrderPage()));
    } else {
      Navigator.push(context, ScaleRoute(page: AccountsPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedIndexModel>(builder: (context, model, child) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.near_me), label: 'Near By'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user), label: 'Account'),
        ],
        selectedLabelStyle: TextStyle(color: Color(0xFF2c2b2b)),
        onTap: (index) {
          setState(() {
            model.setIndex(index);
            // navigateToScreens(_selectedIndex);
          });
          navigateToScreens(model.selectedIndex);
          widget.onIndexChanged(index);
        },
        currentIndex: model.selectedIndex,
        selectedItemColor: Color(0xFFfd5352),
      );
    });
  }
}
