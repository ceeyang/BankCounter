import 'package:flutter/material.dart';

class CommonHeader extends StatefulWidget {
  CommonHeader({
    this.title,
  });

  final String? title;

  @override
  _CommonHeaderState createState() => _CommonHeaderState();
}

class _CommonHeaderState extends State<CommonHeader> {
  List<String> _items = [];
  bool _isLogined = true;
  int _index = 0;

  @override
  void initState() {
    super.initState();

    _items = ['item0', 'item1', 'item2'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'BANK COUNTER',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white, width: 2),
              ),
            ),
            child: Row(
              children: _items.map((e) => _buildNavItems(e)).toList(),
            ),
          ),
          InkWell(
            onTap: () => _loginBtnOnTap,
            child: Text(
              _isLogined ? 'Login' : 'Logout',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNavItems(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          )
        ],
      ),
    );
  }

  _loginBtnOnTap() {
    _isLogined = false;
    setState(() {});
  }
}
