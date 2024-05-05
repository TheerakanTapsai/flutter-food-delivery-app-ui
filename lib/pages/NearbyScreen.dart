import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app_ui/widgets/BottomNavBarWidget.dart';
import 'package:provider/provider.dart';

import '../model/SelectedIndex.dart';

class NearbyScreen extends StatefulWidget {
  const NearbyScreen({super.key});

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedIndexModel = Provider.of<SelectedIndexModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF3a3737),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              selectedIndexModel.setIndex(0);
            }),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text("Nearby Page"),
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
