import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/patients_providers.dart';
import '../models/listModel.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
  //  final patientName = ModalRoute.of(context)!.settings.arguments as dynamic;
  //   int pateintData = Provider.of<Patients>(context).getPatients().indexOf(Provider.of<Patients>(context).getPatients().firstWhere((prod) => prod.id == patientName));
  //   final patientsData = Provider.of<Patients>(context);
  //   final patients = patientsData.getPatients();
    return SizedBox(
      height: 500,
      child: Column(
        children: [


        ],
      ),
    );
  }
}