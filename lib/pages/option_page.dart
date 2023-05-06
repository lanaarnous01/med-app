import 'package:flutter/material.dart';
import 'package:hps_application/pages/loginNurse_page.dart';
import 'package:hps_application/pages/login_page.dart';
import 'package:hps_application/wrapper.dart';

//addPatient_page
class Option_page extends StatefulWidget {
  static const routeName = '/';
  const Option_page({Key? key}) : super(key: key);

  State<Option_page> createState() => _OptionPageState();
}

class _OptionPageState extends State<Option_page> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter, 
               colors: [Colors.indigo, Colors.blueAccent],
            )
        ),
        // To diplay writing on top of 2 buttons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to HPS',
            style: TextStyle(fontSize: 31,
            color: Colors.white,
            fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 13),
                //Gesture Detector makes the container tappable to take us to the next page for nurse 
                GestureDetector(
                  onTap: () {
                     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Wrapper()),
            );
                  },
                  child: Container(
                    width: 170,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                    child: Column(
                      children: [
                        SizedBox(height: 25,),
                        Icon(Icons.medical_information, size: 100, color: Colors.indigo,),
                         Text('Nurse', 
                         style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                          ),)
                        
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 30),

                //Gesture Detector makes the container tappable to take us to the next page which for family member 
                //Takes them to login page 
                 GestureDetector(
                  onTap: () {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
                  },
                   child: Container(
                    width: 170,
                    height: 200,
                    decoration: BoxDecoration(color: Colors.white,
                     borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Icon(Icons.person, size: 100, color: Colors.indigo,),
                        Text('Family Member', 
                        style: 
                        TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                          ),)
                      ],
                    ),
                                 ),
                 ),
              ],
            ),
          ],
        ),
        )
       );
  }
}
