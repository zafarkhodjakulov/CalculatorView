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
      backgroundColor: Color(0xffb1bcc1),
      appBar: AppBar(
        title: Text("Calculator by Roshan"),
        centerTitle: true,
        backgroundColor: Color(0xffbed3de),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                filled: true, // Ichki fonni yoqish
                fillColor: Colors.white, // Ichki fon rangi
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              controller: TextEditingController(text: display),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(height: 10), // Tugmalarni biroz pastroqqa surish uchun
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
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
            ),
          )
        ],
      ),
    );
  }

  Widget buildButton(String value) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffbed3de),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed: () => buttonPressed(value),
      child: Text(
        value,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
