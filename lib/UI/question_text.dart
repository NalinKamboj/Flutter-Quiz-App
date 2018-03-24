import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  State createState() => new QuestionTextState();
}


//TickerProvider provides a single ticker that is configured and passed to vsync. With singleTicker, you can have only one animation controller.
//Wiht TickerProvider, you can have more than one animation controllers.
class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {       //TickerProvider is used when we need to use an animation
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    //vsync handles animations that go outside screen. It will be a waste to render something that goes outside the screen.
    _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 600), vsync: this);  
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.bounceOut);  //watch out what curve to use
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question!=widget._question) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  void dispose() {          //VERY IMPORTANT TO DISPOSE THESE!!
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text("Statement " + widget._questionNumber.toString() + ": " + widget._question,
            style: new TextStyle(fontSize: _fontSizeAnimation.value * 20),
          ),
        )
      )
    );
  }
}