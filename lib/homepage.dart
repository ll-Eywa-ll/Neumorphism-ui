import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './models/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User _user = User(name: 'Sarthak');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homeAppBar(),
      body: body(),
    );
  }

  AppBar _homeAppBar() => AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 40,
            ),
          ),
          onPressed: () {
            print('Button Pressed.');
          },
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.bell,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  print('\n\nBell was pressed.');
                },
              ),
            ),
          )
        ],
      );

  Widget body() {
    Text greetHeading() {
      return Text(
        'Welcome Back, ${_user.name}!',
        style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w700),
      );
    }

    Text greetSubHeading() {
      return Text(
        'Ready to start your day?',
        style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
      );
    }

    Widget searchTextField() {
      return TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 25),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Icon(FontAwesomeIcons.search, color: Colors.grey.shade600),
            ),
            suffixIcon: Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Icon(FontAwesomeIcons.microphoneAlt,
                    color: Colors.red.shade400)),
            filled: true,
            fillColor: Colors.grey.shade300,
            hintText: 'Search themes here',
            hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 20),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)))),
      );
    }

    Text categorySubHeading({String text}) {
      return Text('$text',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
    }

    Widget icon({IconData iconName}) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent.shade200.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Icon(iconName, color: Colors.blueAccent.shade400),
        ),
      );
    }

    Container progressCard() {
      return Container(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.only(left: 32, top: 20, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon(iconName: FontAwesomeIcons.moon),
              SizedBox(height: 20),
              Text(
                'The Silent Night Vibes',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                '2/4 Sessions left',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    '75%',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    height: 10,
                    width: 400,
                    child: LinearProgressIndicator(
                      backgroundColor:
                          Colors.blueAccent.shade100.withOpacity(0.6),
                      value: 0.75,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 50,
                  offset: Offset(2, 2))
            ]),
      );
    }

    Row recommenedSubheading() {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          categorySubHeading(text: 'Recommended'),
          Icon(
            FontAwesomeIcons.arrowRight,
            color: Colors.blueAccent.shade400,
            size: 30,
          ),
        ],
      );
    }

    Widget recommenedCards() {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 30.0),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          greetHeading(),
          SizedBox(height: 20),
          greetSubHeading(),
          SizedBox(height: 40),
          searchTextField(),
          SizedBox(height: 40),
          categorySubHeading(text: 'In Progress'),
          SizedBox(height: 30),
          progressCard(),
          SizedBox(height: 40),
          recommenedSubheading(),
          SizedBox(height: 30),
          recommenedCards(),
        ],
      ),
    );
  }
}
