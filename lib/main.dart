import 'package:calculator_in_provider/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator Demo In Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers:[
            ChangeNotifierProvider(
              create: (context) => ClaculatorNotifier(),
            )
          ] ,
          child: MainPage(),
        ));
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _num1Ctrl = TextEditingController();
  TextEditingController _num2Ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Calculator Demo using Orvider'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              width: w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /* Start Form */
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _num1Ctrl,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.ltr,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Enter Number One",
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'You Must Put Number';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            _num1Ctrl.text = val;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _num2Ctrl,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Enter Number Two",
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'You Must Put Number';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            _num2Ctrl.text = val;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: w,
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Consumer<ClaculatorNotifier>(
                                builder: (context, sumNotifier, widget) {
                                  return FloatingActionButton(
                                    child: Icon(Icons.add),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {

                                        sumNotifier.sumNotifier(double.parse(_num1Ctrl.text), double.parse(_num2Ctrl.text));

                                      }
                                    },
                                    mini: true,
                                    elevation: 0.0,
                                    backgroundColor: Color(0xffcccccc),
                                  );
                                },
                              ),
                              Consumer<ClaculatorNotifier>(
                                builder: (context,subNotfier,widget){
                                  return FloatingActionButton(
                                child: Icon(Icons.remove),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    subNotfier.sumNotifier(double.parse(_num1Ctrl.text), double.parse(_num2Ctrl.text));
                                  }
                                },
                                mini: true,
                                elevation: 0.0,
                                backgroundColor: Color(0xffcccccc),
                              );
                                },
                              ),
                              Consumer<ClaculatorNotifier>(
                                builder: (context,multNotifier,widget){
                                  return FloatingActionButton(
                                child: Icon(Icons.close),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    multNotifier.multiNotifier(double.parse(_num1Ctrl.text), double.parse(_num2Ctrl.text));
                                  }
                                },
                                mini: true,
                                elevation: 0.0,
                                backgroundColor: Color(0xffcccccc),
                              );
                                },
                              ),
                              Consumer<ClaculatorNotifier>(
                                builder: (context,divNotfier,widget){
                                  return FloatingActionButton(
                                child: Text(
                                  '/',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  print(_num2Ctrl.text);
                                  if (_formKey.currentState.validate()) {
                                    if (int.parse(_num2Ctrl.text) == 0) {
                                      final snackBar = SnackBar(
                                        content: Text(
                                            'You Must Enter Number Bigger Tahn Zero'),
                                        action: SnackBarAction(
                                          label: 'X',
                                          onPressed: () {
                                            // Some code to undo the change.
                                          },
                                        ),
                                      );

                                      // Find the Scaffold in the widget tree and use
                                      // it to show a SnackBar.
                                      _scaffoldKey.currentState
                                          .showSnackBar(snackBar);
                                    } else {
                                     
                                     divNotfier.divNotifier(double.parse(_num1Ctrl.text), double.parse(_num2Ctrl.text));

                                    }
                                  }
                                },
                                mini: true,
                                elevation: 0.0,
                                backgroundColor: Color(0xffcccccc),
                              );
                                },
                              )
                              ,
                              Consumer<ClaculatorNotifier>(
                                builder: (context,modNotifier,widget){
                                  return FloatingActionButton(
                                child: Text(
                                  '%',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                      modNotifier.modNotifier(double.parse(_num1Ctrl.text), double.parse(_num2Ctrl.text));
                                  }
                                },
                                mini: true,
                                elevation: 0.0,
                                backgroundColor: Color(0xffcccccc),
                              );
                                },
                              )
                              ,
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  /* End Form */

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: w,
                      height: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xffeeeeee),
                          border:
                              Border.all(color: Color(0xffdddddd), width: 0.5),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Selector<ClaculatorNotifier, String>(
                          selector: (context, sumNotifier) =>
                              sumNotifier.getRes,
                          builder: (context, res, widget) {
                            return Text(
                              'result is ${res}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.black45),
                            );
                          }))
                ],
              ),
            ),
          ),
        ));
  }
}
