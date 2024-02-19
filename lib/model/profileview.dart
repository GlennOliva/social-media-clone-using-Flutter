import 'package:flutter/material.dart';
import 'package:flutter_prac2/week7task/model/usercomment.dart';
import 'package:flutter_prac2/week7task/model/userdata.dart';
import 'package:flutter_prac2/week7task/model/userpost.dart';

class ProfileView extends StatefulWidget {
   ProfileView({super.key , required this.userPost});

  final UserPost userPost;
  final UserData userData = UserData();

  var nametxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  
  var boldtxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );

  Widget commentBtn(UserComment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(userComment.commentTime),
        const SizedBox(width: 15,),
        const Text('Like'),
        const SizedBox(width: 15,),
        const Text('Reply'),
      ],
    ),
    );


    Widget commentDesc(UserComment userComment) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userComment.commenterName, style: boldtxtStyle,),
          const SizedBox(height: 5,),
          Row(
            children: [
              Text(userComment.commentContent),
            ],
          )
        ],
      ),
    );


    Widget commentSpace(UserComment userComment) => Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(35, 158, 158, 158),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        )
      ),
      child: commentDesc(userComment),
    );

    Widget commenterPic(UserComment userComment) => Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(userComment.commenterImg),
      ),
    );

    Widget usercommenterline(UserPost userPost, UserComment  userComment) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        commenterPic(userComment),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commentSpace(userComment),
            commentBtn(userComment),
          ],
        )
      ],
    );


    Widget userpostdetails(UserComment userComment) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 15,),
        usercommenterline(userPost, userComment),
      ],
    );

    Widget commenters(UserPost userPost) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Divider(
          color: Color.fromARGB(86, 158, 158, 158),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(userPost.numShare, style: boldtxtStyle,)
            ],
          ),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text('All comments', style: boldtxtStyle,),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
            ),
            const SizedBox(height: 15,),
      ],
    );


   


Widget userline(UserPost userPost) => Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(userPost.userimg),
      ),
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userPost.username, style: nametxtStyle,),
        Row(
          children: [
            Text(userPost.time),
            const Text('.'),
            const Icon(Icons.group , size: 16, color: Colors.grey,),
          ],
        )
      ],
    )
  ],
);


Widget postimage(UserPost userPost) => Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          Text(userPost.postcontent),
        ],
      ),
      const SizedBox(height: 15,
      ),
      Container(
        height: 350,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(userPost.postimg),
            fit: BoxFit.fill)
        ),
      )
    ],
  ),
  );


  @override
  State<ProfileView> createState() => _ProfileViewState();

  
}


class _ProfileViewState extends State<ProfileView> {
  TextEditingController _commentController = TextEditingController();

  bool _isCommenting = false;
  List<UserComment> commentList = [];
  List<UserComment> myComments = []; // Separate list for your comments

  // Other methods...

  @override
  Widget build(BuildContext context) {
    // Combine your comments with dummy comments for display
    List<UserComment> combinedComments = [...widget.userData.commentList, ...myComments];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back, color: Colors.grey,
          ),
        ),
      ),
      body: ListView(
        children: [
          widget.userline(widget.userPost),
          widget.postimage(widget.userPost),
           buttons(widget.userPost),
          // Display the combined comment list
          ...combinedComments.map((userComment) {
            return widget.userpostdetails(userComment);
          }).toList(),
          // Comment container with "Comment" button
         
          // Textfield container below comment list
          if (_isCommenting)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  // Rounded Rectangle TextField
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Write a comment',
                        contentPadding: const EdgeInsets.all(8), // Adjust padding as needed
                        border: InputBorder.none, // Hide the default border
                        suffixIcon: TextButton(
                          onPressed: () {
                            // Add your logic to handle sending the comment
                            String commentContent = _commentController.text;
                            // Create a new UserComment instance
                            UserComment newComment = UserComment(
                              commenterImg: 'images/nerdyglenn.png', // Change this to the commenter's image
                              commenterName: 'Glenn Angelo Oliva', // Change this to the commenter's name
                              commentTime: 'Just Now', // You may update this as needed
                              commentContent: commentContent,
                            );
                            // Add the new comment to your comments list
                            myComments.add(newComment);

                            // Clear the text field after sending the comment
                            _commentController.clear();

                            // Close the comment container
                            setState(() {
                              _isCommenting = false;
                            });
                          },
                          child: const Icon(Icons.send, size: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Optional: You can remove the standalone TextButton here
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buttons(UserPost userPost) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Divider(color: Color.fromARGB(86, 158, 158, 158)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: (!userPost.isliked) ? Colors.grey : Colors.blue
                ),
                onPressed: () {
                  setState(() {
                    userPost.isliked = !userPost.isliked;
                  });
                },
                icon: const Icon(Icons.thumb_up, size: 20,),
                label: Text('Like'),
                ),
              // "Comment" button
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    // Toggle the comment container visibility only when the button is pressed
                    _isCommenting = !_isCommenting;
                  });
                },
                icon: const Icon(Icons.chat_bubble, size: 20,),
                label: const Text('Comment'),
              ),
              // Other buttons...
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                ),
                onPressed: () {
                  
                },
                icon: const Icon(Icons.share, size: 20,),
                label: const Text('Share'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}





