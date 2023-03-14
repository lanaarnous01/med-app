import 'package:flutter/material.dart';
import 'package:hps_application/providers/history.dart';
import 'package:hps_application/services/authServices.dart';
import 'package:hps_application/widgets/updateSheet.dart';
import 'package:hps_application/wrapper.dart';
import 'models/listModel.dart';
import 'pages/login_page.dart';
import 'pages/addPatient_page.dart';
import 'pages/register_page.dart';
import 'pages/option_page.dart';
import 'pages/loginNurse_page.dart';
import 'pages/patientInfo.dart';
import 'pages/patientList.dart';
import 'package:provider/provider.dart';
import './providers/patients_providers.dart';
import './widgets/patientInfo_widget.dart';
import './pages/updateMeasurements.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// void main() async {
//   runApp(const MyApp());
 
  
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
  runApp(const MyApp());
  }
List<Patient> patients =[
  Patient(name: 'name1', wardNo: 'wardNo', id: '1', numberHeart: '3', numberPressure: '5', numberFever: '36', ) , //numberHeart: '3', numberPressure: '5', numberFever: '36'
  Patient(name: 'name2', wardNo: 'wardNo2', id: '2', numberHeart: '4', numberPressure: '5', numberFever: '36', ),
  Patient(name: 'name3', wardNo: 'wardNo3', id: '3', numberHeart: '5', numberPressure: '5', numberFever: '36', ),
  Patient(name: 'name4', wardNo: 'wardNo4', id: '4', numberHeart: '6', numberPressure: '5', numberFever: '36', ),
  Patient(name: 'name5', wardNo: 'wardNo5', id: '5', numberHeart: '7', numberPressure: '5', numberFever: '36', ),
  Patient(name: 'name6', wardNo: 'wardNo6', id: '6', numberHeart: '8', numberPressure: '5', numberFever: '36', ),
];
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //change notifier provider
    //create: (context) => Patients(),

    //multi provider added 
    return MultiProvider(
      providers: [
        // each class in provider must be added
        ChangeNotifierProvider(
          create: (context) => Patients(),
        ),
        ChangeNotifierProvider(
          create: (context) => History(),
        ),
        ChangeNotifierProvider(
          create: (context) => Categories()),
        Provider<AuthService>(create: ((context) => AuthService()))  
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         //home:
         
          //PatientListPage(),
        initialRoute: '/',
         routes: {
       //   '/':(context) => Wrapper(),
          Wrapper.routeName:(context) => Wrapper(),
        addPatient_page.routeName:(context) => addPatient_page(),
        PatientInfoWidget.routeName:(context) => PatientInfoWidget(),
       UpdateMeasurements.routeName:((context) => UpdateMeasurements()),
         
         },
    
    
          
            //LoginNursePage(),
           
           // RegisterPage(),
        
        //  LoginPage(),
      ),
    );
  }
}
