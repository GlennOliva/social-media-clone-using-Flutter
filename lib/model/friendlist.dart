import 'package:flutter/material.dart';
import 'package:flutter_prac2/week7task/model/friend.dart';
import 'package:flutter_prac2/week7task/model/userdata.dart';

class FriendList extends StatefulWidget {
  FriendList({Key? key, required this.userData}) : super(key: key);



  @override
  State<FriendList> createState() => _FriendListState();

    final UserData userData;

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

Widget friend(Friend friend) => Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              friend.img,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(friend.name),
          )
        ],
      ),
    );

Widget friendsListGrid(UserData userData) => GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 180,
      ),
      itemCount: userData.friendList.length,
      itemBuilder: (BuildContext ctx, index) {
        return friend(userData.friendList[index]);
      },
    );

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0
          ),
          child: Row(
            children: [
              Text(
                'Friends',
                style: widget.followTxtStyle,
              )
            ],
          ),
          ),
          Padding(
  padding: const EdgeInsets.only(left: 8.0),
  child: Row(
    children: [
      Text('${widget.userData.myUserAccount.numFriends} Friends'),
    ],
  ),
),
SizedBox(
  height: 380,
  child: friendsListGrid(widget.userData), // Pass userData to friendsListGrid
),
SizedBox(
  height: 10,
  child: Container(
    color: Colors.grey,
  ),
),

          
            
      ],
    );
  }
}
