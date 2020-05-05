import 'package:covid19/brain/api_networking.dart';
import 'package:covid19/components/reusable_card.dart';
import 'package:covid19/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19/brain/data_search.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldData extends StatefulWidget {
  @override
  _WorldDataState createState() => _WorldDataState();
}

class _WorldDataState extends State<WorldData> {

  List countryData;
  fetchCountryForSearch() async{
    Response response= await get('https://disease.sh/v2/countries?yesterday=false&sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryForSearch();
    super.initState();
  }

  Future<List<Country>> initCountryData() async {
    ApiNetworking apiNetworking = ApiNetworking(
        url: 'https://disease.sh/v2/countries?yesterday=false&sort=cases');
    return await apiNetworking.mostAffected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'WORLD',
          style: TextStyle(fontSize: 50, fontFamily: 'Teko'),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){
            showSearch(context: context, delegate: DataSearch(searchData: countryData));
          },)
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: initCountryData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return SpinKitWave(
                color: Colors.teal,
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReusableCard(
                    height: 150,
                    edge: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    color: Colors.grey[850],
                    cardChild: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                  child: Text(
                                snapshot.data[index].name,
                                style: kNumberStyle,
                              )),
                              Container(
                                margin: EdgeInsets.all(10),
                                height: 50,
                                width: 50,
                                child: Image(
                                  image:
                                      NetworkImage(snapshot.data[index].flag),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 16,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  ReusableCard(
                                    color: Colors.red[300],
                                    height: 60,
                                    width: 100,
                                    cardChild: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          'CONFIRMED',
                                          style: TextStyle(
                                              fontFamily: 'Teko', fontSize: 20),
                                        ),
                                        Text(
                                            snapshot.data[index].cases
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: 'RobotoCondensed',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ),
                                  ReusableCard(
                                    color: Colors.blue[300],
                                    height: 60,
                                    width: 100,
                                    cardChild: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          'ACTIVE',
                                          style: TextStyle(
                                              fontFamily: 'Teko', fontSize: 20),
                                        ),
                                        Text(
                                            snapshot.data[index].active
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: 'RobotoCondensed',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  ReusableCard(
                                    color: Colors.green[300],
                                    height: 60,
                                    width: 100,
                                    cardChild: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          'RECOVERED',
                                          style: TextStyle(
                                              fontFamily: 'Teko', fontSize: 20),
                                        ),
                                        Text(
                                            snapshot.data[index].recovered.toString(),
                                            style: TextStyle(
                                                fontFamily: 'RobotoCondensed',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ),
                                  ReusableCard(
                                    color: Colors.red[300],
                                    height: 60,
                                    width: 100,
                                    cardChild: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          'DEATHS',
                                          style: TextStyle(
                                              fontFamily: 'Teko', fontSize: 20),
                                        ),
                                        Text(
                                            snapshot.data[index].death
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: 'RobotoCondensed',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

