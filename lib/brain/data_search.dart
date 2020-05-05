import 'package:flutter/material.dart';
import 'package:covid19/components/reusable_card.dart';
import 'package:covid19/constants.dart';


class DataSearch extends SearchDelegate<String>{
  final List searchData;
  DataSearch({this.searchData});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear,color: Colors.white,),onPressed: (){
        query = '';
      },color: Colors.black,)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,
      onPressed: (){
      close(context, null);
      }
      ,);
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionCountry = query.isEmpty
        ? searchData
        : searchData.where((i) => i['country'].toString().toLowerCase().startsWith(query))
        .toList();
      return ListView.builder(
        itemCount: suggestionCountry.length,
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
                            suggestionCountry[index]['country'],
                            style: kNumberStyle,
                          )),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        child: Image(
                          image:
                          NetworkImage(
                              suggestionCountry[index]['countryInfo']['flag']),
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
                                    suggestionCountry[index]['cases']
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
                                    suggestionCountry[index]['active']
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
                                    suggestionCountry[index]['recovered']
                                        .toString(),
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
                                    suggestionCountry[index]['deaths']
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
}