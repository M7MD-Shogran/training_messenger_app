import 'package:flutter/material.dart';
import 'package:test_flutter_messenger/Components/colors.dart';
import 'package:test_flutter_messenger/Wdiget/bottom_bar.dart';
import 'package:test_flutter_messenger/Wdiget/favorite_contacts.dart';
import 'package:test_flutter_messenger/Wdiget/profile_icon.dart';
import 'package:test_flutter_messenger/Wdiget/recent_contact.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: ProfileIcon(),
        elevation: 0,
        title: Text(
          'Chats',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              expandedHeight: 270,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                  background: Expanded(
                child: Column(
                  children: <Widget>[
                    BottomBar(),
                    FavoriteContact(),
                  ],
                ),
              )),
            ),
          ];
        },
        body: Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: <Widget>[RecentContact()],
            ),
          ),
        ),
      ),
    );
  }
}


