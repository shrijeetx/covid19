import 'package:flutter/material.dart';
import 'package:covid19/components/reusable_card.dart';
import 'package:covid19/constants.dart';

class DistSearch extends SearchDelegate<String>{
  final List searchData;
  DistSearch({this.searchData});
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
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionDist = query.isEmpty
        ? searchData
        : searchData.where((i) => i['state'].toString().toLowerCase().startsWith(query))
        .toList();
    return ListView.builder(
        itemCount: suggestionDist.length,
        itemBuilder: (BuildContext context, int index) {
          return ReusableCard(
            color: Colors.grey[850],
            edge: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            cardChild: Column(
              children: <Widget>[
                Text(
                  suggestionDist[index]['state'].toString(),
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
                            itemCount: suggestionDist[index]['districtData'].length,
                            itemBuilder: (BuildContext context, int index1){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(suggestionDist[index]['districtData'][index1]['district'].toString(),style: kNumberStyle.copyWith(color: Colors.black54),),
                                  Text(suggestionDist[index]['districtData'][index1]['confirmed'].toString(),style: kNumberStyle.copyWith(color: Colors.black54),),
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
        });
  }

}