# Dart tutorial
## Goals of this tutorial
This tutorial will show how to develop a simple application using Stateful/Stateless Widgets and basic Widgets that ship with the Flutter framework. The end result should consist of two pages, one where the user can enter a few values using forms like TextFormField, DropdownButtons, Sliders or just simple Buttons. The second page is called when the button was pressed. It will display the information the user entered on Page \#1. 

At last, for navigation between pages we will be using the navigator functionaliy that ships with flutter.
---
## Part One - Designing the User Interface of the First Page
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
