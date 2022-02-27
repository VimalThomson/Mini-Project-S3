
import 'package:HOMECARE/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:HOMECARE/common/theme_helper.dart';
import 'package:HOMECARE/pages/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class RegistrationPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  TextEditingController fname = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController place = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();


  Future register() async {


    var response = await http.post(
        Uri.parse("http://192.168.245.30/HOMECARE/pages/register.php"), body:  {
      "fname": fname.text,
      "phone": phone.text,
      "email": email.text,
      "password": password.text,
      "place": place.text,

    });

    //var data = json.decode(response.body);
    if (response.body == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Registration Successful"),
      ));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }


  else {

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  content: Text("User already exist"),
  ));
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    autovalidate: true,
                    key: _formKey,
                    child: Column(
                      children: [

                        SizedBox(height: 110,),
                        Container(
                          child: TextFormField(
                            controller: fname,
                            decoration: ThemeHelper().textInputDecoration('Name', 'Enter your name'),
                            keyboardType: TextInputType.text,
                            validator: (val){
                              if(!(val!.isEmpty) && !RegExp(r"(^[a-zA-Z][a-zA-Z\s]{0,20}[a-zA-Z]$)").hasMatch(val)){
                                return "Enter a valid Name";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30,),

                        Container(
                          child: TextFormField(
                            controller: email,
                            decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val)){
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: place,
                            decoration: ThemeHelper().textInputDecoration('Address', 'Enter your Address'),
                            keyboardType: TextInputType.text,validator: (val){
                            if(!(val!.isEmpty) && !RegExp(r"(^[a-zA-Z][a-zA-Z\s]{0,20}[a-zA-Z]$)").hasMatch(val)){
                              return "Enter a valid Address";
                            }
                            return null;
                          },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: phone,
                            decoration: ThemeHelper().textInputDecoration(
                                "Mobile Number",
                                "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^[0-9]{10}$").hasMatch(val)){
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password*", "Enter your password"),
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$").hasMatch(val)){
                                return "Please enter a stronger password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          child: TextFormField(
                            controller: confirmpassword,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Confirm password*", "Re-enter your password"),
                            validator: (val){
                              if(val!.isEmpty)
                              {
                                return 'Please re-enter password';
                              }
                              print(password.text);
                              print(confirmpassword.text);
                              if(password.text!=confirmpassword.text){
                                return "Password does not match";
                              }

                              return null;
                            },


                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                            height: 50,
                            width: 320,


                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,

                            ),
                            child: GestureDetector(
                              onTap: () {

                                register();

                              },
                              child: Center(
                                child: Text("Sign Up", style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          //decoration: ThemeHelper().buttonBoxDecoration(context),
                          // child: ElevatedButton(
                          //   style: ThemeHelper().buttonStyle(),
                          //   child: Padding(
                          //     padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          //     child: Text(
                          //       "Register".toUpperCase(),
                          //       style: TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //   ),
                          //   onPressed: () {
                          //    // if (_formKey.currentState!.validate()) {
                          //       register();
                          //       //Navigator.of(context).pushAndRemoveUntil(
                          //           //MaterialPageRoute(
                          //              // builder: (context) => ProfilePage()
                          //          // ),
                          //              // (Route<dynamic> route) => false
                          //      // );
                          //     }
                          //
                          //  // },
                          // ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          margin: EdgeInsets.fromLTRB(10,20,10,20),
                          //child: Text('Don\'t have an account? Create'),
                          child: Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(text: "Already have an account? "),
                                    TextSpan(
                                      text: 'Login',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                    ),
                                  ]
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}