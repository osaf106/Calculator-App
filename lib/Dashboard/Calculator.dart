import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userInputs = "";
  String results = "0";

  // lists of Buttons
  List<String> buttonsList = [
    "AC",
    "(",
    ")",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "C",
    "0",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/3.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Center(
                  child: Text(
                    "Osaf's Calculator",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 4,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInputs,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 35),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    results,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 50),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: buttonsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 12),
                  itemBuilder: (BuildContext context, int index) {
                    return CustomButton(buttonsList[index]);
                  }))
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CustomButton(String text) {
    return InkWell(
      splashColor: const Color(0xff1d2630),
      onTap: () {
        setState(() {
          handleButton(text);
        });
      },
      child: Ink(
        decoration: BoxDecoration(
          color: getColor(text),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: getTextColor(text),
                fontSize: 30,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  getTextColor(String text) {
    if (text == "(" ||
        text == ")" ||
        text == "/" ||
        text == "C" ||
        text == "*" ||
        text == "-" ||
        text == "+") {
      return const Color.fromARGB(255, 252, 100, 100);
    }
    return Colors.white;
  }

  getColor(String text) {
    if (text == "AC") {
      return const Color.fromARGB(255, 252, 100, 100);
    }
    if (text == "=") {
      return const Color.fromARGB(255, 31, 190, 91);
    }
    return const Color(0xff263141);
  }

  handleButton(String text) {
    if (text == "C") {
      if (userInputs.isNotEmpty) {
        userInputs = userInputs.substring(0, userInputs.length - 1);
        return;
      } else {
        return null;
      }
    }
    if (text == "AC") {
      results = "0";
      userInputs = "";
      return;
    }
    if (text == "=") {
      results = calculate();
      userInputs = results;
      if (results.endsWith(".0")) {
        results = results.replaceAll(".0", "");
        return;
      }
      if (userInputs.endsWith(".0")) {
        userInputs = userInputs.replaceAll(".0", "");
        return;
      }
    }
    if(userInputs != "Syntax Error")
    {
      userInputs += text;
    }

  }

  String calculate() {
    try {
      var exp = Parser().parse(userInputs);
      var eval = exp.evaluate(EvaluationType.REAL, ContextModel());
      return eval.toString();
    } catch (e) {
        print(e);
      return "Syntax Error";
    }
  }
}
