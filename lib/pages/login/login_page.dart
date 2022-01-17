import 'package:bank_counter/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _accountCtr = TextEditingController();
  final TextEditingController _passwordCtr = TextEditingController();

  bool _isLoging = false;

  @override
  void initState() {
    super.initState();
  }

  _login() {
    _isLoging = true;
    setState(() {});
    Future.delayed(const Duration(seconds: 3), () {
      _isLoging = false;
      setState(() {});
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.3),
              Theme.of(context).primaryColor
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.all(50),
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 38,
                ),
              ),
            ),
            _loginContainer(),
            Container(
              margin: const EdgeInsets.all(50),
              child: const Text(
                'CEE.YANG',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginContainer() {
    return Card(
      elevation: 15.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                'User Login',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 28,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 60,
              child: TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "UserName",
                ),
                controller: _accountCtr,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 60,
              child: TextField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock_outline),
                    labelText: "Password",
                  ),
                  controller: _passwordCtr,
                  obscureText: true),
            ),
            _loginBtn(),
          ],
        ),
      ),
    );
  }

  Widget _loginBtn() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 40,
      width: 360,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () => _login(),
        child: _isLoging
            ? Theme(
                data: ThemeData(
                  cupertinoOverrideTheme:
                      const CupertinoThemeData(brightness: Brightness.dark),
                ),
                child: const CupertinoActivityIndicator(),
              )
            : const Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
      ),
    );
  }
}
