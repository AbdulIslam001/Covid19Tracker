import 'package:application/Models/WorldStateApi.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../services/WorldStateServices.dart';
import 'Covid.dart';
import 'TrackCountries.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  WorldStateServices worldStateServices = WorldStateServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white38,
        body: FutureBuilder(
          future: worldStateServices.fetchWorldData(),
          builder: (context, AsyncSnapshot<WorldStateApi> snapshot) {
            if (!snapshot.hasData) {
              return corona();

              //  const Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    PieChart(
                      legendOptions: const LegendOptions(
                          legendPosition: LegendPosition.left),
                      dataMap: {
                        'Total :':
                            double.parse(snapshot.data!.cases!.toString()),
                        'Recovered :':
                            double.parse(snapshot.data!.recovered!.toString()),
                        'Death :':
                            double.parse(snapshot.data!.deaths!.toString()),
                      },
                      chartRadius: MediaQuery.of(context).size.width / 3,
                      chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true),
                      animationDuration: Duration(milliseconds: 1000),
                      chartType: ChartType.ring,
                      colorList: [Colors.blue, Colors.green, Colors.red],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Card(
                      color: Colors.white60,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 15, left: 5, right: 5),
                        child: Column(
                          children: [
                            Reuseable(
                              title: 'Total',
                              value: snapshot.data!.cases.toString(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Reuseable(
                              title: 'Recovered',
                              value: snapshot.data!.recovered.toString(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Reuseable(
                              title: 'Death',
                              value: snapshot.data!.deaths.toString(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Reuseable(
                              title: 'Critical',
                              value: snapshot.data!.critical.toString(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Reuseable(
                              title: 'Todays cases',
                              value: snapshot.data!.todayCases.toString(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Reuseable(
                              title: 'Todays Recovered',
                              value: snapshot.data!.todayRecovered.toString(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Reuseable(
                              title: 'Todays Death',
                              value: snapshot.data!.todayDeaths.toString(),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        height: 50,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return trackCountries();
                              }));
                            },
                            child: const Text("Track Countries",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class Reuseable extends StatelessWidget {
  String title, value;
  Reuseable({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          )
        ],
      ),
    );
  }
}

/*

FutureBuilder(
                future: worldStateServices.fetchWorldData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Error Loading');
                  } else {
                   return Column(
                      children: [
                    PieChart(
                    dataMap: const {
                    'Total :': 100,
                    'Recovered :': 80,
                    'Death :': 20,
                    },
                      chartRadius: MediaQuery.of(context).size.width / 3,
                      animationDuration: Duration(milliseconds: 1000),
                      chartType: ChartType.ring,
                      colorList: [
                        Colors.black,
                        Colors.black26,
                        Colors.black54
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Card(
                      color: Colors.white54,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Reuseable(
                              title: 'Total',
                              value: '100',
                            ),
                            Reuseable(
                              title: 'Recovered',
                              value: '80',
                            ),
                            Reuseable(
                              title: 'Death',
                              value: '20',
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        height: 50,
                        child: const Center(
                          child: Text("Track Countries",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                      ],
                    );
                  }
                },
              ),
 */

/*

      GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
//          backgroundColor: Colors.white54,
          appBar: AppBar(
            title: const Text(
              'Home',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: const Icon(
              Icons.account_tree_outlined,
              color: Colors.black54,
            ),
            actions: const [Icon(IconlyBold.user3, color: Colors.black)],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Search Here!',
                      labelText: 'Search',
                      filled: true,
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
//                const Card_Swiper(),
              // const UploadImage(),
            ],
          ),
        ),
      ),
    );

 */
