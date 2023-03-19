// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../providers/nurse_providers.dart' as hist;

class HistoryActivity extends StatelessWidget {
  // final hist.HistoryActivity history;
  // HistoryActivity(this.history);
 // const HsitroyActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10), 
      child: Column(
        children: [
          ListTile(title: Text('\$'), //${history.activity}
          
          )
        ],
      ),
    );
     
  }
}