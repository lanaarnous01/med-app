import 'package:flutter/material.dart';
import 'package:hps_application/pages/register_page.dart';
import 'package:hps_application/services/authServices.dart';
import 'package:provider/provider.dart';

class LoginNursePage extends StatefulWidget {
  const LoginNursePage({Key? key}) : super(key: key);

  State<LoginNursePage> createState() => _LoginNursePageState();
}

class _LoginNursePageState extends State<LoginNursePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget buildEmail() => TextField(
        controller: emailController,
        decoration: InputDecoration(
            labelText: 'Email',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );
  Widget buildPassword() => TextField(
        controller: passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
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
    // final TextEditingController emailController = TextEditingController();
    // final TextEditingController passwordController = TextEditingController();
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
                  end: Alignment.bottomCenter, 
                   colors: [Colors.indigo, Colors.blueAccent],
                   //bottomright
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
                      'Login Nurse',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200]),
            alignment: Alignment.center,
            child: buildEmail(),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200]),
            alignment: Alignment.center,
            child: buildPassword(),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {
            authService.signInEmailAndPass(
              emailController.text, passwordController.text);
          }, child: Text('Login in',
          style: TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
          ),
          ),
          SizedBox(height: 20,),
          Text('Not a member, Register!'),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (() {
           // Navigator.pushNamed(context, '/register_page');
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()),
            );
          }), child: Text('Register',  style: TextStyle(fontSize: 18),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
          ),
          )
        ]),
      ),
    );
  }
}
