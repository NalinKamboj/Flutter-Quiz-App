import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  final bool _answer;
  final VoidCallback _onTap;      //Fancier way of writing 'void _onTap()'. It takes no arguments and it's void. Phew

  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded( // True Button
      child: new Material(
        color: _answer==true?Colors.greenAccent : Colors.redAccent,
          child: new InkWell(
            onTap: () => _onTap(),
              child: new Center(
                child: new Container(     //Using container because it has "decoration" child available. 
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.white, width: 5.0)
                  ),                      
                  padding: new EdgeInsets.all(15.0),    //Padding is a direct property of container
                  child: new Text(_answer==true?"True" : "False", 
                  style: new TextStyle(fontSize: 40.0, color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),)
                )
              ),
            )
          )
        );
  }
}
