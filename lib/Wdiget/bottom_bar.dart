import 'package:flutter/material.dart';
import 'package:test_flutter_messenger/Components/colors.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final List<String> categories = [
      'Messages',
      'Online',
      'Groups',
      'Requests'
    ];

    return Container(
        height: 100,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
        child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
           borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
                        child: InkWell(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color:
                                    index == selectedIndex ? Colors.white : Colors.white70,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          onTap: (){
                            setState((){
                              selectedIndex = index ;
                            });
                          },
                        ),
        );
      }),
      );
  }
}
