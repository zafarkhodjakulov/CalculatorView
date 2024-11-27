import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String display = '';

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        display = '';
      } else if (value == '=') {
        try {
          display = _calculate(display);
        } catch (e) {
          display = 'Error';
        }
      } else {
        display += value;
      }
    });
  }

  String _calculate(String input) {
    // This is a very basic calculator. For advanced parsing, you can use a library like math_expressions.
    double result = 0;
    if (input.contains('+')) {
      var parts = input.split('+');
      result = double.parse(parts[0]) + double.parse(parts[1]);
    } else if (input.contains('-')) {
      var parts = input.split('-');
      result = double.parse(parts[0]) - double.parse(parts[1]);
    } else if (input.contains('x')) {
      var parts = input.split('x');
      result = double.parse(parts[0]) * double.parse(parts[1]);
    } else if (input.contains('%')) {
      var parts = input.split('%');
      result = double.parse(parts[0]) % double.parse(parts[1]);
    }
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator by Roshan"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                display,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("C"),
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("+"),
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
                buildButton("0"),
                buildButton("x"),
                buildButton("%"),
                buildButton("="),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Color(0xffbed3de),
        ),
        onPressed: () => buttonPressed(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
