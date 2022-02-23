import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; //location name for the ui
  late String time; //the time in that location
  late String flag; //url to an asset flag icon
  late String url; //location url for api endpoint
  late bool isDayTime; //true or false if daytime or not
  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getTime() async {
    // Uri uri = Uri.https("jsonplaceholder.typicode.com", "/todos/1");
    // Response response = await get(uri);
    // Map data=jsonDecode(response.body);
    // print(data);
    // print(data['title']);
    // make the Reuqest
    try {
      Uri uri = Uri.https('worldtimeapi.org', '/api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // print(datetime);
      print(offset);
//create dateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (err) {
      print('caught error : $err');
      time = 'could not get time data';
    }
  }
}
