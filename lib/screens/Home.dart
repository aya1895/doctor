import 'package:doctor/models/Appoitment.dart';
import 'package:doctor/models/Doctors.dart';
import 'package:doctor/models/category.dart';
import 'package:doctor/styles/colors.dart';
import 'package:doctor/styles/homeSizes.dart';
import 'package:doctor/styles/sizedBox.dart';
import 'package:doctor/styles/textStyle.dart';
import 'package:doctor/styles/textStyle2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:search_widget/search_widget.dart';

import 'Details.dart';
class Home extends StatefulWidget
{
  static final route='/home';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Homestate();
  }

}
class Homestate extends State<Home> {
  TextEditingController searchControler;
  String name = 'Olivia';
  List<Doctors> doctors = [
    Doctors.init(
        'Dr. Ahmed fayed',
        'heart surgan',
        '2.5km',
        1,
        2.5,
        1,
        Appointment.init(
            true,
            true,
            [1, 2, 3, 4],
            [TimeOfDay(hour: 8, minute: 30), TimeOfDay(hour: 11, minute: 30)],
            [TimeOfDay(hour: 5, minute: 30), TimeOfDay(hour: 11, minute: 30)]),'doctor1.png'),
    Doctors.init(
        'Dr. Nouran Mohamed',
        'Bone specialist',
        '2.5km',
        1,
        3.5,
        2,
        Appointment.init(
            true,
            true,
            [1, 2, 3, 4],
            [TimeOfDay(hour: 8, minute: 30), TimeOfDay(hour: 11, minute: 30)],
            [TimeOfDay(hour: 5, minute: 30), TimeOfDay(hour: 11, minute: 30)]),'doctor2.png'),
    Doctors.init(
        'Dr. Amged nady',
        'heart surgan',
        '2.5km',
        1,
        4,
        1,
        Appointment.init(
            true,
            true,
            [1, 2, 3, 4],
            [TimeOfDay(hour: 8, minute: 30), TimeOfDay(hour: 11, minute: 30)],
            [TimeOfDay(hour: 5, minute: 30), TimeOfDay(hour: 11, minute: 30)]),'doctor3.png'),
    Doctors.init(
        'Dr. Ahmed Nader',
        'Eyes specialist',
        '2.5km',
        1,
        5,
        1,
        Appointment.init(
            true,
            true,
            [1, 2, 3, 4],
            [TimeOfDay(hour: 8, minute: 30), TimeOfDay(hour: 11, minute: 30)],
            [TimeOfDay(hour: 5, minute: 30), TimeOfDay(hour: 11, minute: 30)]),'doctor1.png'),
    Doctors.init(
        'Dr. Ahmed aly',
        'heart surgan',
        '2.5km',
        1,
        4.5,
        1,
        Appointment.init(
            true,
            true,
            [1, 2, 3, 4],
            [TimeOfDay(hour: 8, minute: 30), TimeOfDay(hour: 11, minute: 30)],
            [TimeOfDay(hour: 5, minute: 30), TimeOfDay(hour: 11, minute: 30)]),'doctor2.png')
  ];

  List<category> categories = [
    category.intit('Dental', 1,'dentalicon.png',22),
    category.intit('Heart', 2,'hearticon.png',32),
    category.intit('Brain', 3,'brainicon.png',10),
    category.intit('bones', 4,'boneicon.png',15)
  ];

  List<Doctors>filtered;
  void openDetails(Doctors item)
  {
    Navigator.pushNamed(context, Details.route,arguments: item);
  }
@override
  void initState() {
    // TODO: implement initState
  filtered=[...doctors];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: myColors.primary,
      appBar: AppBar(
          elevation: 0.0,//cancel shadow of appbar
          leading: IconButton(
            icon: Image.asset('assets/group24.png'),
            onPressed: () {
              //drawer icon
              Scaffold.of(context).openDrawer();
            },
          ),
          actions: [
            IconButton(
                icon: Image.asset(
                  'assets/notification.png',
                ),
                onPressed: () {
                  //opeen notification screen
                }),
            IconButton(
                icon: Image.asset('assets/profile.jpeg'),
                onPressed: () {
                  //open profile screen
                })
          ]),
      body: Container(
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.only(left:homeSizes.radius,right: homeSizes.radius,top: homeSizes.radius,bottom: 4),
        decoration: new BoxDecoration(
            color: myColors.homebg,
            borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(homeSizes.radius),
                topRight: Radius.circular(homeSizes.radius))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Hi, $name",
              style: textStyle(FontWeight.normal, homeSizes.txt).txtStyle,
            ),
            sizedBox(),
            Text(
              "Welcome Back",
              style: textStyle(FontWeight.bold, homeSizes.txt).txtStyle,
            ),

SearchWidget<Doctors>
  (
  textFieldBuilder: (textEditingControler,focuseNode)
    {
      return Container(
        margin: EdgeInsets.all(homeSizes.radius),
        height: homeSizes.searchH,
        child: TextField(controller: textEditingControler,
          focusNode: focuseNode,
          autofocus: false,
          style: TextStyle(fontSize: homeSizes.txt,
              color:myColors.txt),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white
              ,hintText: 'search...'
              ,hintStyle: TextStyle(color:myColors.txt2, )
              ,border: OutlineInputBorder(borderRadius:
          BorderRadius.circular(homeSizes.bodyR),
            borderSide: BorderSide.none
          ,)
         ,suffixIcon: Container(width: homeSizes.bodyR,
            decoration:   new BoxDecoration(
              color:myColors.select,
                borderRadius: BorderRadius.all(Radius.circular(homeSizes.bodyR))),
            child: Image.asset('assets/searchicon.png'),) )
          ),


      );
    },
    dataList:doctors,
    popupListItemBuilder: (item){
     // print(item.name);
      return Text(item.name);
     // return SizedBox(height: 0,width: 0,);
    },
    selectedItemBuilder: (item,last) {
    // ignore: missing_return, missing_return, missing_return
  //openDetails(item);

    return null;
    },
    queryBuilder: (query,list){
    //print(list.where((item) => item.name.toLowerCase().contains(query.toLowerCase())));
      setState(() {
        filtered=list.where((Doctors item) => item.name.toLowerCase().contains(query.toLowerCase())).toList();
      });
  return filtered;}
      ,onItemSelected: (item)
  {

  },  )


            ,Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Text(
                    'Category',
                    style: textStyle(FontWeight.bold, homeSizes.txtBody).txtStyle,
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Text(
                    'See all',
                    style: textStyle2().textStyle,
                  ),
                  onTap: () {},
                )
              ],
            ),
            sizedBox(),
            Container(
              height: homeSizes.categoryItemH,

              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {

                    return Container(
                        width:homeSizes.categoryItemW,child: Card(
                      color: myColors.select,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(homeSizes.bodyR)
                      ),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,children: [
                        Image.asset('assets/${categories[index].img}',height: homeSizes.categoryItemIconH,)
                        ,sizedBox()
                      ,Text(categories[index].name,
                          style: textStyle(FontWeight.bold,homeSizes.categoryItenTxt,Colors.white).txtStyle,),
                        sizedBox(),
                      Text('${categories[index].numOFdrs} Doctors',
                        style: textStyle(FontWeight.normal,homeSizes.categoryItenTxt,Colors.white).txtStyle)],
                      ),

                  ),);
                }))
            ,sizedBox()
            ,Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      InkWell(
      child: Text(
      'Top rate',
      style: textStyle(FontWeight.bold, homeSizes.txtBody).txtStyle,
    ),
    onTap: () {},
    ),
    InkWell(
    child: Text(
    'See all',
    style: textStyle2().textStyle,
    ),
    onTap: () {},
    )
    ],
    ),
   sizedBox(),

    Expanded(
      child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: filtered.length,
      itemBuilder: (context, index) {

      return Container(
        padding: EdgeInsets.only(top: homeSizes.bodyR),
      height:homeSizes.doctorItemH,child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(homeSizes.bodyR)
      ),
      child: ListTile(
        leading: Image.asset('assets/${filtered[index].img}',
          width: homeSizes.doctorItemImgW,height: homeSizes.doctorItemImgH,fit:  BoxFit.fitHeight, ),
      title: Text(filtered[index].name,style: TextStyle(color:Colors.black),),
      subtitle:
      Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(filtered[index].title,),
        Container(
          width: 58,
          height: 20,
          child: Row(
            children: [
              Image.asset('assets/staricon.png',width: 7,height: 15,),
              Text(' ${filtered[index].rate} ',style: textStyle(FontWeight.bold,6).txtStyle,)
              , Image.asset('assets/locationicon.png',width: 7,height: 15,),
              Text(' ${filtered[index].distance} k.m ',style: textStyle(FontWeight.bold,6).txtStyle,)
            ],),
        ),])
      ,
        onTap: ()
        {
          Navigator.pushNamed(context, Details.route,arguments: filtered[index]);
        },

      )),);
      }),
    )
          ],
        ),
      ),
    );
  }
}
