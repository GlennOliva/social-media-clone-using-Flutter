import 'package:flutter/material.dart';
import 'package:flutter_prac2/week7task/model/userdata.dart';

class InfoHeader extends StatelessWidget {
  InfoHeader({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final UserData userData;

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Followers'),
            Text('Posts'),
            Text('Following'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              userData.myUserAccount.numFollowers,
              style: followTxtStyle,
            ),
            Text(
              userData.myUserAccount.numPosts,
              style: followTxtStyle,
            ),
            Text(
              userData.myUserAccount.numFollowing,
              style: followTxtStyle,
            ),
          ], // Removed extra Column() widget
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}
