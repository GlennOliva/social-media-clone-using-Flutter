import 'package:flutter/material.dart';

class SampleMutableButton extends StatefulWidget {
  const SampleMutableButton({super.key});

  @override
  State<SampleMutableButton> createState() => _SampleMutableButtonState();
}

bool isClicked = false;



class _SampleMutableButtonState extends State<SampleMutableButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mutable button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                ClickButton();
              },
              icon:  Icon(
                Icons.thumb_up,
                color: textAndIconColor(),
              ),
              label:  Text(
                'LIKE',
                style: TextStyle(color: textAndIconColor()),
              ),
               ),


          ],
        ),
      ),
    );

    

  }

    ClickButton() {
  setState(() {
    isClicked = (isClicked) ? false : true;
  });
}


textAndIconColor() => (isClicked) ? Colors.white : Colors.grey;
btnColor() => (isClicked) ? Colors.blue : null;

}

