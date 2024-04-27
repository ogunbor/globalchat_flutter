import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:globalchat/providers/userProvider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData = {};

  @override
  Widget build(BuildContext context) {
    //This is needed where the data from provider is required
    var userProvider = Provider.of<UserProvider>(context);
/////////////////////////////////////////////
    ///

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Text(userProvider.userName),
          Text(userProvider.userEmail),
          Text(userProvider.userId)
        ],
      ),
    );
  }
}
