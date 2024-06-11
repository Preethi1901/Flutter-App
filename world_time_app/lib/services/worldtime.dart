import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class WorldTime{
 String location;
 String time='';
 String url_api;   // url for api end point
 String flag; // for flag image icon
 bool? isDayTime;


WorldTime({required this.location,required this.flag,required this.url_api, this.isDayTime});


 Future<void> getTime() async {
  try{
  final Uri url = Uri.parse('https://worldtimeapi.org/api/timezone/$url_api');
  http.Response response = await http.get(url);
  Map data = jsonDecode(response.body);
 // print(data);

  String datetime=data['datetime'];
  String offset=data['utc_offset'].substring(0,3);

  
  DateTime now=DateTime.parse(datetime);        //convert string into datetime object
  now= now.add(Duration(hours: int.parse(offset)));
  isDayTime= now.hour>6 && now.hour<20 ? true:false;
  //time=now.toString();                             //convert datetime object to string  (useful if we made any operations on datetime object(now) like now.add(--))
  time=DateFormat.jm().format(now);
   print(datetime);
   print(offset);
   print(data['utc_offset']);
   
   print(now);
  // print(time);
  
}

catch(e){
  print('caught error:$e');
 time='could not get time'; 
}


 }

}