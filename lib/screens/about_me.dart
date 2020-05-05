import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';


class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/shri.jpg'),
                ),
                Text(
                  "Shrijeet Punewar",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontFamily: ('indieFlower'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SocialMediaButton.twitter(
                      url: 'https://twitter.com/shrijeetcool?lang=en',
                      size: 35,
                      color: Colors.blue,
                    ),
                    SocialMediaButton.instagram(url: 'https://www.instagram.com/shrijeet_punewar/',
                    color: Colors.pinkAccent,
                    size: 35,),
                    SocialMediaButton.linkedin(url: 'https://in.linkedin.com/in/shrijeet-punewar-3a792915b',
                    color: Colors.lightBlueAccent,
                    size: 35,),
                    SocialMediaButton.github(url: 'https://github.com/shrijeetx',
                    size: 35,)
                  ],
                ),

                Card(
                    margin: EdgeInsets.only(top: 10, right: 35, left: 35),
                    color: Colors.grey[900],
                    child: ListTile(
                      leading: Icon(Icons.email,
                          color: Colors.white),
                      title: Text(
                        'Shrijeet100@gmail.com',
                        style: (TextStyle(fontSize: 18,color: Colors.white)),
                      ),
                    )),
                SizedBox(
                  height: 40,
                  width: 120,
                  child: Divider(
                    color: Colors.grey[400],
                  ),
                ),
                Text('Made With ❤ From',style: TextStyle(fontSize: 26)),
                Container(
                  margin: EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: Image.asset('images/india.png'),
                ),
                SizedBox(
                  height: 40,
                  width: 120,
                ),
                Text('ICON   by icons8',style: (TextStyle(fontSize: 15,color: Colors.white))),
                Text('IMAGES   by Freepik',style: (TextStyle(fontSize: 15,color: Colors.white))),
                Text('ANIMATIONS   by lottiefiles',style: (TextStyle(fontSize: 15,color: Colors.white))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
