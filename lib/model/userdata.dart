import 'friend.dart';
import 'account.dart';
import 'usercomment.dart';
import 'userpost.dart';


class UserData {
  List<UserPost> userList = [
    UserPost(
      userimg: 'images/nerdyglenn.png',
      username: 'Glenny',
      time: 'Just Now',
      postcontent: 'Water is liquid',
      postimg: 'images/meme1.jpg',
      numComments: '5 comments',
      numShare: '5 shares',
      isliked: false,
      ),


      UserPost(
      userimg: 'images/marikit.jpg',
      username: 'Marikit',
      time: '5 mins ago',
      postcontent: 'Hays nako',
      postimg: 'images/meme2.jpg',
      numComments: '5 comments',
      numShare: '5 shares',
      isliked: false,
      ),


        UserPost(
      userimg: 'images/juls.jpg',
      username: 'Julsy',
      time: '10 mins ago',
      postcontent: 'Hays nako po',
      postimg: 'images/meme3.jpg',
      numComments: '5 comments',
      numShare: '5 shares',
      isliked: false,
      ),
  ];


  List<Friend> friendList = [
    Friend(
      img: 'images/maryyawa.jpg',
      name: 'Mary Iana Benel Buisan',
      ),

      Friend(
      img: 'images/marikit.jpg',
      name: 'Marie Cris Alarilla',
      ),


      Friend(
      img: 'images/raymond.jpg',
      name: 'Raymond Mapayo',
      ),


      Friend(
      img: 'images/eda.jpg',
      name: 'Edda  Osorno',
      ),


      Friend(
      img: 'images/engyo.jpg',
      name: 'Johnley Engyo',
      ),

       Friend(
      img: 'images/hanz.png',
      name: 'Hanz Quezada',
      ),
  ];


  List<UserComment> commentList = [
    UserComment(
      commenterImg: 'images/hanz.png',
      commenterName: 'Hanz Quezada',
      commentTime: 'Just Now',
      commentContent: 'What a nice meme!',
      ),

      UserComment(
      commenterImg: 'images/juswa.jpg',
      commenterName: 'Joshua Guzman',
      commentTime: '1hr ago',
      commentContent: 'HAHAHA lol!',
      ),

       UserComment(
      commenterImg: 'images/raymond.jpg',
      commenterName: 'Raymond Mapayo',
      commentTime: '2hrs ago',
      commentContent: 'HAHAHA W3w',
      ),
  ];


  Account myUserAccount = Account(
    name: 'Glenn Angelo Oliva',
    email: 'g.oiva.523349@umindanao.edu.ph',
    img: 'images/nerdyglenn.png',
    numFollowers: '5k',
    numPosts: '25',
    numFollowing: '10',
    numFriends: '1000',
    );
}