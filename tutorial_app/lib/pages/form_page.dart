import 'package:flutter/material.dart';
import './form_result_page.dart';

class FormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<FormPage> {
  String name;
  String dropDownValue;
  double sliderValueGreen = 5.0;
  double sliderValueRed = 5.0;
  double sliderValueBlue = 5.0;
  bool activated = false;
  TextEditingController myController = TextEditingController();

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
                dropDownValue = value;
              });
            },
            value: dropDownValue,
            isExpanded: false,
          ),
        ),
      ],
    );
  }

  Widget _buildSlidersAndSwitches() {
    return Column(
      children: <Widget>[
        _buildSliderButtonRowGreen(),
        _buildSliderButtonRowRed(),
        _buildSliderButtonRowBlue(),
        Container(
          child: Switch(
              value: activated,
              activeColor: Colors.green,
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.red,
              inactiveThumbColor: Colors.red,
              onChanged: (bool active) {
                setState(() => activated = active);
              }),
        ),
      ],
    );
  }

  Widget _buildSliderButtonRowGreen() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Slider(
            min: 0.0,
            max: 255.0,
            divisions: 255,
            value: sliderValueGreen,
            activeColor: Colors.green,
            onChanged: (newRating) {
              setState(() => sliderValueGreen = newRating);
            },
          ),
        ),
        Text('${this.sliderValueGreen.toStringAsFixed(0)}'),
        SizedBox(width: 5.0,),
      ],
    );
  }

  Widget _buildSliderButtonRowRed() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Slider(
            min: 0.0,
            max: 255.0,
            divisions: 255,
            value: sliderValueRed,
            activeColor: Colors.red,
            onChanged: (newRating) {
              setState(() => sliderValueRed = newRating);
            },
          ),
        ),Text('${this.sliderValueRed.toStringAsFixed(0)}'),
        SizedBox(width: 5.0,),
      ],
    );
  }

  Widget _buildSliderButtonRowBlue() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Slider(
            min: 0.0,
            max: 255.0,
            divisions: 255,
            value: sliderValueBlue,
            activeColor: Colors.blue,
            onChanged: (newRating) {
              setState(() => sliderValueBlue = newRating);
            },
          ),
        ),
        Text('${this.sliderValueBlue.toStringAsFixed(0)}'),
        SizedBox(width: 5.0,),
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
        decoration: BoxDecoration(
          color: Color.fromRGBO(this.sliderValueRed.round(),
              this.sliderValueGreen.round(), this.sliderValueBlue.round(), 1),
        ),
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
            _buildSlidersAndSwitches(),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormResultPage(
                            this.myController,
                            this.name,
                            this.sliderValueGreen,
                            this.sliderValueRed,
                            this.sliderValueBlue,
                            this.activated,
                            this.dropDownValue),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
