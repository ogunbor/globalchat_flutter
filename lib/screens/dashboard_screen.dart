import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:globalchat/screens/profile_screen.dart';
import 'package:globalchat/screens/splash_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Chat'),
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50),
              ListTile(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return SplashScreen();
                  }), (route) {
                    return false;
                  });
                },
                leading: Icon(Icons.logout),
                title: Text("logout"),
              ),
              ListTile(
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }));
                },
                leading: Icon(Icons.people),
                title: Text("profile"),
              )
            ],
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome'),
            Text((user?.email ?? "").toString()),
          ],
        ),
      ),
    );
  }
}
