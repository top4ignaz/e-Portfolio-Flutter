import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<FormPage> {
  String _value;
  double _sliderValue = 1.0;
  bool _activated = false;
  TextEditingController myController = TextEditingController();
  Icon dropDownValue = Icon(Icons.access_alarms);

  Widget _buildTextAndDropDownRow() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          flex: 5,
          child: TextFormField(
            controller: myController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              labelText: 'Email/Username',
              labelStyle: TextStyle(color: Colors.black45),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: DropdownButton(
            items: [
              DropdownMenuItem(
                value: "1",
                child: Icon(Icons.build),
              ),
              DropdownMenuItem(
                value: "2",
                child: Icon(Icons.settings),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
            value: _value,
            isExpanded: false,
          ),
        ),
      ],
    );
  }

  Widget _buildSliderButtonRow() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Slider(
            min: 0.0,
            max: 255.0,
            value: _sliderValue,
            activeColor: Colors.green,
            onChanged: (newRating) {
              setState(() => _sliderValue = newRating);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Switch(
              value: _activated,
              activeColor: Colors.green,
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.red,
              inactiveThumbColor: Colors.red,
              onChanged: (bool active) {
                setState(() => _activated = active);
              }),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Tutorial App'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            _buildTextAndDropDownRow(),
            SizedBox(
              height: 15.0,
            ),
            _buildSliderButtonRow(),
            SizedBox(
              height: 15.0,
            ),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                elevation: 4,
                splashColor: Colors.black,
                textColor: Colors.white,
                child: Text('Show results!'),
                color: Colors.green,
                onPressed: () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
