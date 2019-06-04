import 'package:flutter/material.dart';
class FormResultPage extends StatelessWidget {
  final String name;
  final double greenValue;
  final double redValue;
  final double blueValue;
  final bool activeBGColor;
  final String dropDownValue;
  final TextEditingController controller;

  FormResultPage({this.controller, this.name, this.greenValue,this.redValue,this.blueValue,
      this.activeBGColor, this.dropDownValue});
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: activeBGColor
                  ? Color.fromRGBO(redValue.round(), greenValue.round(), blueValue.round(), 1)
                  : Colors.lightBlueAccent),
          child: Column(
            children: <Widget>[
              Spacer(
                flex: 4,
              ),
              Row(
                children: <Widget>[
                  Spacer(
                    flex: 40,
                  ),
                  Text(this.controller.text),
                  Spacer(flex: 4,),
                  Icon(
                      this.dropDownValue == "1" ? Icons.build : Icons.settings),
                  Spacer(
                    flex: 40,
                  ),
                ],
              ),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
