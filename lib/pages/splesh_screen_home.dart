import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant/pages/Home.dart';
import 'package:plant/pages/Product_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller = new AnimationController(vsync: this,duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0,end: 1.0).animate(new CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();


  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  Widget  _animationBuilder(BuildContext context , Widget child){
    double wid = MediaQuery.of(context).size.width;
    double hie = MediaQuery.of(context).size.height;
    return Opacity(opacity: _animation.value,child:Align(
      child: Container(
          height: 3*hie/5,
          width: wid-(wid/7),
          decoration: BoxDecoration(
              color: Color(0xFF4C6A4B),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60))
          ),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(padding: EdgeInsets.only(bottom: hie/15,left: wid/10),
                child: SizedBox(
                  // width: wid/(3.5),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        width: wid/19,
                        height: wid/19,
                        decoration: BoxDecoration(
                            color: Color(0xFF4EA015),
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: wid/40,top: wid/160),
                        child: Text("Plantly",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)
                        ,)
                    ],
                  ),
                ),
              )

              ,Padding(padding: EdgeInsets.only(bottom: hie/15,left: wid/10),
                child: Text("First-even personalizad\nPlant shop",style: TextStyle(color: Color(0xFFACBCAD),fontSize: 21),),)

              ,Padding(padding: EdgeInsets.only(bottom: hie/13,
                  left: wid/10),
                child: Container(
                  width: 2*wid/(5.5),
                  height: hie/17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF618461),width: 2.0)
                  ),
                  child: Center(child: Text("Get Started",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),)),
                ),),


            ],
          )


      ),
      alignment: Alignment.bottomRight,
    ));
  }
  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hie = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF2D452F),
      body: Stack(
        children: [
          AnimatedBuilder(animation: _controller, builder: (context, child) => Opacity(opacity: _animation.value,child:Align(
            child: Container(
                height: 325*hie/599,
                width: 242*wid/277,
                decoration: BoxDecoration(
                    color: Color(0xFF4C6A4B),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60))
                ),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: hie/15,left: wid/10),
                      child: SizedBox(
                        // width: wid/(3.5),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              width: wid/19,
                              height: wid/19,
                              decoration: BoxDecoration(
                                  color: Color(0xFF4EA015),
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: wid/40,top: wid/160),
                              child: Text("Plantly",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)
                              ,)
                          ],
                        ),
                      ),
                    )

                    ,Padding(padding: EdgeInsets.only(bottom: hie/15,left: wid/10),
                      child: Text("First-even personalizad\nPlant shop",style: TextStyle(color: Color(0xFFACBCAD),fontSize: 21),),)

                    ,Padding(padding: EdgeInsets.only(bottom: hie/13,
                        left: wid/10),
                      child: GestureDetector(
                        onTap: (){Navigator.push(context,
                            PageTransition(child: MainHome(), type: PageTransitionType.fade,inheritTheme: true,ctx: context)
                        );
                        },
                        child: Container(
                          width: 2*wid/(5.5),
                          height: hie/17,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xFF618461),width: 2.0)
                          ),
                          child: Center(child: Text("Get Started",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),)),
                        ),
                      ),
                    ),


                  ],
                )


            ),
            alignment: Alignment.bottomRight,
          ))),
          Positioned(
              height: hie*4/6,
              child:Padding(padding: EdgeInsets.only(left: 10),
                child:  Container(
                  child: Image.asset("assets/images/plant.png"),
                  width:7*wid/8,
                  height: 2*hie/5,
                ),)
          )
        ],
      ),
    );
  }
}
