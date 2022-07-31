import 'dart:convert';

import 'package:belajar_flutter/Latihan%20Htpp%20covidApp/models/summary.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/summary_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  //
  late Summary dataSummary;

  //
  Future getSummary() async {
    var response = await http.get(Uri.parse('https://covid19.mathdro.id/api'));

    Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;

    dataSummary = Summary.fromJson(data);

    print(dataSummary.confirmed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid 19'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getSummary(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                'LOADING DATA ...',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          } else {
            return Column(
              children: [
                SummaryItem(
                  title: 'Confirmed',
                  value: dataSummary.confirmed.value.toString(),
                ),
                SummaryItem(
                  title: "Deaths",
                  value: dataSummary.deaths.value.toString(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
