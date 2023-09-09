import 'dart:math';

import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  double firstNum=0.0;
  double secondNum=0.0;
  var input='';
  var output='';
  var operation='';
  var hideinput=false;
  var outputsize =40;

  onButtonClicked(value){
    if(value == "C"){
      input='';
      output='';
    }
    else if(value=="<-"){
      if(input.isNotEmpty){
        input=input.substring(0,input.length-1);
      }
    }
    else if(value=="="){
      if(input.isNotEmpty){
        var userInput=input;
        userInput=input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression= p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue=expression.evaluate(EvaluationType.REAL, cm);
        output=finalValue.toString();
        if(output.endsWith(".0")){
          output=output.substring(0,output.length-2);
        }
        input=output;
        hideinput=true;
        outputsize;

      }
    }
    else{
      input=input+value;
      hideinput=false;
      outputsize=34;

    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          
          Expanded(
            child: Container(
              width: double.infinity,
              padding:EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideinput? "":input,style: TextStyle(fontSize: 40),),
                  SizedBox(height: 20,),
                  Text(output,style: TextStyle(fontSize: outputsize.toDouble(),color:Colors.white54),),

                ],
              ),
            ),
          ),


          Row(
              children: [
                Button(text: "C",bgColor: Colors.red.shade700),
                Button(text: "%"),
                Button(text:"<-"),
                Button(text: "/"),
              ]
          ),
          Row(
              children: [
                Button(text: "7"),
                Button(text: "8"),
                Button(text: "9"),
                Button(text: "x"),
              ]
          ),
          Row(
              children: [
                Button(text: "4"),
                Button(text: "5"),
                Button(text: "6"),
                Button(text: "-"),
              ]
          ),
          Row(
            children: [
              Button(text: "1"),
              Button(text: "2"),
              Button(text: "3"),
              Button(text: "+"),
            ]
          ),
          Row(
              children: [
                Button(text: "00"),
                Button(text: "0"),
                Button(text: "."),
                Button(text: "=",bgColor: Colors.red.shade700),
              ]
          )
        ],
      ),
    );
  }
  Widget  Button({text,tColor=Colors.white,bgColor=black}){
    return Expanded(
    child:  Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22)),
          padding: EdgeInsets.all(25)
        ),
        onPressed: ()=>onButtonClicked(text),
        child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),

      ),
    ),
    );
}
}
