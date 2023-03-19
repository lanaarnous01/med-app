import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hps_application/models/listModel.dart';
import 'package:hps_application/pages/history_page.dart';
import 'package:hps_application/pages/updateMeasurements.dart';
import 'package:hps_application/providers/history.dart';
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
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
    gradient: LinearGradient(
    colors: [Colors.indigo, Colors.blueAccent],//[Colors.orange, Colors.deepOrangeAccent],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter
    ),
    ),
    ),

    ),
    floatingActionButton:   FloatingActionButton(onPressed: (() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateMeasurements(x: 1,)));
    }), child: Icon(Icons.edit),)
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
      String id = snapshot.data!.docs[0].id;
      Map<dynamic, dynamic> categories = snapshot.data!.docs[0].get("categories");
      print(categories);

                return  SingleChildScrollView(
    child: SafeArea(
    child: //singlechildscrollview
    Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    SizedBox(height: 30,),
    Container(
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    border: Border.all(color: Colors.blue)

    ),
    //  decoration: BoxDecoration(
    // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
    // gradient: LinearGradient(
    // colors: [Colors.indigo, Colors.blueAccent],//[Colors.orange, Colors.deepOrangeAccent],
    // begin: Alignment.bottomCenter,
    // end: Alignment.topCenter
    // ),
    // ),
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
    Icon(Icons.person, color: Colors.indigoAccent,),
    SizedBox(width: 30,),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text( name,       //patientName,
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.indigoAccent
    ),
    ),

    SizedBox(height: 10,),
    Text(wardNo,
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.indigoAccent //white
    ),
    ),
    SizedBox(height: 10,),
    Text(id,
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.indigoAccent //white
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

    //   decoration: BoxDecoration(

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
    SizedBox(
    height: 500,
    child: ListView.builder(
    itemCount: categories.length,//Provider.of<Patients>(context).getPatients()[pateintData].categories.length, //categories
    itemBuilder: ((ctx, i) {
    return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

    decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(20), //13

    ),
    child: Form(child: ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(
            width: 2, color: Colors.indigo
        ),
        borderRadius: BorderRadius.circular(10),

      ),
      title: Text(categories.keys.elementAt(i), style:
      TextStyle(
          color:  Colors.indigoAccent,
          fontWeight: FontWeight.bold, fontSize: 20),),
      trailing: Text(i.toString(), style:

      TextStyle(color: Colors.indigoAccent,  fontWeight: FontWeight.bold, fontSize: 20),),
      subtitle: Text(categories.values.elementAt(i).toString(), style:

      TextStyle(color: Colors.indigoAccent,  fontWeight: FontWeight.bold, fontSize: 15),),
    )),
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


