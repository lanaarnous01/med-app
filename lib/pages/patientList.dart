import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hps_application/main.dart';
import 'package:hps_application/pages/addPatient_page.dart';
import 'package:hps_application/pages/option_page.dart';
import 'package:hps_application/services/authServices.dart';
// import '../models/listModel.dart';
import '../widgets/patientList_widget.dart';
import 'package:provider/provider.dart';
import '../providers/patients_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class PatientListPage extends StatefulWidget {
  const PatientListPage({Key? key}) : super(key: key);

  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
//   final List <Patient> patients = [


  Widget build(BuildContext context) {
    //gets junk data from patient list provider
    final patientsData = Provider.of<Patients>(context);
    final patients = patientsData.getPatients();
    final db = FirebaseFirestore.instance;
    final patientName = ModalRoute.of(context)!.settings.arguments as dynamic;
    final authService = Provider.of<AuthService>(context);


    return Scaffold(
     
      drawer: Drawer(
        child: Column(
          children: <Widget>[
        UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.person, size: 50.0,),
        ),
        accountName: Text('Lana'),
        accountEmail:Text( FirebaseAuth.instance.currentUser == null ? "" :FirebaseAuth.instance.currentUser!.email.toString()),
      ),
            FirebaseAuth.instance.currentUser == null ? ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.login,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                title: Text("Sign in"),
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Option_page()));

                }
            )
            :ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.logout,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          title: Text("Log out"),
          onTap: () async {
            await FirebaseAuth.instance.signOut();

          }
        )
      ],
      ),
        ),
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,

        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.checklist_sharp, size: 30,),
              SizedBox(width: 10,),
              Text('Patient List', 
              style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold,
             // color: Colors.deepOrangeAccent// Colors.redAccent
     ),
              ),
            ],
          ),
        ),
    
       // centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.blueAccent],//[Colors.orange, Colors.deepOrangeAccent],//[Colors.redAccent, Colors.pink],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
              ),
          ),
        ),
        actions: [
          IconButton(onPressed: (() async{
            await authService.signOut();
          }), icon: Icon(Icons.person))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: ()  {

          Navigator.push(context, MaterialPageRoute(builder: (context) => addPatient_page()));
        },
      child: Icon(Icons.add,),
      ),

       body:
       FutureBuilder(
        future: FirebaseFirestore.instance.collection("patient").get(),
    builder: (context,
    AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.data == null) {
    return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    child: Center(
    child: CircularProgressIndicator(),
    ),
    );
    } else if (snapshot.data!.docs.length == 0) {
    return new SingleChildScrollView(
    child: Center(),
    );
    } else {


    return ListView.builder(
    itemCount: snapshot.data!.docs.length,
    itemBuilder: ((ctx, i) {
    // provider added
      String name = snapshot.data!.docs[i].get("name");
      String wardNo = snapshot.data!.docs[i].get("wardNo");
      String id = snapshot.data!.docs[i].id;

    return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

    decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(20), //13


    // gradient: LinearGradient(
    //       colors: [new Color(0xffF5591F), new Color(0xffF2861E)],  //[Colors.redAccent, Colors.pink],
    //       begin: Alignment.bottomCenter,
    //       end: Alignment.topCenter
    //       ),

    ),
    child: PatientList(
    name, wardNo, id,

    )
    );
    }
    ),
    );
    }}),


    );
  }
}
