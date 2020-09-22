import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Dados'),
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
  var random = new Random();
  var _dado1, _dado2;
  final double dimensiones = 170;

  void _generarNumeroAleatorio() {
    var min = 1;
    var max = 6;
    setState(() {
      _dado1 = (min + random.nextInt(max - min)).toString();
      _dado2 = (min + random.nextInt(max - min)).toString();
      print('Dado 1: $_dado1');
      print('Dado 2: $_dado2');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text('Atínale al dado y te ganas 10 pelucholares',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: Image(height: dimensiones,width: dimensiones,image: AssetImage('images/$_dado1.jpg'),),),
                Expanded(child: Image(height: dimensiones,width: dimensiones,image: AssetImage('images/$_dado2.jpg'),),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(onPressed: (){
                _generarNumeroAleatorio();
              },
              child: Text('Presiona para generar'),),
            )
          ],
        ),
      ),
    );
  }
}
