import 'package:flutter/material.dart';
import 'package:worldt_ime/services/world_time.dart';
import 'package:worldt_ime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locagions = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locagions[index];
    await instance.getTime();
    //  navigate home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDayTime
    });
  }

  // int counter = 0;
//   void getData() async {
// //simulate network request for a username
//     String uname = await Future.delayed(Duration(seconds: 3), () {
//       return 'Can';
//     });
// //simulate network request to get bio of the username
//     String bio = await Future.delayed(Duration(seconds: 2), () {
//       return 'vegan,musician & egg collector';
//     });
//
//     print('$uname - $bio');
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//     print('Hey there!');
//     // print('initState Function ran');
//   }

  @override
  Widget build(BuildContext context) {
    // print('build Function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locagions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  // print(locagions[index].location);
                  updateTime(index);
                },
                title: Text(locagions[index].location),
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locagions[index].flag}')),
              ),
            ),
          );
        },
      ),
      // body: ElevatedButton(
      //   onPressed: () {
      //     setState(() {
      //       counter += 1;
      //     });
      //   },
      //   child: Text('counter is $counter'),
      // ),
    );
  }
}
