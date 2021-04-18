import 'package:flutter/material.dart';

// class HomeStateless extends StatelessWidget {
//   const HomeStateless({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'Expression Tree', home: Home());
//   }
// }

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Home createState() => Home();
}

class Home extends State<HomePage> {
  TextEditingController txtExpressionController = TextEditingController();

  @override
  void dispose() {
    this.txtExpressionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return this.body();
  }

  Widget body() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
          child: Column(
        children: [this.txtExpression()],
      )),
    );
  }

  Widget txtExpression() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Expression', fillColor: Colors.white, filled: true),
        controller: this.txtExpressionController,
      ),
    );
  }
}
