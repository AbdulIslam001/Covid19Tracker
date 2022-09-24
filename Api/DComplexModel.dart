import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DComplexModel extends StatelessWidget {
  DComplexModel({Key? key}) : super(key: key);
  var data;
  Future<void> getUserAPi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: getUserAPi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          } else {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ReUseRow(
                          title: 'name',
                          value: data[index]['name'].toString(),
                        ),
                        ReUseRow(
                          title: 'Username',
                          value: data[index]['username'].toString(),
                        ),
                        ReUseRow(
                          title: 'address',
                          value: data[index]['address']['street'].toString(),
                        ),
                        ReUseRow(
                          title: 'Lat',
                          value:
                              data[index]['address']['geo']['lat'].toString(),
                        ),
                        ReUseRow(
                          title: 'Lat',
                          value:
                              data[index]['address']['geo']['lng'].toString(),
                        ),
                      ],
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}

class ReUseRow extends StatelessWidget {
  String title, value;
  ReUseRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
