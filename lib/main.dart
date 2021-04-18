import 'package:flutter/material.dart';
import 'package:fl_expression_tree/pages/tree.dart';
import 'package:fl_expression_tree/pages/home.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expression Tree',
        debugShowCheckedModeBanner: false,
        home: Start());
  }
}

class Start extends StatefulWidget {
  Start({Key key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  int current = 0;
  List<Widget> pages = [HomePage(), TreePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expression Tree'),
      ),
      body: this.pages[current],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Edit', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'View', icon: Icon(Icons.calculate))
        ],
      ),
    );
  }
}

// void showTree() {
//   // this.graphTreeController.text = this.txtExpressionController.text;
//   var value = this.txtExpressionController.text;
//   this.graphTreeController.value = TextEditingValue(
//     text: value,
//     selection: TextSelection.fromPosition(
//       TextPosition(offset: value.length),
//     ),
//   );
//   print('hello world');
// }

// Widget btnRun() {
//   return cltDecorated(ElevatedButton(
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Icon(Icons.run_circle),
//           Text('Run'),
//         ],
//       ),
//       onPressed: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => TreePage()));
//         // this.showTree();
//       }));
// }

// Widget graphTree() {
//   return cltDecorated(
//     TextField(
//       decoration: InputDecoration(fillColor: Colors.white, filled: true),
//       controller: this.graphTreeController,
//     ),
//   );
// }

// Widget cltDecorated(Widget widget) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
//     child: widget,
//   );
// }
// }
