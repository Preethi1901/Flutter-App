import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtimeapp/services/worldtime.dart';


class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {


String time='loading';
void setTime() async{
  WorldTime instance=WorldTime(location: 'Chicago', flag: 'london.png', url_api: 'America/Chicago');
  await instance.getTime();

  Navigator.pushReplacementNamed(context,'/home',arguments: {
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDayTime':instance.isDayTime,

  });

  print(instance.time);
  setState(() {
      time=instance.time;
    });
}



@override
  void initState() {
    print('hello');
    super.initState();
    setTime();
    
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SpinKitRotatingCircle(
              color: Colors.white,
            size: 50.0,
),
      )

    );
  }
}




