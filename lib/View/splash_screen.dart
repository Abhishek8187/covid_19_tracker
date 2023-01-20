import 'dart:async';

import 'package:covid_19_tracker/View/world_stats.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{  //used for animation duration

  late final AnimationController _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose(){  //disposing the controller when screen changes
    super.dispose();
    _controller.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5 ),
        ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> WorldStatsScreen()))
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            AnimatedBuilder(
                animation: _controller,  //its a object that maintains a list of listener
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Image(image: AssetImage('images/virus2.png'),),
                ),

                builder: (BuildContext context, Widget? child){  //call whenever animation changes its value

              return Transform.rotate(angle: _controller.value *2.0* math.pi,
              child: child,);

            }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
            const Align(
              alignment: Alignment.center,
              child: Text('Covid-19\nTracker App',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            )

          ],
        ),
      ),
    );
  }
}
