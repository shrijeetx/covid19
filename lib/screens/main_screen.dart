import 'package:covid19/brain/api_networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangingScreen();
  }
}

class ChangingScreen extends StatefulWidget {
  @override
  _ChangingScreenState createState() => _ChangingScreenState();
}

class _ChangingScreenState extends State<ChangingScreen> {
  int _currentIndex = 0;

  List<String> worldData = [
    'loding...',
    'loading...',
    'loading...',
    'loading...'
  ];

  @override
  void initState() {
    super.initState();
    initWorldData();
  }

  void initWorldData() async {
    ApiNetworking apiNetworking =
        ApiNetworking(url: 'https://disease.sh/v2/all');
    var data = await apiNetworking.getWorldData();
    setState(() {
      worldData.insert(0, data['cases'].toString());
      worldData.insert(1, data['active'].toString());
      worldData.insert(2, data['recovered'].toString());
      worldData.insert(3, data['deaths'].toString());
    });
  }
  Duration duration = Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(' Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text(' INDIA'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            title: Text('World'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('About me'),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if(_currentIndex==0&&index==0){
              return;
            }else if(_currentIndex==1){
              Navigator.pushNamed(context, '/indiadist');
              Future.delayed(duration,(){_currentIndex=0;});
            }else if(_currentIndex==2){
              Navigator.pushNamed(context, '/worlddata');
              Future.delayed(duration,(){_currentIndex=0;});
            }else if(_currentIndex==3){
              Navigator.pushNamed(context, '/aboutme');
              Future.delayed(duration,(){_currentIndex=0;});
            }
          });
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'COVID 19',
          style: TextStyle(fontSize: 50, fontFamily: 'Teko'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Image.asset('images/thankyou.png'),
            ),
            SizedBox(
              height: 30,
              child: Text(
                'Worldwide Status',
                style: TextStyle(fontSize: 20, fontFamily: 'Anton'),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    height: 100,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'Confirmed',
                          style: kTextStyle,
                        ),
                        Text(
                          worldData[0].toString(),
                          style: kNumberStyle,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    color: Colors.red[300],
                    edge:
                        EdgeInsets.only(left: 20, top: 10, bottom: 5, right: 5),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    height: 100,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Active',
                          style: kTextStyle,
                        ),
                        Text(
                          worldData[1].toString(),
                          style: kNumberStyle,
                        ),
                      ],
                    ),
                    color: Colors.blue[300],
                    edge:
                        EdgeInsets.only(left: 5, top: 10, bottom: 5, right: 20),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    height: 100,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Recovered',
                          style: kTextStyle,
                        ),
                        Text(
                          worldData[2].toString(),
                          style: kNumberStyle,
                        ),
                      ],
                    ),
                    color: Colors.green[300],
                    edge:
                        EdgeInsets.only(left: 20, top: 5, bottom: 20, right: 5),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    height: 100,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Deaths',
                          style: kTextStyle,
                        ),
                        Text(
                          worldData[3].toString(),
                          style: kNumberStyle,
                        ),
                      ],
                    ),
                    color: Colors.red[300],
                    edge:
                        EdgeInsets.only(left: 5, top: 5, bottom: 20, right: 20),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 65,
              color: Colors.black,
              child: OutlineButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/staysafe');
                },
                child: Center(
                    child: Text(
                  'How to stay safe      ➤ ',
                  style: kTextStyle,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
