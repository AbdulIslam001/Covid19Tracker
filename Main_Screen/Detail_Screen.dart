import 'package:application/Main_Screen/MainApp.dart';
import 'package:flutter/material.dart';

class detailScreen extends StatefulWidget {
  String name, image;
  int totalcases,
      totaldeath,
      totalrecovered,
      active,
      critical,
      test,
      todaysdeath,
      todaysrec;

  detailScreen(
      {required this.name,
      required this.image,
      required this.critical,
      required this.active,
      required this.test,
      required this.todaysdeath,
      required this.todaysrec,
      required this.totalrecovered,
      required this.totalcases,
      required this.totaldeath});

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(widget.name,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Card(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(widget.image),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 2),
                    Reuseable(
                        title: 'Total Cases',
                        value: widget.totalcases.toString()),
                    Reuseable(
                        title: 'Total Death',
                        value: widget.totaldeath.toString()),
                    Reuseable(
                        title: 'Total Recovered',
                        value: widget.totalrecovered.toString()),
                    Reuseable(
                        title: 'Active cases', value: widget.active.toString()),
                    Reuseable(
                        title: 'Todays Recovered',
                        value: widget.todaysrec.toString()),
                    Reuseable(
                        title: 'Critical', value: widget.critical.toString()),
                    Reuseable(
                        title: 'Total Tests', value: widget.test.toString()),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
