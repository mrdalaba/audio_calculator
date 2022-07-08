import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:audiocalculator/bg_store.dart';





void main(){
  runApp(Farm());
}

class Farm extends StatefulWidget{


  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<Farm> {





  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('/farm/note$soundNumber.wav');
  }



  late int firstNum;
  late int secondNum;
  String history = '0';
  String textToDisplay = '0';
  late String res;
  late String operation;

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      textToDisplay = '0';
      history = "0";
      firstNum = 0;
      secondNum = 0;
      res = '0';
    } else if (btnVal == 'AC') {
      textToDisplay = '0';
      history ="0";
      firstNum = 0;
      secondNum = 0;
      res = '0';
      history = '0';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay);

      res = '0';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'x') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teaching Calculator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0BFC),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
            child: IconButton(

              icon: Icon(
                Icons.calculate,
                color: Color(0xFF39FC07),
                size: 45,
              ),
              onPressed: () {
                // goToBgstore
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BgStoreWidget()
                    ));
              },
            ),
          ),
          title: Text(
            'Teacher Mikes Calculator',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF39FC07),
              fontSize: 22,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/farm/farmbg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFF0A0BFC),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(20),
                      ),
                      border: Border.all(
                        color: Color(0xFF030303),
                        width: 3,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(250, 0, 0, 0),
                      child: Text(
                        history,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF0A0BFC),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(20),
                      ),
                      border: Border.all(
                        color: Color(0xFF030303),
                        width: 3,
                      ),
                    ),
                    child: Container(

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                        child: Text(
                          textToDisplay,
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/ac1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('AC');
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),

                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/c1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('C');
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/del1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('<');
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/divide1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('/');
                          playSound(15);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/sheep1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('7');
                          playSound(7);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/horse1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('8');
                          playSound(8);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/cow1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('9');
                          playSound(9);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/multiply1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('x');
                          playSound(14);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/duck1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('4');
                          playSound(4);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/rabbit1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('5');
                          playSound(5);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/pig1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('6');
                          playSound(6);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/minus1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('-');
                          playSound(11);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/cat1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('1');
                          playSound(1);
                        }, child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/chicken1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('2');
                          playSound(2);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/dog1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('3');
                          playSound(3);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/plus1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('+');
                          playSound(12);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5,5,5,30),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/pm1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('+/-');
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5,5,5,30),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/mouse1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('0');
                          playSound(16);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5,5,5,30),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/001.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('00');
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5,5,5,30),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: AssetImage('assets/farm/equal1.jpg'),
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          btnOnClick('=');
                          playSound(13);
                        }, child: Text(
                        '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}