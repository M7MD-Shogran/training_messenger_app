import 'package:flutter/material.dart';
import 'package:test_flutter_messenger/Components/colors.dart';
import 'package:test_flutter_messenger/Screens/chat_screen.dart';
class ChatBar extends StatelessWidget {
  const ChatBar({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ChatScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      color: kPrimaryColor,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white, onPressed: () => Navigator.popAndPushNamed(context, 'home'),                          
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.userImage),
                  ),
                  Container(
            
            padding: EdgeInsets.all(6),
            child: Text(widget.user.name ,style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),),
            ),
                ],
              ),
            ),
            
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.call , color: Colors.white,), onPressed: () { },
                  ),
                  IconButton(
                    icon: Icon(Icons.videocam , color: Colors.white,), onPressed: () { },
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert , color: Colors.white,), onPressed: () { },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}