import 'package:applifecyle_demo/inherited_example/inherited_page.dart';
import 'package:flutter/material.dart';

class ColorButtonState extends StatefulWidget {
  final Widget child;
  Color? color;

  ColorButtonState({required this.child, this.color = Colors.blue});

  // aceder ao atributo "state" do InheritedPage, sendo do tipo
  // ColorButtonState, assim temos a nossa implementação para este widget

  static ColorButtonStateState of(BuildContext context) {
    return InheritedPage.of(context)!.state;
  }

  @override
  ColorButtonStateState createState() => ColorButtonStateState();
}

class ColorButtonStateState extends State<ColorButtonState> {
  Color? color;

  void updateButtonColor(Color newColor) {
    setState(() {
      color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    //informamos qual estado queremos controlar, sendo este mesmo
    // e também o Widget que estará usando este dado e suas modificações
    // No caso, faremos um wrap com a app inteira como nosso widget
    return InheritedPage(state: this, child: widget.child);
  }
}
