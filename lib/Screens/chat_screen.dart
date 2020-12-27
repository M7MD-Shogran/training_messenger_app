import 'package:flutter/material.dart';
import 'package:test_flutter_messenger/Components/colors.dart';
import 'package:test_flutter_messenger/Models/message_model.dart';
import 'package:test_flutter_messenger/Models/user_model.dart';
import 'package:test_flutter_messenger/Screens/call_screen.dart';


class ChatScreen extends StatefulWidget {
  final User user;
  final String userImage;

  const ChatScreen({Key key, this.user, this.userImage}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

final _sendMessageController = TextEditingController();
@override
  void dispose() {
    super.dispose();
    _sendMessageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.call,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CallScreen(
                  user : widget.user , userImage : widget.userImage
                )));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.videocam,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(widget.userImage),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.user.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: kPrimaryLightColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 10),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return _buildMessege(message, isMe);
                      }),
                ),
              ),
            ),
            _buildTextFieldMessege(),
          ],
        ));
  }

  Container _buildTextFieldMessege() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      height: 70,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.photo_camera,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: TextFormField(
              controller: _sendMessageController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  hintText: 'Write a Message here . . ',
                  
                  filled: true,
                  fillColor: kPrimaryLightColor),
                  textInputAction: TextInputAction.send,
                  onFieldSubmitted: (value){},                  
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildMessege(Message message, bool isMe) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * .7,
      margin: isMe
          ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
          : EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
      padding: EdgeInsets.all(16),
      decoration: isMe
          ? BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              color: Colors.white,
            )
          : BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: Colors.white,
            ),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            message.text,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
            icon: message.isLiked
                ? Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 30,
                  )
                : Icon(
                    Icons.favorite,
                    color: kPrimaryColor,
                    size: 30,
                  ),
            onPressed: () {}),
      ],
    );
  }
}
