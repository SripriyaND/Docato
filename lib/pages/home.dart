import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docato/pages/details.dart';
import 'package:docato/service/database.dart';
import 'package:docato/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

bool dry=false, wet=false, dehydrated=false, homemade=false;


Stream? fooditemStream;
ontheload()async{
  fooditemStream=await DatabaseMethods().getFoodItem("Dry");
  setState(() {
    
  });
}

@override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItemsVertically(){
  return StreamBuilder(stream: fooditemStream, builder: (context, AsyncSnapshot snapshot){
  return snapshot.hasData? ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: snapshot.data.docs.length,
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index){
      DocumentSnapshot ds=snapshot.data.docs[index];
      return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(detail: ds["Detail"],name: ds["Name"],price: ds["Price"],image: ds["Image"],)),
                    );
                  },
                  child: Container(
            margin: EdgeInsets.all(5),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(6),
                
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(ds["Image"],
                     height: 100, 
                     width: 100,
                     fit: BoxFit.cover,
                     ),
                  ),
                   SizedBox(width: 15.0,),
                   Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Text(ds["Name"], style: AppWidget.SemiBoldTextFeildStyle(),),),
                      SizedBox(height: 5.0,),
                      Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Text("millet & eggs", style: AppWidget.LightTextFeildStyle(),),),
                      SizedBox(height: 5.0,),
                      Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Text("\$"+ds["Price"], style: AppWidget.SemiBoldTextFeildStyle(),),),
                      
                 ] ),
                  
                ],
                ),

              ),
              
            ),
          ),         
           );
  }):CircularProgressIndicator();
  });
  }

  
  Widget allItems(){
  return StreamBuilder(stream: fooditemStream, builder: (context, AsyncSnapshot snapshot){
  return snapshot.hasData? ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: snapshot.data.docs.length,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index){
      DocumentSnapshot ds=snapshot.data.docs[index];
      return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(detail: ds["Detail"],name: ds["Name"],price: ds["Price"],image: ds["Image"],)),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(ds["Image"], 
                            height: 150, 
                            width: 150, 
                            fit: BoxFit.cover,),
                          ),
                          Text(ds["Name"], 
                          style: AppWidget.SemiBoldTextFeildStyle()),
                          SizedBox(height: 5.0,),
                          Text("Healthy and Tasty", 
                          style: AppWidget.LightTextFeildStyle()),
                          SizedBox(height: 5.0,),
                          Text("\$"+ds["Price"], style: AppWidget.SemiBoldTextFeildStyle(),)
                        ],),
                        
                      ),
                    ),
                  ),
                );
                

  }):CircularProgressIndicator();
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          Text(
            "Hello..🐾Parent,",
           style:AppWidget.boldTextFeildStyle()
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                padding: EdgeInsets.all(3),
            decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(8)),
            child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
           ),
              ],
          
          ),
          SizedBox(height: 20.0,),
          Text(
            "Yumm!! 😋",
           style:AppWidget.headerTextFeildStyle()
              ),
              Text(
            "Get homemade food for your furry friends",
           style:AppWidget.LightTextFeildStyle()
              ),
              SizedBox(height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                child: showItem()),
              SizedBox(
                height: 30.0,),
              Container(
                height: 270,
                child: allItems()),
              SizedBox(
                height: 30.0,
              ),
            allItemsVertically(),
          ],
                 ),
        ),
     ),
    );
 }
 Widget showItem()
 {
  return   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: ()async{
                    dry=true;
                    wet=false;
                    dehydrated=false;
                    homemade=false;
                    fooditemStream= await DatabaseMethods().getFoodItem("Dry");
                    setState(() {   
                    });
                  },
                
             child: Material(
                elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(color: dry?Colors.brown: Colors.white, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Image.asset("images/dry.png", height: 45, width: 45,fit: BoxFit.cover),
              ),
             ),
          ), 
          GestureDetector(
                  onTap: ()async{
                    dry=false;
                    wet=true;
                    dehydrated=false;
                    homemade=false;
                    fooditemStream= await DatabaseMethods().getFoodItem("Wet");
                    setState(() {

                    });
                    },
            child: Material(
                elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(color: wet?Colors.brown: Colors.white, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Image.asset("images/wet.png", height: 45, width: 45,fit: BoxFit.cover),
              ),
             ),
                    ),
                    GestureDetector(
                  onTap: ()async{
                    dry=false;
                    wet=false;
                    dehydrated=true;
                    homemade=false;
                    fooditemStream= await DatabaseMethods().getFoodItem("Dehydrated");
                    setState(() {

                    });
                    },

             child: Material(
                elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
             decoration: BoxDecoration(color: dehydrated?Colors.brown: Colors.white, borderRadius: BorderRadius.circular(10)),
             padding: EdgeInsets.all(8),
                child: Image.asset("images/dehydrated.png", height: 45, width: 45,fit: BoxFit.cover),
              ),
             ),
                    ),

                    GestureDetector(
                  onTap: ()async{
                    dry=false;
                    wet=false;
                    dehydrated=false;
                    homemade=true;
                    fooditemStream= await DatabaseMethods().getFoodItem("Homemade");
                    setState(() {
                    });
                  },

             child: Material(
                elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
             decoration: BoxDecoration(color: homemade?Colors.brown: Colors.white, borderRadius: BorderRadius.circular(10)),

                padding: EdgeInsets.all(8),
                child: Image.asset("images/homemade.png", height: 45, width: 45,fit: BoxFit.cover),
              ),
             ),
                    ),
             

           ],);
 }
 }
