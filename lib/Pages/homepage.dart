import 'package:flutter/material.dart';
import 'package:untitled1/data.dart';
import 'package:untitled1/widgets/scrollable_games_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var dHeight;
  var dWidth;
  var _selectedGame;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedGame=0;
  }
  @override
  Widget build(BuildContext context) {
    dHeight=MediaQuery.of(context).size.height;
    dWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children:<Widget>[
          _featuredGamesWidget(),
          _gradiantBoxDicoration(),
          _topLayer(),

      ],
      ),
    );
  }

  Widget  _topLayer(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dWidth*0.05,vertical: dHeight*0.005),
      child:  Column(
        mainAxisAlignment:MainAxisAlignment.start ,
        mainAxisSize: MainAxisSize.max,
        children: [
          _topBar(),
          SizedBox(height: dHeight*0.11,),
          _featuredGamesInfoWidget(),
          Padding(
            padding: EdgeInsets.symmetric( vertical: dHeight*0.01)
            ,child: ScrollableGamesWidget(dWidth, dHeight*0.24,games , true),
          ),
          _featuredGamesBannerWidget(),
          ScrollableGamesWidget(dWidth, dHeight*0.22,games2 , false),
        ],
      ),
    );
  }


  Widget _featuredGamesWidget(){
    return
        SizedBox(
          height:dHeight*0.50 ,width:dWidth,
          child:PageView(
            onPageChanged: (value) {
              setState(() {
                _selectedGame=value;
              });

            },
            scrollDirection: Axis.horizontal,
            children:featuredGames.map((_game){
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:NetworkImage(_game.coverImage.url),
                ),
              ),
            );
          }).toList() ,
          )
        );


  }

  Widget _gradiantBoxDicoration(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: dWidth,
        height: dHeight*0.80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              Color.fromRGBO(35, 45, 59, 1.0),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.65,1.0],
          ),
        ),
      ),
    );
  }

  Widget _topBar(){
    return SizedBox(
      height:dHeight*0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.menu,color: Colors.white,size: 27,
          ),
          Row(
            children: [Icon(Icons.search,color: Colors.white,size: 27,
          ),
            SizedBox(width: dWidth*0.03,),
            Icon(Icons.notifications_none,color: Colors.white,size: 27,
            ),
            ],
          )
        ],

      ),
    );
  }

  Widget _featuredGamesInfoWidget(){
    return SizedBox(
      width: dWidth,
      height: dHeight*0.14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(featuredGames[_selectedGame].title,
          maxLines: 2,
          style: TextStyle(color:Colors.white ,fontSize:dHeight*0.040),
          ),
          SizedBox(height: dHeight*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: featuredGames.map((_game){
              bool isActive= _game.title==featuredGames[_selectedGame].title;
              var _circleRadius=dHeight*0.004;
              return Container(
                margin: EdgeInsets.only(right: dWidth*0.015),
                width: _circleRadius*2,
                height: _circleRadius*2,
                decoration: BoxDecoration(
                  color: isActive? Colors.green:Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              );
            }).toList(),

          ),
        ],
      ),
    );
  }

  Widget _featuredGamesBannerWidget(){
    return Container(
      width: dWidth,
      height: dHeight*0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          fit: BoxFit.cover,
          image:NetworkImage(featuredGames[3].coverImage.url),
        ) ,
      ),
    );
  }



}
