import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  Map data={};
  
  Widget build(BuildContext context) {
    data= data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgImage=data['isDayTime'] ? 'day1.jpg' : 'night.jpg';
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      // ),
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,


            )
            
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: <Widget> [
                 ElevatedButton.icon(
              onPressed: () async{
                dynamic result= await Navigator.pushNamed(context, '/location');
                if(result!=null){
                setState(() {
                  data={
                    'time':result['time'],
                    'location':result['location'],
                    'isDayTime':result['isDayTime'],
                    'flag':result['flag'],

                  };
                });
                }
              },
              icon: Icon(Icons.edit_location),
              label: Text('choose location'),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  )
            
            ],),
            SizedBox(height: 10,),
            Text(
              data['time'],
              style: TextStyle(
                    fontSize: 50,
                     color: Colors.white,
                  ),
              )
            
              ],
            ),
          ),
        )
         
      )
      
    );
  }
}





