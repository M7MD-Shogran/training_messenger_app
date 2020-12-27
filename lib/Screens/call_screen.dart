import 'package:flutter/material.dart';
import 'package:test_flutter_messenger/Components/colors.dart';
import 'package:test_flutter_messenger/Models/user_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CallScreen extends StatefulWidget {
  final User user;
  final String userImage;

  const CallScreen({Key key, this.user, this.userImage}) : super(key: key);
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: AssetImage(widget.userImage),
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.user.name,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Row(              
              children: <Widget>[
                Container(                  
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,                  
                  ),
                  child: FaIcon(FontAwesomeIcons.microphoneSlash),
                )
              ],
            ),
            Text('Hello')
          ],
        ),
      ),
    );
  }
}
