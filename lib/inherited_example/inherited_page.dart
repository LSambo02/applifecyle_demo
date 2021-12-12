import 'package:applifecyle_demo/inherited_example/color_button_state.dart';
import 'package:flutter/material.dart';

class InheritedPage extends InheritedWidget {
  final ColorButtonStateState state;

  InheritedPage({required this.state, required Widget child})
      : super(child: child);

  // informa aos widgets dependentes sobre alguma actualização
  @override
  bool updateShouldNotify(InheritedPage old) => true;

  //criação de um método "of" para nos facilitar o acesso para os atributos do nosso InheritedWidegt
  static InheritedPage? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: InheritedPage);
}
