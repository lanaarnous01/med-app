import 'package:flutter/material.dart';
import 'package:hps_application/models/userModel.dart';
import 'package:provider/provider.dart';
import '../services/authServices.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
             
              
            ],
          ),
        )
      
      ),
    );
  }
}