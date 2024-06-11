import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  
  
  @override
  Widget build(BuildContext context) {

    List<WorldTime>  locations=[
    
    WorldTime(url_api: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url_api: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url_api: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url_api: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url_api: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),

    ];
    
    void updateTime(index) async {
      WorldTime instance=locations[index];
      await instance.getTime();
      print(locations[index].location);
      
      Navigator.pop(context,{
        'location':instance.location,
        'flag':instance.flag,
        'time':instance.time,
        'isDayTime':instance.isDayTime,

      });
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:Text('choose location'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child:ListTile(
              onTap: (){
                 updateTime(index);
              },
              title:Text( locations[index].location),
               leading: CircleAvatar(
                backgroundImage:AssetImage('assets/${locations[index].flag}') ,
                ),
             
              ),
          );
        }
      )
    );
  }
}