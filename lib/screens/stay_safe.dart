import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:covid19/constants.dart';

class StaySafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'STAY HOME',
          style: TextStyle(fontSize: 50, fontFamily: 'Teko'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Lottie.asset('assets/WearMask.json'),
                        ),
                        Text(
                          'Wear Mask',
                          style: kTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Lottie.asset('assets/sanitizer.json'),
                        ),
                        Text(
                          'Use Sanitizer',
                          style: kTextStyle,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Lottie.asset('assets/washhands.json'),
                        ),
                        Text('Wash Hands',style: kTextStyle,)
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Lottie.asset('assets/AvoidTouch.json'),
                        ),
                        Text('No Handshake',style: kTextStyle,)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Lottie.asset('assets/socialDistancing.json'),
            ),
            SizedBox(
              child: Text(
                'Maintain Social Distancing',
                style: kTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
