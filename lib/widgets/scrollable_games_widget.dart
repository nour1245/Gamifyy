
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class ScrollableGamesWidget extends StatelessWidget{
 final double _height;
 final double _width;
 final bool _showTitle;
 final List<Game> _gamesData;

ScrollableGamesWidget(this._width,this._height ,this._gamesData,this._showTitle);

@override
Widget build(BuildContext context){
  return SizedBox(
    width: _width,
    height: _height,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: _gamesData.map((_game){
        return Container(
          width: _width*0.30,
          height: _height,
          padding: EdgeInsets.only(right: _width*.03),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment:CrossAxisAlignment.start ,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: _width*0.45,
                height: _height*0.76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_game.coverImage.url),
                  ),
                ),
              ),
              _showTitle ?
              Text(_game.title,maxLines: 2,

                style: TextStyle(
                color: Colors.white,
                  fontSize: _height*0.08,
              ),
              ): Container(),
            ],
          ),
        );
      }).toList(),
    ),
  ) ;
}
}