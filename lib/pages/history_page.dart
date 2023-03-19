import 'package:flutter/material.dart';
//import 'package:hps_application/widgets/historyActivity_widget.dart';
import 'package:provider/provider.dart';
//import '../providers/history.dart';
import '../providers/nurse_providers.dart' show History;
import '../widgets/historyActivity_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final historyData = Provider.of<History>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Activity')),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {},
      child: Icon(Icons.add,),
      ),
      // body: ListView.builder(
      //  // itemCount: historyData.activity.length,
      //   itemBuilder: ((ctx, i) => 
      // // HistoryActivity(historyData.activity[i])
      // )),
    );
  }
}