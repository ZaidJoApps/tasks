import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
   static  String id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            Container(
              color: Colors.blue,
              child: ListTile(
                leading: BackButton(),
                title: Text('شاشة طلبات تصاريح الدخول',
                style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(
              child: Material(
                elevation: 0.0,
                borderRadius: BorderRadius.zero,
                child: TextField(
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    icon: Icon(Icons.search),
                    hintText: 'البحث عن رقم الطلب',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 400.0,
                height: 750,
                child: ListView(
                  children: [
                    cardWidget(),
                    cardWidget(),
                    cardWidget(),
                    cardWidget(),
                    cardWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget cardWidget(){
    return Container(
      height: 150.0,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                cardRow(Text('رقم الطلب' , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade500),) ,
                       Text('20202021465464',style: TextStyle( color: Colors.blue.shade300),) ),
                cardRow(Text('اسم المستثمر',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade500),) ,
                    Text('جرين هاوس لتجارة المواد الغذائية',style: TextStyle( color: Colors.blue.shade300)) ),
                cardRow(Text('االعدد المطلوب',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade500),) ,
                    Text('5/0',style: TextStyle( color: Colors.blue.shade300)) ),
                cardRow(Text('قيد التدقيق',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade500),) ,
                     Icon(Icons.timer , color: Colors.yellow.shade500,) )
              ],
            ),

            Icon(Icons.book , size: 90.0, color: Colors.blue.shade500),

          ],
        ),
      ),
    );
  }

}

Widget cardRow(widget1 , widget2){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      widget2,
      SizedBox(width: 10.0,),
      widget1,
    ],
  );
}


