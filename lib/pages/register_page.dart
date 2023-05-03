import 'package:flutter/material.dart';
import 'package:hps_application/services/authServices.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

// Email widget
  Widget buildEmail() => TextField(
        controller: emailController,
        cursorColor: Color(0xffF5591F),
        decoration: InputDecoration(
            labelText: 'Email',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );

// Full name widget
  Widget buildName() => TextField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: 'Name',
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );
      
      //Password widget
  Widget buildPassword() => TextField(
        controller: passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        textInputAction: TextInputAction.done,
      );

  Widget Containerr(widget) => Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: EdgeInsets.only(left: 20, right: 20),
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Color(0xffEEEEEE)),
          ],
        ),
        child: widget,
      );

  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: new Color(0xffF5591F),
                gradient: LinearGradient(
                  begin: Alignment.topCenter, //center
                  end: Alignment.bottomCenter, //bottomright
                 colors: [Colors.indigo, Colors.blueAccent],
                //  colors: [new Color(0xffF5591F), new Color(0xffF2861E)],
                )),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.bottomRight,
                    height: 150,
                    width: 250,
                    child: Text(
                      'Welcome to HPS',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                      top: 10,
                    ),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Calling all widgets
          Containerr(buildName()),
           Containerr(buildEmail()),
          Containerr(buildPassword()),

          ElevatedButton(onPressed: (() async {
           await authService.createUserWithEmailAndPass(
              emailController.text, passwordController.text, nameController.text );
              Navigator.pop(context);
          }), child: Text('Register'))

        ]),
      ),
    );
  }
}
