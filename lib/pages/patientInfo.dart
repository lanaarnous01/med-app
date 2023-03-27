import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hps_application/models/listModel.dart';
import 'package:hps_application/pages/history_page.dart';
import 'package:hps_application/pages/updateMeasurements.dart';
// import 'package:hps_application/providers/history.dart';
import 'package:hps_application/widgets/patientInfo_widget.dart';
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
//  final List categories =[
//   {
//     "title":"heart rate",
//     "numberr": '9',
//     "icons": Icon(Icons.monitor_heart)
    
//   },
//   {"title": "Blood pressure",
//   "numberr": "9",
//   "icons": Icon(Icons.access_alarm_sharp)
//   },
//   {"title": "Fever",
//   "numberr": "9",
//   "icons": Icon(Icons.thermostat)
//   },
//   {"title": "data",
//   "numberr": "9",
//   "icons": Icon(Icons.monitor_heart)
//   },
  


//  ];
 // fix to category
//var _editedCategory = Patient(name: '');
  Widget build(BuildContext context) {
    //Changed to stateless, to show names when going next page
    //back to stetfull to save ny updates

    final categoriesData = Provider.of<Categories>(context);
    // final categories = categoriesData.categories;
    //final activity = Provider.of<History>(context, listen: false).addHistory(patients.toList());
    return Scaffold(
        appBar: AppBar(
        // iconTheme: IconThemeData(color: Colors.indigoAccent),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        title: Text('Patient Information',
        style: TextStyle(fontSize: 27,
        fontWeight: FontWeight.bold,
        // color: Colors.indigoAccent// Colors.deepOrangeAccent// Colors.redAccent
    ),
    ),
    //        shape: Border(
    //   bottom: BorderSide(
    //     color: Colors.indigoAccent,//Colors.deepOrangeAccent,
    //     width: 4
    //   )
    // ),
    centerTitle: true,
    flexibleSpace: Container(
    //   width: double.infinity,
    // height: 240,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
    gradient: LinearGradient(
    colors: [Colors.indigo, Colors.blueAccent],//[Colors.orange, Colors.deepOrangeAccent],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter
    ),
    ),
    ),

    ),
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
      String id = snapshot.data!.docs[0].id.substring(0,4);
      //doc.id.substring(0,4)
      var categories = snapshot.data!.docs[0].get("categories");
      print(categories[0]);

                return  SingleChildScrollView(
    child: SafeArea(
    child: //singlechildscrollview
    Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
   
    Container(
      width: 210, //350,
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


    //          ListView.builder(
    //   itemCount: categories.length,
    //  itemBuilder: ((ctx, i) =>
    //  // provider added
    //  Provider(
    //   create: (context) => categories[i],
    //    child: Container(
    //  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

    ///   decoration: BoxDecoration(

    //  borderRadius: BorderRadius.circular(20), //13


    //   // gradient: LinearGradient(
    //   //       colors: [new Color(0xffF5591F), new Color(0xffF2861E)],  //[Colors.redAccent, Colors.pink],
    //   //       begin: Alignment.bottomCenter,
    //   //       end: Alignment.topCenter
    //   //       ),

    //                         ),
    //     child: PatientList(
    //       patients[i].name, patients[i].wardNo,  patients[i].id,

    //       )),
    //  )
    //  ),
    //  )
     Text('Diagnosis Update', 
     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    SizedBox(
    height: 500,
    child: ListView.builder(
    itemCount: categories.length,//Provider.of<Patients>(context).getPatients()[pateintData].categories.length, //categories
    itemBuilder: ((ctx, i) {
      Map <dynamic, dynamic> index = categories[i];
    return Container(
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
        child: Icon(Icons.water_drop_rounded, size: 18, color: Colors.white,),
      ),
        WidgetSpan(child: SizedBox(width: 10,)),
      TextSpan(
        text: "${index.keys.elementAt(0)}: ", style: TextStyle(
              fontSize: 18)
      ),
     WidgetSpan(child: SizedBox(width: 120,)),
      TextSpan(
        text: "${index.values.elementAt(0)}",
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
        text: "${index.values.elementAt(1)}",
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
        text: "${index.values.elementAt(2)}",
        style: TextStyle(
              fontSize: 18)
      ),
    ],
  ),
),
          // Text("${index.keys.elementAt(1)}: ${index.values.elementAt(1)}" , style: TextStyle(
          //     fontSize: 18)),
          // Text("${index.keys.elementAt(2)}: ${index.values.elementAt(2)}" , style: TextStyle(
          //     fontSize: 18)
          // )
        ],
      ),
    )
    // child: UpdateMeasureWidget(
    // categories.keys.elementAt(i), categories.values.elementAt(i),i.toString(), //categories[i].icons categories[i].title
    //
    // ),
    );
    }
    ),
    ),
    ),



    //  PatientInfoWidget(),


    //  UpdateCategory(),

    //           SizedBox(
    //             height: 300,
    //             child:
    //             ListView.builder(itemCount: categories.length,
    //             itemBuilder: (_, index) =>
    //             Container(

    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(15),
    //                 color: Colors.indigoAccent
    //             //   gradient: LinearGradient(
    //             // colors: [Colors.indigo, Colors.blueAccent],// [new Color(0xffF5591F), new Color(0xffF2861E)],  //[Colors.redAccent, Colors.pink],
    //             // begin: Alignment.bottomCenter,
    //             // end: Alignment.topCenter
    //             // ),
    //             ),
    //                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),

    //               child: ListTile(
    // //                   shape: RoundedRectangleBorder(
    // //         side: BorderSide(width: 2, color: Colors.indigoAccent), //redAccent
    // //         borderRadius: BorderRadius.circular(20), //10
    // // ),
    //                 iconColor: Colors.white,// Colors.indigoAccent,
    //                 leading:  categories[index].icons,
    //                 title: Text(categories[index].title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
    //                 trailing: Text('${loadedPatient.numberHeart}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),

    //                 //categories[index].numberr
    //                 ),
    //             )
    //             ),
    //           ),
    //             InkWell(
    //               onTap:() {
    //                 //navigation push
    //                 Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const HistoryPage()),
    // );
    //                 // Provider.of<History>(context, listen: false).addHistory(

    //                 // );
    //               },
    //               child: Center(
    //                 child: Container(

    //                   width: 150, //150
    //                   decoration: BoxDecoration(

    //                     borderRadius: BorderRadius.circular(22),
    //                     color: Colors.white,
    //                   ),
    //                   child: Row(
    //                     children: [
    //                       Container(
    //                         padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    //                         height: 50,
    //                         width: 110,
    //                          child: Text('Activity',
    //                          style: TextStyle(
    //                           fontSize: 17,
    //                           fontWeight: FontWeight.bold,
    //                           color: Colors.white
    //                          ),


    //                         ),
    //                         decoration: BoxDecoration(
    //                           color: Colors.blueAccent,
    //                         borderRadius: BorderRadius.only(
    //                           bottomLeft: Radius.circular(95), //95
    //                         topLeft: Radius.circular(95),
    //                         bottomRight: Radius.circular(240) //240
    //                         )
    //                         ),
    //                       ),

    //                       Icon(Icons.arrow_circle_right_outlined, size: 30, color: Colors.blue, )
    //                     ],
    //                   ),

    //                 ),
    //               ),
    //             ),

    ],
    ),
    ),
    );
    }})
   


    );
    }
  }

 

 //final _form = GlobalKey<FormState>();


