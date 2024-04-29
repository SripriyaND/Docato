import 'package:docato/service/database.dart';
import 'package:docato/service/shared_pref.dart';
import 'package:docato/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  String image, name, detail, price;
Details({required this.detail, required this.image, required this.name, required this.price});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a=1, total=0;
  var id=null;
  

  getthesharedpreferef()async{
   id = await SharedPreferenceHelper().getUserId();
   setState(() {
     
   });
  }

  ontheload()async{
    await getthesharedpreferef();
    setState(() {
      
    });
  }
  @override
  void initState() {
    
    super.initState();
    ontheload();
    total=int.parse(widget.price);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.brown,)),
          Image.network(widget.image, width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height/2, 
           fit: BoxFit.fill,),
           SizedBox(height: 14.0,),
           
            Row(
            
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: AppWidget.SemiBoldTextFeildStyle(),),
                ],
              ),
            Spacer(),
              GestureDetector(
                onTap: () {
                  if(a>1){
                  --a;                 
                   total=total-int.parse(widget.price);


                  }
                  setState(() {
                    
                  });
                },
                child: Container(
                
                  decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.remove, 
                  color: Colors.white,),
                ),
              ),
              SizedBox(width: 20.0,),
              Text(a.toString(), style: AppWidget.SemiBoldTextFeildStyle(),),
              SizedBox(width: 20.0,),
              GestureDetector(
                onTap: () {
                  ++a;
                  total=total+int.parse(widget.price);
                  setState(() {
                    
                  });
                },
                child: Container(
                
                  decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.add, color: Colors.white,),
                ),
              )
            ],),
            SizedBox(height: 20.0,),
            Text(widget.detail,maxLines: 3, 
            style: AppWidget.LightTextFeildStyle()
            ),
Row(children: [
  Text("Delivery Time", style: AppWidget.SemiBoldTextFeildStyle(),),
  Icon(Icons.alarm, color: Colors.brown ,),
  SizedBox(width: 7.0,),
  Text("30 min", style: AppWidget.SemiBoldTextFeildStyle(),),
],),
Spacer(),
Padding(
  padding: const EdgeInsets.only(bottom: 40.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("Total price", style: AppWidget.SemiBoldTextFeildStyle(),),
            Text("\$"+total.toString(), style: AppWidget.headerTextFeildStyle(),)

   ],),
   GestureDetector(
    onTap: () async{
      Map<String, dynamic> addFoodtoCart={
        "Name":widget.name,
        "Quantity":a.toString(),
        "Total":total.toString(),
        "Image": widget.image
      };
      await DatabaseMethods().addFoodToCart(addFoodtoCart, id??"null");
      ScaffoldMessenger.of(context).showSnackBar((SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Food added to the cart", 
              style: TextStyle(fontSize: 18.0),))));
    },
     child: Container(
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Text("Add to cart", style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Poppins'),),
     SizedBox(width: 40.0,),
      Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.brown, borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
      ),
      SizedBox(width:10.0),
      ],) ,
     ),
   )
  ],),
)
 ], 
         
 )
         
 ),
  );
  }
}