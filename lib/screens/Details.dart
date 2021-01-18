import 'package:doctor/models/Doctors.dart';
import 'package:doctor/styles/colors.dart';
import 'package:doctor/styles/sizedBox.dart';
import 'package:doctor/styles/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grid_selector/grid_selector.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class Details extends StatefulWidget {
  static final route = '/details';
  Doctors item;

  Details(this.item);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailsState(item);
  }
}

class detailsState extends State<Details> {
  List<String>items = [
    '8:30 Am',
    '9:00 Am',
    '9:30 Am',
    '10:00 Am',
    '10:30 Am',
    '11:00 Am'
  ];
  List<String>items2 = [
    '5:30 pm',
    '6:00 pm',
    '6:30 pm',
    '7:00 pm',
    '7:30 pm',
    '8:00 pm'
  ];
  String selectedTime = '8:30 Am';
  bool m = true;

  bool e = false;

  TextEditingController userName = TextEditingController();
  final DateTime now = DateTime.now();
  final dateFormat = DateFormat('MMMM  y');
  DateTime selected;

  Doctors item;

  detailsState(this.item) {
    selected = now;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        backgroundColor: myColors.homebg,
    appBar: AppBar(
    elevation: 0.0,
    leading:IconButton(icon:Image.asset('assets/backicon.png'),
    onPressed: ()
    {
    Navigator.pop(context);
    },),actions: [IconButton(icon:
    Image.asset('assets/notification.png'),
    onPressed: ()
    {
    },)],
    ),
    body: SingleChildScrollView(

    child: Stack(
    children: [
    Column(children: [

    Container(
    height: 120,
    padding: EdgeInsets.only(left: 25,bottom: 25,right: 25),
    decoration: new BoxDecoration(
    color: myColors.primary,
    borderRadius: new BorderRadius.only(
    bottomLeft: Radius.circular(25.0),
    bottomRight: Radius.circular(25.0))),
    child: Row(
    children: [
    Image.asset('assets/${item.img}',height: 100,width: 100,fit:BoxFit.fitHeight,)
    ,SizedBox(width: 5,)
    ,Column(mainAxisAlignment:MainAxisAlignment.start,
    crossAxisAlignment:CrossAxisAlignment.start,children: [
    Text(item.name,style: textStyle(FontWeight.bold,20,Colors.white).txtStyle,),
    SizedBox(height: 5,),
    Text(item.title,style: textStyle(FontWeight.normal,12,Colors.white).txtStyle,),
    SizedBox(height: 5,)
    ,Image.asset('assets/staricons.png',height: 15,)],)
    ], ),
    ),
    Padding(
    padding: const EdgeInsets.all(25.0),
    child: Column(mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    TextField(
    controller: userName,

    autofocus: false,
    decoration: InputDecoration(
    suffixIcon: Icon(Icons.person),
    filled: true,
    fillColor: Colors.white
    ,labelText: 'Patient name'
    ,hintText: 'please enter patient name...'
    ,hintStyle: TextStyle(color:Colors.grey,
    )
    ,border: OutlineInputBorder(borderRadius:
    BorderRadius.circular(5.0),borderSide: BorderSide.none
    ,)
    )
    ),
    sizedBox(),
    Text(dateFormat.format(selected),style: textStyle(FontWeight.bold,18).txtStyle,)
    ,sizedBox(),

    DatePicker(now,
    initialSelectedDate: now,

    selectionColor: Color(0xff107163),
    onDateChange: (date)
    {
    setState(() {
    selected=date;
    print(selected);
    });
    },
    daysCount: 30,
    )
    ,sizedBox()
    , Text('Morning',style: textStyle(FontWeight.bold,18).txtStyle,)
    ,sizedBox()
    ,SizedBox(
    height: 70,
    child:GridView.count(crossAxisCount: 2,
    scrollDirection: Axis.horizontal,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    childAspectRatio: 1/3,
    children: items.map((item)
    {
      Color bg=(m==true&&selectedTime==item)?Color((0xff107163)):Colors.white;
      Color txt=(m==true&&selectedTime==item)?Colors.white:myColors.txt;
      return InkWell(
        onTap: ()
        {
          setState(() {
            m=true;
            selectedTime=item;
          });

        },
        child: Container(decoration: BoxDecoration(
            color:bg,
            borderRadius:BorderRadius.all( Radius.circular(5.0))
        ),child: Row(children: [Icon(Icons.access_alarm_rounded,color:txt,)
          ,Text(item,
                style:(TextStyle(color:txt,fontSize: 12,fontWeight: FontWeight.w400)

              ))],mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),

          width: 100,
          constraints: BoxConstraints(minWidth: 100),),
      );}).toList(),

    )
    )
    ,Text('Evening',style: textStyle(FontWeight.bold,18).txtStyle,)
    ,sizedBox()
    ,SizedBox(
    height: 70,
    child:GridView.count(crossAxisCount: 2,
    scrollDirection: Axis.horizontal,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    childAspectRatio: 1/3,
    children: items2.map((item)
    {
    Color bg=(e==true&&selectedTime==item)?Color((0xff107163)):Colors.white;
    Color txt=(e==true&&selectedTime==item)?Colors.white:myColors.txt;
    return InkWell(
    onTap: ()
    {
    setState(() {
    e=true;
    selectedTime=item;
    });

    },
    child: Container(decoration: BoxDecoration(
    color:bg,
    borderRadius:BorderRadius.all( Radius.circular(5.0))
    ),child: Row(children: [Icon(Icons.alarm,color:txt,)
    ,Text(item,
    style:(TextStyle(color:txt,fontSize: 12,fontWeight: FontWeight.w400)
    ))],mainAxisAlignment: MainAxisAlignment.spaceAround,
    ),

    width: 100,
    constraints: BoxConstraints(minWidth: 100),),
    );}).toList(),

    )
    )
    ,RaisedButton(
        color: myColors.select,
          child:
          Text('Make An Appointment',style:TextStyle(color:Colors.white)),onPressed: ()  {

      Navigator.pop(context);
      })
    ],)

    ),


    ],)
    ,Positioned(
    top: 100,
    right: 25,
    child: Container(
    decoration: new BoxDecoration(
    color: Color(0xFFFFFFFF),
    borderRadius: new BorderRadius.only(
    bottomLeft: Radius.circular(5.0),
    bottomRight: Radius.circular(5.0))),
    child: Image.asset('assets/locationicon.png',height: 50,width: 50,))
    ),

    ],
    ),
    ),
    );
    }


  }