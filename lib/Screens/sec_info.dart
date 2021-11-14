import 'package:floki/User/doc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class secInfo extends StatefulWidget {
  String jobType;
  secInfo({jobType});

  @override
  _secInfoState createState() => _secInfoState(jobType);
}

// ignore: camel_case_types
class _secInfoState extends State<secInfo> {
  String jobType;
  _secInfoState(this.jobType);

  @override
  Widget build(BuildContext context) {
    final usersDocsFromFS = Provider.of<List<Doc>>(context);

    return Scaffold(body: ListView.builder(itemBuilder: (context, index) {
      String Job;
      if (usersDocsFromFS[index].job == jobType) {
        Job = usersDocsFromFS[index].job;
      }
      return Text(Job);
    }));
  }
}
