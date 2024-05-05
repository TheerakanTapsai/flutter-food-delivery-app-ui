import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/SelectedIndex.dart';
import '../widgets/BottomNavBarWidget.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AccountsPage> {
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
      body: Center(
        child: Text("Accounts Page"),
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onIndexChanged: (index) {
          selectedIndexModel.setIndex(index);
        },
      ),
    );
  }
}
