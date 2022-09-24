import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// import '../Models/WorldStateApi.dart';
import '../services/WorldStateServices.dart';
import 'Detail_Screen.dart';

class trackCountries extends StatefulWidget {
  trackCountries({Key? key}) : super(key: key);

  @override
  State<trackCountries> createState() => _trackCountriesState();
}

TextEditingController search = TextEditingController();

class _trackCountriesState extends State<trackCountries> {
  WorldStateServices worldStateServices = WorldStateServices();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: search,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search country name',
                    filled: true,
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: FutureBuilder(
                  future: worldStateServices.fetchCountryList(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                                baseColor: Colors.white12,
                                highlightColor: Colors.black12,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white,
                                      ),
                                      subtitle: Container(
                                        height: 20,
                                        width: 100,
                                        color: Colors.white,
                                      ),
                                      title: Container(
                                        height: 20,
                                        width: 100,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ));
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['country'];

                            if (search.text.isEmpty) {
                              return Column(
                                children: [
                                  Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (constext) {
                                              return detailScreen(
                                                name: snapshot.data![index]
                                                    ['country'],
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                test: snapshot.data![index]
                                                    ['tests'],
                                                todaysdeath:
                                                    snapshot.data![index]
                                                        ['todayDeaths'],
                                                todaysrec: snapshot.data![index]
                                                    ['todayRecovered'],
                                                totalrecovered: snapshot
                                                    .data![index]['recovered'],
                                                totaldeath: snapshot
                                                    .data![index]['deaths'],
                                                totalcases: snapshot
                                                    .data![index]['todayCases'],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        leading: Image.network(
                                          snapshot.data![index]["countryInfo"]
                                              ['flag'],
                                          height: 50,
                                          width: 50,
                                        ),
                                        subtitle: Text(
                                          snapshot.data![index]["cases"]
                                              .toString(),
                                        ),
                                        title: Text(
                                          snapshot.data![index]["country"],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else if (name
                                .toLowerCase()
                                .contains(search.text.toLowerCase())) {
                              return Column(
                                children: [
                                  Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (constext) {
                                              return detailScreen(
                                                name: snapshot.data![index]
                                                    ['country'],
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                test: snapshot.data![index]
                                                    ['tests'],
                                                todaysdeath:
                                                    snapshot.data![index]
                                                        ['todayDeaths'],
                                                todaysrec: snapshot.data![index]
                                                    ['todayRecovered'],
                                                totalrecovered: snapshot
                                                    .data![index]['recovered'],
                                                totaldeath: snapshot
                                                    .data![index]['deaths'],
                                                totalcases: snapshot
                                                    .data![index]['todayCases'],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        leading: Image.network(
                                          snapshot.data![index]["countryInfo"]
                                              ['flag'],
                                          height: 50,
                                          width: 50,
                                        ),
                                        subtitle: Text(
                                          snapshot.data![index]["cases"]
                                              .toString(),
                                        ),
                                        title: Text(
                                          snapshot.data![index]["country"],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*

return Column(
                              children: [
                                Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: ListTile(
                                    leading: Image.network(
                                      snapshot.data![index]["countryInfo"]
                                          ['flag'],
                                      height: 50,
                                      width: 50,
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]["cases"].toString(),
                                    ),
                                    title: Text(
                                      snapshot.data![index]["country"],
                                    ),
                                  ),
                                )
                              ],
                            );
 */
