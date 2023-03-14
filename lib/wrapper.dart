import 'package:flutter/material.dart';
import 'package:hps_application/pages/loginNurse_page.dart';
import 'package:hps_application/pages/patientList.dart';
import 'package:hps_application/services/authServices.dart';
import 'package:provider/provider.dart';
import './models/userModel.dart';

class Wrapper extends StatefulWidget {
   static const routeName = '/';
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active){
          final User? user = snapshot.data;
          return user == null ? LoginNursePage() : PatientListPage();
        }
        else{
          return Scaffold(
            body: Center(child:  CircularProgressIndicator(),)
          );
        }
      },
    );
  }
}