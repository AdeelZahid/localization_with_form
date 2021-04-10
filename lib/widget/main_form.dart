import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:localization_flutter/localization/localization_const.dart';

class MainForm extends StatefulWidget {
  const MainForm({Key key}) : super(key: key);

  @override
  _MainFormState createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  final format = DateFormat("yyyy-MM-dd");
  DateTime dateTimeVal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    child: Center(
                      child: Text(
                        getTranslated(context, 'personal_information'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 8.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Form(
                            key: _key,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Name is Required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    labelText: "Name ",
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Email is Required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    labelText: "Email",
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                DateTimeField(
                                  validator: (val) {
                                    if (val == null) {
                                      return 'Date of Birth is Required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_today),
                                    labelText: 'Select Date of Birth',
                                  ),
                                  format: format,
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(2020),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2040));
                                  },
                                  onChanged: (value) {
                                    dateTimeVal = value;
                                    print(dateTimeVal);
                                  },
                                ),
                                SizedBox(height: 15.0),
                                MaterialButton(
                                  onPressed: () {
                                    if (_key.currentState.validate()) {
                                      _showSuccessDialog();
                                    }
                                  },
                                  height: 50.0,
                                  shape: StadiumBorder(),
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                    'Submit Information',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("Don't Have a Account?")),
                        Text("Sign Up",
                            style: TextStyle(
                              color: Colors.blue,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'New to App?',
                            style: TextStyle(color: Colors.black87),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text("REGISTER",
                                style: TextStyle(
                                  color: Colors.blue,
                                )),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
