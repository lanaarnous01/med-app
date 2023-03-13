import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hps_application/main.dart';
import 'package:hps_application/pages/addPatient_page.dart';
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

   void add() async{ //documentsnapshot
    await FirebaseFirestore.instance.collection("test").add({
       "name": '',// patientsData.name,
       "wardNo": ''

  });}


    return Scaffold(
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () async {
        await add;
          
          Navigator.push(context, MaterialPageRoute(builder: (context) => addPatient_page()));
        },
      child: Icon(Icons.add,),
      ),

       body: 
       ListView.builder(
        itemCount: patients.length, 
       itemBuilder: ((ctx, i) => 
       // provider added
       Provider(
        create: (context) => patients[i],
         child: Container(
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
            patients[i].name, patients[i].wardNo,  patients[i].id,
          
            )),
       )
       ),
       )

    );
  }
}
