import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class slider extends StatefulWidget {
  @override
  _sliderState createState() => _sliderState();
}

class _sliderState extends State<slider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: CarouselSlider(
          autoPlay: true,
          items:[
           '  With Ishtar, we try to unite artists from Syria and all over the world, to make, share and contribute with others, because we believe in the power of inspiration,',
            '  With Ishtar, we try to unite artists from Syria and all over the world, to make, share and contribute with others, because we believe in the power of inspiration,',
].map((i){
            return Builder(
                builder:(BuildContext context){
                  return Container(

                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      color: Colors.black45,
                      width: 650,
                      height: 50,
                      child: Center(
                        child: GestureDetector(

                          child:Stack(
                            children: <Widget>[

                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 350,
                                      child: Text(i.toString(),style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,),))
                              )
                            ],
                          ),

                        ),
                      ),
                    ),
                  );
                }
            );
          }).toList()
      ),
    );
  }
}
