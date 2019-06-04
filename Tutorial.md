# Dart tutorial

**_Keep in mind that using your IDE and hovering over a widget will show you detailed information                                   about the widgets properties. This will be useful because we are not going to explain every single property we used. Also most of the properties we set only have design purposes and won't influence the functionality._**

## Goals of this tutorial
This tutorial will show how to develop a simple application using Stateful/Stateless Widgets and basic Widgets that ship with the Flutter framework. The end result should consist of two pages, one where the user can enter a few values using forms like TextFormField, DropdownButtons, Sliders or just simple Buttons. The second page is called when the button was pressed. It will display the information the user entered on Page \#1. 

At last, for navigation between pages we will be using the navigator functionaliy that ships with flutter.

## Most important concepts/properties
**child: / children :<Widget>[]** : this property is probably one of the most important ones used. As you are going about building your widget tree, you are going to have to use parent-child-relationships a lot. Some widgets can only have one child, others may have several widget-children.


## Part One - Designing the User Interface of the First Page

**This will not be a complete tutorial of how to implement each and every possible widget as that would be way to much so feel free to play around with the stuff we show you here but also check out the [Dart Widget Library](https://api.flutter.dev/flutter/widgets/widgets-library.html)**

### Stateful or Stateless Widget?
First of all we will need to decide if we are going to use a stateful or a stateless widget for our first page. 
As you can find in our presentation, stateless widgets are used when values are passed down to a widget and are only displayed there, never changed. Since we want to use some **_dynamic_** widgets for the UI we are going to use a stateful widget here.



First of, we create our class that extends the StatefulWidget class. The @override annotation ensures that the createState()-Method is called whenever the values chage and to guarantee an automatic rebuilt of the page.

```dart
class FormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}
```
Next, were going to create the class _MyFormPageState_ that extends the state we just created. In every StatefulWidget we need a build()-Method that returns another widget, in this case what we want to display on the first page.

As you can see we pass the _BuildContext context_ to the build()-method. The BuildContext represents a handle as to where in the widget tree this widget is located. It carries global values like the Colortheme of the App which you only have to set once and can reuse it whenever you need to, given that you can access the BuildContext. Every Widget has it's own BuildContext which will enter a parent-child relationship if the widget does have a child. Basically, it carries values that every widgets needs to be able to access. 

Lastly, we just included a few variables that we are going to need later in the tutorial. The only notable addition here is the _TextEditingController_. This controller allows for easy access to the value of a text field that is associated with the controller.

```dart
class _MyFormPageState extends State<FormPage> {
  String name;
  String dropDownValue;
  double sliderValueGreen = 5.0;
  double sliderValueRed = 5.0;
  double sliderValueBlue = 5.0;
  bool activated = false;
  TextEditingController myController = TextEditingController();
  
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
```
### Building a Scaffold
```dart
//...
Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Tutorial App'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(this.sliderValueRed.round(),
              this.sliderValueGreen.round(), this.sliderValueBlue.round(), 1),
        ),
),
//...
```
The Scaffold is probably one of the most commonly used widgets for getting a basic page of an application set up. It's property _appbar_ enables you to set a coloured bar at the top, displaying a title and do other fancy things. The _body_ will then take up whatever space is left below the appbar. This is where most of the interaction will take place later, this is the main user interface of the page. 

### Building a Slider widget
```dart
  Widget _buildSliderButtonBlue() {
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
```
Here we build our own Widget that will display a slider which will influence the associated value _sliderValueBlue_. Imagine this like a volume slider whose value you can change by dragging across it. The _Row_, _Expanded_ and _SizedBox_ Widget only serve design purposes here. 

Most important about the Slider widget is the _onChanged-Method_ which will be called whenever...you guessed it, the value changes due to user input. We call a setState()-method that will assign the newly chosen value _newRating_ to our _sliderValueBlue_ that we are going to use as our blue-part of the background color rgb.

Another important feature here is the Text, well not the TextWidget itself but what we do with it. Using '${}' you can access values and dynamically change displayed strings. In this case we display the chosen value next to the slider.

Alltogether we create three of the above methods, one for each value of the rgb color so basically just copy-paste and changing blue to red or green respectively.

### Building a TextFormField
```dart
//...
TextFormField(
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
//...
```
The TextFormField is assigned to the controller we created earlier by using it's property _controller_.
As you can see above there are a lot of things you can do to change the design of the input field like setting the _keyboardType_ and especially using the _decoration_ property. These don't add to the functionality though. The most important thing is to add the controller here so we can access the entered value later.

### Building a DropDownButton
```dart
DropdownButton(
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
```
The DropDownButton has a property _items_ which is a list of DropDownMenuItems. These represent the individual items we want to display when the button is clicked. For each Item we assign an individual value. Using the child property we add what we want to display in the List-Item itself. Here we chose to use Icons but you can choose whatever you want to display. 

The onChanged-method has the same functionality as described before. It's important to assign our _dropDownValue_ to the _value_ property enabling us to access this value later by saving it to our variable. 

### Building a Switch
```dart 
Switch(
    value: activated,
    activeColor: Colors.green,
    activeTrackColor: Colors.green,
    inactiveTrackColor: Colors.red,
    inactiveThumbColor: Colors.red,
    onChanged: (bool active) {
      setState(() => activated = active);
    }),
```
This will build a switch that will later decide if we want to display the chosen color as the background color of our second page. **Important: value-assignment, onChanged**. The rest is again, design-only.

### Building a Button
```dart
//...
RaisedButton(
    elevation: 4,
    splashColor: Colors.black,
    textColor: Colors.white,
    child: Text('Show results!'),
    color: Colors.green,
    onPressed: () => {}
    ),
//...
Here we see how to implement a RaisedButton and add some design to it. Again, the most important thing here will be the onPressed-method later.

### End of Part One
So after playing around and implementing some widgets, this is what our class looks like. Feel free to check it out and get some inspiration.

```dart
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
                  onPressed: () => {},
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

```
