import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hps_application/FirebaseThings/FirebaseVariables.dart';
import 'package:hps_application/models/listModel.dart';
import 'package:hps_application/pages/history_page.dart';
import 'package:hps_application/pages/patientList.dart';
import 'package:hps_application/pages/updateMeasurements.dart';
// import 'package:hps_application/providers/history.dart';
import 'package:hps_application/widgets/patientInfo_widget.dart';
import 'package:hps_application/widgets/patientList_widget.dart';
import 'package:hps_application/widgets/updateMeasure_widget.dart';
import 'package:provider/provider.dart';
import '../providers/patients_providers.dart';
//import '../widgets/patientList_widget.dart';
import '../pages/addPatient_page.dart';
import '../models/listModel.dart';


class patientInfo_page extends StatefulWidget {
 
// final String namee;
// patientInfo_page(thisse);
String id;
patientInfo_page({super.key,  required this.id});

static const routeName = '/patient-info';

  @override
  State<patientInfo_page> createState() => _patientInfo_pageState();
}
List <String> familyCodes = [

];
class _patientInfo_pageState extends State<patientInfo_page> {

//This is an array that contains activities in a form of string
List<String> activity = ['Sleeping', 'Eating', 'Blood tests', 'Walking', 'Watching TV'];
  String? whatActivity;
  Widget build(BuildContext context) {
   
   //This is the update method when changing the activity 
    Future<void> update({required String id})async{
      print('object');
      await showModalBottomSheet(context: context, builder: ((context) {
        return DropdownButtonFormField(
                  items: activity
                      .map((value) => DropdownMenuItem(
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.blue, fontSize: 22),
                            ),
                            value: value,
                          ))
                      .toList(),
                  onChanged: (value) async {
                    print(value);
                    await patientCollection.doc(id).update({
                      "activity": value
                    });
                    whatActivity = value;

                    setState(() {});
                  },
                  
                  value: whatActivity,
                  isExpanded: false,
                  hint: Container(
                    padding: EdgeInsets.only(left: 25, ),
                    child: Text(
                      'What is the patient doing?',
                      style: TextStyle(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
        );
      }));
    }
    
    return Scaffold(
      //app bar for patient info
        appBar: AppBar(
          leading:
            Container(
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PatientListPage(), //if correct credintial
                      ),
                          (route) => false);
                },
              ),
            ),

        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        title: Text('Patient Information',
        style: TextStyle(fontSize: 27,
        fontWeight: FontWeight.bold,
    ),
    ),
    centerTitle: true,
    flexibleSpace: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    gradient: LinearGradient(
    colors: [Colors.indigo, Colors.blueAccent],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter
    ),
    ),
    ),
    ),

    //the edit button for the measurements to appear on the nurse's screen but not family member
    floatingActionButton:   FirebaseAuth.instance.currentUser == null ? Container() :FloatingActionButton(onPressed: (() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateMeasurements(id: widget.id,)));
    }), child: Icon(Icons.edit,), backgroundColor: Colors.amber,)
    ,
    body:
    FutureBuilder(
        future: FirebaseFirestore.instance.collection("patient").where("id", isEqualTo: widget.id).get(),
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
      String name = snapshot.data!.docs[0].get("name");
      String wardNo = snapshot.data!.docs[0].get("wardNo");
      String duringActivity = snapshot.data!.docs[0].get("activity");
      String id = snapshot.data!.docs[0].id.substring(0,4);
      String fullID = snapshot.data!.docs[0].id;

      
      var categories = snapshot.data!.docs[0].get("categories");
      List<dynamic> date = snapshot.data!.docs[0].get("date");

                print(categories[0]);
      
                return  SingleChildScrollView(
    child: SafeArea(
    child: //singlechildscrollview
    Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
   
    Container(
      width: 250, //350,
      height: 200,
    margin: EdgeInsets.all(25),
    padding: EdgeInsets.all(20),
    // width: double.infinity,
    // height: 240,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
   // border: Border.all(color: Colors.indigo, width: 4),
     gradient: LinearGradient(
    colors: [Colors.blueAccent, Colors.indigo],//[Colors.orange, Colors.deepOrangeAccent],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter
    ),

    ),
    
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
    SizedBox(width: 30,),
    Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
       Icon(Icons.person_rounded, color: Colors.white, size: 60,),
    Text( name,       //patientName,
    style: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white
    ),
    ),

    SizedBox(height: 10,),
    Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ward No.', style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.white
          ),),
          SizedBox(width: 5,),
          Text(wardNo,
          style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.white
          ),
          ),
        ],
      ),
    ),
    
    SizedBox(height: 10,),
   RichText(
  text: TextSpan(
    children: [
      
      TextSpan(
        text: "ID. ", style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold)
      ),
     
      TextSpan(
        text: id,
        style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold)
      ),
    ],
  ),
),
    ],
    ),
    ],
    ),

    ),

     Text('Activity',
     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

     Container(
        width: 300, //350,
      height: 40,
    margin: EdgeInsets.all(25),
    padding: EdgeInsets.only(left: 20),
    // width: double.infinity,
    // height: 240,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
   // border: Border.all(color: Colors.indigo, width: 4),
     gradient: LinearGradient(
    colors: [Colors.blueAccent, Colors.indigo],//[Colors.orange, Colors.deepOrangeAccent],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter
    ),

    ),
    child: Row(
      children: [
        //there was !
        Text(duringActivity, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(width: 140,),
      //icon button disappears from family member side
      FirebaseAuth.instance.currentUser == null ? Container() : IconButton(onPressed: (() => update(id: fullID)), icon: Icon( Icons.edit, color: Colors.white,))
      ],
    ),
     ),

     Text('Diagnosis Update', 
     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    SizedBox(
    height: 500,
    child: ListView.builder(

      scrollDirection: Axis.vertical,
    itemCount: categories.length,
    itemBuilder:  ((ctx, i) {
      Map <dynamic, dynamic> index = categories[i];
      DateTime x = DateTime.parse(date[i].toDate().toString());
      print(x);
    return   index.values.elementAt(0)  == 0 && index.values.elementAt(1) == 0&&
      index.values.elementAt(2) == 0? Container() :  Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

    decoration: BoxDecoration(
      gradient: LinearGradient(
    colors: [Colors.blueAccent, Colors.lightBlue],//[Colors.orange, Colors.deepOrangeAccent],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter
    ),

    borderRadius: BorderRadius.circular(20), //13

    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, //start,
        children: [
          // Text("${index.keys.elementAt(0)}: ${index.values.elementAt(0)}" , style: TextStyle(
          //   fontSize: 18
          // ),),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(Icons.calendar_today, size: 22, color: Colors.white,),
                ),
                WidgetSpan(child: SizedBox(width: 10,)),
                TextSpan(
                    text: "Date: ", style: TextStyle(
                    fontSize: 18)
                ),
                TextSpan(
                    text: "$x",
                    style: TextStyle(
                        fontSize: 18)
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
         
          RichText(
  text: TextSpan(
    children: [
       WidgetSpan(
        child: Icon(Icons.water_drop_rounded, size: 18, color: Colors.white,),
      ),
        WidgetSpan(child: SizedBox(width: 10,)),
      TextSpan(
        text: "${index.keys.elementAt(0)}: ", style: TextStyle(
              fontSize: 18)
      ),
     WidgetSpan(child: SizedBox(width: 120,)),
      TextSpan(
        text: index.values.elementAt(0) == 0 ? "" :"${index.values.elementAt(0)}",
        style: TextStyle(
              fontSize: 18)
      ),
    ],
  ),
),
SizedBox(height: 10,),
 RichText(
  text: TextSpan(
    children: [
       WidgetSpan(
        child: Icon(Icons.monitor_heart, size: 22, color: Colors.white,),
      ),
        WidgetSpan(child: SizedBox(width: 10,)),
      TextSpan(
        text: "${index.keys.elementAt(1)}: ", style: TextStyle(
              fontSize: 18)
      ),
     WidgetSpan(child: SizedBox(width: 150,)),
      TextSpan(
          text: index.values.elementAt(1) == 0 ? "" :"${index.values.elementAt(1)}",
        style: TextStyle(
              fontSize: 18)
      ),
    ],
  ),
),
SizedBox(height: 10,),
 RichText(
  text: TextSpan(
    children: [
       WidgetSpan(
        child: Icon(Icons.device_thermostat_rounded, size: 25, color: Colors.white,),
      ),
        WidgetSpan(child: SizedBox(width: 10,)),
      TextSpan(
        text: "${index.keys.elementAt(2)}: ", style: TextStyle(
              fontSize: 18)
      ),
     WidgetSpan(child: SizedBox(width: 200,)),
      TextSpan(
          text: index.values.elementAt(2) == 0 ? "" :"${index.values.elementAt(2)}",
        style: TextStyle(
              fontSize: 18)
      ),
    ],
  ),
  
    
   
),
        ],
      ),
    )
   
    );
    }
    ),
    ),
    ),


    ],
    ),
    ),
    );
    }})
   
    );
    }
  }

 

 //final _form = GlobalKey<FormState>();


