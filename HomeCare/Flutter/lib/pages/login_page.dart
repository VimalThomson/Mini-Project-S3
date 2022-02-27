import 'package:HOMECARE/pages/userhome.dart';
import 'package:HOMECARE/pages/workerhome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:HOMECARE/common/theme_helper.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'registration_page.dart';
import 'widgets/header_widget.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future login() async {
    //     var response = await http.post(Uri.parse("http://192.168.245.30/homecare_01/lib/register.php"), body: {
    //     "email": email.text,
    //     "password":password.text,
    //     });
    //
    //   if (response.body == "blah") {
    //     //await FlutterSession().set('token', uname.text);
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text("Login Successful"),
    //     ));
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Userhome(),
    //       ),
    //     );
    //   }
    //   else if (response.body == "blah1") {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text("Login Successful"),
    //     ));
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Workerhome(),
    //       ),
    //     );
    //   }
    //   else {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text("Invalid Username Or Password"),
    //     ));
    //   }


    //var body=json.encode(input);
    http.Response response = await http.post(
        Uri.parse("http://192.168.245.30/HOMECARE/lib/pages/login.php"), body: {
      "email": email.text,
      "password": password.text,
    });


    //var datauser = json.decode(response.body);




    if (response.body.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid Username Or Password"),
      ));
     } else
     //{
       if (response.body == 1)  {
        Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Userhome(),
                  ),
                );
      }

     print(response.body);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.home), //let's create a common header widget
            ),
            SafeArea(
              child: Container( 
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                  children: [
                    Text(
                      'HOMECARE',
                      style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'A Complete Household Solution.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 100.0),
                    Form(
                      autovalidate: true,
                      key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                controller: email,
                                decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "Required *"),
                                  EmailValidator(errorText: "Enter a valid Email"),
                                ]),
                              ),

                              decoration: ThemeHelper().inputBoxDecorationShaddow(),

                            ),
                            SizedBox(height: 30.0),
                            Container(
                              child: TextFormField(
                                controller: password,
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                                validator: RequiredValidator(errorText: "Required"),
                              ),
                              
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 15.0),

                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('Sign In'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                onPressed: (){
                                  login();
                                  // Navigator.push(
                                  //           context,
                                  //           MaterialPageRoute(
                                  //             builder: (context) => Userhome(),
                                  //           ),
                                  //         );


                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10,20,10,20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: "Don\'t have an account? "),
                                    TextSpan(
                                      text: 'Create',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                    ),
                                  ]
                                )
                              ),
                            ),


                          ],
                        )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );

  }
}