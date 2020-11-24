import 'package:lab6/secondPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Main page'),
      initialRoute: '/',
      routes: {
        // When navigating to the "" route, build the FirstScreen widget.
        '': (context) => MyApp(),
        // When navigating to the "second" route, build the SecondScreen widget.
        'second': (context) => NextPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
                title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Next'),
          onPressed: () => {
            Navigator.pushNamed(context, 'second')// navigate to second route
          },
        ),
      ),
    );
  }
}
