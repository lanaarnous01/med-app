import 'package:flutter/material.dart';
import 'package:hps_application/FirebaseThings/FirebaseVariables.dart';
import 'package:hps_application/pages/patientInfo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final patientIDController = TextEditingController();

  List <String> IDs = [
    "122",
  ];
  bool isMatch = true;

  final GlobalKey<FormState> _formKeyID = new GlobalKey<FormState>();

  Widget buildEmail() => TextField(
        controller: emailController,
        decoration: InputDecoration(
            labelText: 'Email',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );
  Widget buildPatientID() => TextFormField(
        controller: patientIDController,
      key: _formKeyID,
    autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          labelText: 'Patient ID',
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
    validator: (value)
    {
     return !isMatch ? "WrongID" : null;
    },
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

  void Check({required String id}) async {
    await getIDs();
    setState(() {
      isMatch = true;
    });

    if (!Ids.contains(id))
      {
        setState(() {
          isMatch = false;
        });

      }

    else
      {
        int index = Ids.indexOf(id);


        Navigator.push(context, MaterialPageRoute(builder: (context) => patientInfo_page(id: wholeID[index])));

      }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter, //center
                  end: Alignment.bottomCenter, //bottomright
                  colors: [Colors.indigo, Colors.blueAccent],
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
                      'Login Family',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 20, right: 20, top: 70),
          //   padding: EdgeInsets.only(left: 20, right: 20),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(50),
          //       color: Colors.grey[200]),
          //   alignment: Alignment.center,
          //   child: buildEmail(),
          // ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200]),
            alignment: Alignment.center,
            child: buildPatientID(),
          ),
          ElevatedButton(onPressed: () {
            Check(id: patientIDController.text);
          }, child: Text('Login ',
            style: TextStyle(fontSize: 18),
          ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            ),
          ),
        ]),
      ),
    );
  }
}
