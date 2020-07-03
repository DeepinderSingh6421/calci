import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Smile Calculator'),
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
  //this is class where we are going to work
  //we are going to create a string which we would use to display output
  String output = '0';

  //We are declaring some variables to store the value
  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = ''; // for operations

  buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'X' ||
        buttonText == '/') {
      num1 = double.parse(output);

      operand = buttonText;

      _output = '0';
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        print('Already contains a Decimal');
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);

      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'X') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }

      //reset the values
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output = _output + buttonText;
    }

    //finaly printing output
    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new FloatingActionButton(
        onPressed: () => buttonPressed(buttonText),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          child: Column(children: <Widget>[
            new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child: new Text(
                output,
                style: new TextStyle(
                  fontSize: 78.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Expanded(
              child: new Divider(),
            ),
            new Column(
              children: <Widget>[
                new Row(children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ]),
                new Row(children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('X'),
                ]),
                new Row(children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ]),
                new Row(children: [
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('00'),
                  buildButton('+'),
                ]),
                new Row(children: [
                  buildButton('C'),
                  buildButton('='),
                ]),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
