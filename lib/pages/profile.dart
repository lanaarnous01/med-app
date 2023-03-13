import 'package:flutter/material.dart';

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
        padding:  EdgeInsets.all(15),
        child: Column(
          children: [
            Text('data'),
            Text('data'),
            SizedBox(height: 20,),
            
          ],
        ),
      
      ),
    );
  }
}