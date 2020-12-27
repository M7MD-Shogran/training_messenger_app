import 'package:flutter/material.dart';
import 'package:test_flutter_messenger/Models/message_model.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(50)
        ),
          child: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(currentUser.imageUrl),
            ),
        ),
        onTap: (){},
    );
  }
}