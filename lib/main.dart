import 'dart:developer';

import 'package:applifecyle_demo/inherited_example/color_button_state.dart';
import 'package:applifecyle_demo/lifecycle_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorButtonState(child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'One';

  void updateTitleAndColor() {
    setState(() {
      title = title == 'One' ? 'Whatever' : 'One';
    });
  }

  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(
          title: title,
          onPressed: updateTitleAndColor,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    log('called didUpdateWidget');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    log('called didChangeDependencies');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    log('called deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    log('called dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorButton = ColorButtonState.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorButton.color,
        // onPressed: widget.onPressed,
        onPressed: () => colorButton.updateButtonColor(
            colorButton.color == Colors.blueGrey
                ? Colors.blue
                : Colors.blueGrey),
        // onPressed: () => Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (_) => SecondScreen())),
        child: const Icon(Icons.forward),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SEGUNDA TELA',
        ),
      ),
      body: Center(
        child: Text(
          'SEGUNDA TELA',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
