import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app_ui/animation/ScaleRoute.dart';
import 'package:flutter_food_delivery_app_ui/pages/SignInPage.dart';
import 'package:flutter_food_delivery_app_ui/widgets/BestFoodWidget.dart';
import 'package:flutter_food_delivery_app_ui/widgets/BottomNavBarWidget.dart';
import 'package:flutter_food_delivery_app_ui/widgets/PopularFoodsWidget.dart';
import 'package:flutter_food_delivery_app_ui/widgets/SearchWidget.dart';
import 'package:flutter_food_delivery_app_ui/widgets/TopMenus.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model/SelectedIndex.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final selectedIndexModel = Provider.of<SelectedIndexModel>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        title: Text(
          "What would you like to eat?",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Color(0xFF3a3737),
              ),
              onPressed: () {
                Navigator.push(context, ScaleRoute(page: SignInPage()));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchWidget(),
            TopMenus(),
            PopularFoodsWidget(),
            BestFoodWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onIndexChanged: (index) {
          selectedIndexModel.setIndex(index);
        },
      ),
    );
  }
}
