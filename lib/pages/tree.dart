import 'package:flutter/material.dart';
import 'package:fl_expression_tree/model/operand.dart';
import 'dart:convert';

class TreePage extends StatefulWidget {
  TreePage({Key key}) : super(key: key);

  @override
  Tree createState() => Tree();
}

class Tree extends State<TreePage> {
  TextEditingController txtExpressionController = TextEditingController();

  @override
  void dispose() {
    this.txtExpressionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShapePainter(),
      child: Container(),
    );
  }
}

class ShapePainter extends CustomPainter {
  Canvas _canvas;
  Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    this._paint = Paint()
      ..color = Colors.blue[800]
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    this._canvas = canvas;

    // Offset startingPoint = Offset(0, size.height / 2);
    // Offset endingPoint = Offset(size.width, size.height / 2);

    // canvas.drawLine(startingPoint, endingPoint, paint);

    String json = '{ "op": "+","children":[{"op":"myFunction","children":[{"op":"b"},{"op":"45.6"},{"op":"c"}]  },{"op":"1"}]}  ';
    Map<String, dynamic> map = jsonDecode(json);
    Operand operand = Operand.fromJson(map);
    print('Howdy, ${operand.children[0].op}!');

    this.drawOperand(operand, 0, size.width, 10);
  }

  void drawOperand(Operand operand, double start, double end, double height) {
    TextSpan span = new TextSpan(
        style: new TextStyle(color: Colors.blue[800]), text: operand.op);
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();

    double x = start + ((end - start) / 2) ;
    tp.paint(this._canvas, new Offset(x-(tp.width/2), height));
    if(operand.children != null){
      double childWidth = (end - start)/operand.children.length;
      double childHeight= height+35;
      Offset lineStart = Offset(x, height+15);
      for(int i=0;i<operand.children.length;i++){
        double childStart = start+(childWidth*i);
        double childEnd = childStart + childWidth;
        double childX = childStart + ((childEnd - childStart) / 2);
        Offset lineEnd = Offset(childX, childHeight);
        this._canvas.drawLine(lineStart, lineEnd, this._paint);

        this.drawOperand(operand.children[i],childStart, childEnd, childHeight);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
