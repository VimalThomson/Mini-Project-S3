//import 'package:final_year_project/providers/users.dart';
//import 'package:final_year_project/screens/bookings.dart';
//import 'package:final_year_project/screens/task_screen.dart';
import 'package:HOMECARE/pages/login_page.dart';
import 'package:HOMECARE/pages/screens/profile.dart';
import 'package:HOMECARE/pages/userhome.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

//import '../providers/auth.dart';
//import '../screens/profile.dart';
//import '../providers/user.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final authData = Provider.of<Auth>(context);
    //  final user = Provider.of<Users>(context);
    // final String name = user.userName ;
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('HomeCare '),  //(+ name != null ? name : 'Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
             // Navigator.of(context).pushReplacementNamed(BookingsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book_online),
            title: Text('Bookings'),
            onTap: () {
              // Navigator.of(context).pushReplacementNamed(BookingsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.edit),
              title: Text('Profile'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>  (),
                //   ),
                // );
                // Navigator.of(context).pushNamed(EditProfile.routeName );
                //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ProfileCard(authData.userId,authData.token)));
              }
          ),


          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('LogOut'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
              //Provider.of<Auth>(context).logout();
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}