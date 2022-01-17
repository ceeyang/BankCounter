import 'package:bank_counter/widgets/common_header.dart';
import 'package:flutter/material.dart';

/// HOME
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            CommonHeader(),
          ],
        ),
      ),
    );
  }
}
