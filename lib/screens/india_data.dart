import 'package:covid19/components/reusable_card.dart';
import 'package:covid19/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid19/brain/dist_search.dart';

class IndiaDist extends StatefulWidget {
  @override
  _IndiaDistState createState() => _IndiaDistState();
}

class _IndiaDistState extends State<IndiaDist> {
  List distData;
  fetchDistForSearch() async {
    Response response =
        await get('https://api.covid19india.org/v2/state_district_wise.json');
    setState(() {
      distData = json.decode(response.body);
      print(distData);
    });
  }

  @override
  void initState() {
    fetchDistForSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'DISTRICT\'s',
            style: TextStyle(fontSize: 50, fontFamily: 'Teko'),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search),onPressed: (){
              showSearch(context: context, delegate: DistSearch(searchData: distData));
            },)
          ],
        ),
        body: distData == null
            ? SpinKitWave(color: Colors.teal,)
            : ListView.builder(
                itemCount: distData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReusableCard(
                    color: Colors.grey[850],
                    edge: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          distData[index]['state'].toString(),
                          style: kTextStyle,
                        ),
                        ReusableCard(
                          color: Colors.cyan,
                          edge:
                          EdgeInsets.only(left: 8, top: 5, right: 8, bottom: 5),
                          cardChild: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Disctrict",style: kTextStyle.copyWith(color: Colors.black,fontSize: 40)),
                                    Text("Total Cases",style: kTextStyle.copyWith(color: Colors.black,fontSize: 40)),
                                  ],
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: distData[index]['districtData'].length,
                                    itemBuilder: (BuildContext context, int index1){
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(distData[index]['districtData'][index1]['district'].toString(),style: kNumberStyle.copyWith(color: Colors.black54),),
                                          Text(distData[index]['districtData'][index1]['confirmed'].toString(),style: kNumberStyle.copyWith(color: Colors.black54),),
                                        ],
                                      );
                                    })
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }));
  }
}
