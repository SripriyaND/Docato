
import 'package:docato/pages/signup.dart';
import 'package:docato/widget/content_model.dart';
import 'package:docato/widget/widget_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex=0;
  late PageController _controller;
  void initState(){
    _controller= PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
        super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: contents.length,
            onPageChanged: (int index){
              setState(() {
                currentIndex=index;
              });
            },
            itemBuilder: (_, i){
            return Padding(padding: EdgeInsets.only(right: 20.0),
            child: Column(children: [
              Image.asset(contents[i].image, 
              height: 400, 
              width: MediaQuery.of(context).size.width/1.5, 
              fit: BoxFit.fill,),
              SizedBox(height: 40.0,),
              Text(contents[i].title, style: AppWidget.SemiBoldTextFeildStyle(),),
              SizedBox(height: 40.0,),
              Text(contents[i].description, style: AppWidget.LightTextFeildStyle(),)
          
          ],),
           );
             
          }),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(contents.length, (index) =>
              buildDot(index, context),

            ),
            ),
        ),
        GestureDetector(
          onTap: () {
            if(currentIndex==contents.length-1)
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUp()));
            }
            _controller.nextPage(duration: Duration(milliseconds: 50), curve: Curves.bounceOut);
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(20)),
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: Center(
              child: Text(
                currentIndex==contents.length -1?"Start":"Next", 
              style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
            ),
        ),
        )
      ],
      ),
    );
  }
  Container buildDot(int index, BuildContext context){
    return Container(
      height: 10.0,
      width: currentIndex==index?18:7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.brown),
    );
  }
}