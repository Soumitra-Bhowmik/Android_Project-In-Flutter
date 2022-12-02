import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jiffy/jiffy.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class WeatherHome extends StatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {

//   imageView(des){
//     switch (des) {
//   case 'Clear':
//     return Image(image: AssetImage("assets/normal.jpg"));
//     break;
//   case 'temp':
//    return Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtCcRikgqvityULZlYturuJ3t6HGNQVF7P5A&usqp=CAU');
//      break;
//   case 'Clouds':
//    return Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtCcRikgqvityULZlYturuJ3t6HGNQVF7P5A&usqp=CAU');
//      break;
//   default:Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtCcRikgqvityULZlYturuJ3t6HGNQVF7P5A&usqp=CAU');
//   // blabla
// }
//   }
  //condi = forecastMap!["list"][0]["weather"][0]["main"];
  @override
  void initState() {
    
    _determinePosition();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          backgroundColor: Color.fromARGB(255, 41, 175, 212),
          title: Text("Weather App",
                                  style:GoogleFonts.merriweather(textStyle:TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 254, 255),fontWeight: FontWeight.bold))),
          actions: [
            IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.location_on),
            )
          ],
        ),
        
        body: weatherMap != null
              ? Container(
                
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage('assets/iii.jpg'),fit: BoxFit.fill),
                  gradient: LinearGradient(

                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,

                    colors: [    
                    Color.fromARGB(255, 169, 211, 245),
                    Color.fromARGB(255, 123, 179, 225),
                    Color.fromARGB(255, 80, 147, 201),
                    Color.fromARGB(255, 51, 130, 194),
                    Color.fromARGB(255, 32, 99, 154),
                    Color.fromARGB(255, 16, 87, 145),
                    Color.fromARGB(255, 4, 86, 153),
                  ])
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${Jiffy(DateTime.now()).format("MMM do yy")}, ${Jiffy(DateTime.now()).format("h:mm a")}",
                                  style:GoogleFonts.merriweather(textStyle:TextStyle(fontSize: 18, color: Color.fromARGB(255, 243, 174, 174),fontWeight: FontWeight.bold))
                                ),
                                Text(
                                  "${weatherMap!["name"]}",
                                  style:GoogleFonts.merriweather(textStyle:TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold))
                                ),
                                 IconButton(onPressed: (){
                        _refreshAction();
                        //fetchWeatherData();
                      }, icon: Icon(Icons.refresh)),
                        
                              ],
                            )),
                      ),
                     
                      Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                            //   forecastMap!["list"][0]["weather"][0]["description"] == "overcast clouds"? FaIcon(FontAwesomeIcons.smog,size: 30,color: Colors.amber,)
                            // :forecastMap!["list"][0]["weather"][0]["description"] == "broken clouds"? FaIcon(FontAwesomeIcons.cloud,size: 30,color: Colors.amber,)
                            // :forecastMap!["list"][0]["weather"][0]["description"] == "clear sky"? FaIcon(FontAwesomeIcons.cloud,size: 30,color: Colors.amber,)
                            // :FaIcon(FontAwesomeIcons.cloud,size: 30,color: Colors.amber,),
                            //   Text("${forecastMap!["list"][0]["weather"][0]["description"]}"),
                            //Text("${weatherMap!["weather"][0]["description"]}"),
                              weatherMap!["weather"][0]["description"] == "clear sky" ? 
                              Container(height:100 ,width: 100 ,child: Image(image: AssetImage('assets/clear.png')))
                              :  
                              weatherMap!["weather"][0]["description"] == "broken clouds" ?   
                              Container(height: 100,width: 100,child: Image.asset('assets/clouds1.png'))
                              : 
                              weatherMap!["weather"][0]["description"] == "scattered clouds" ?
                              Container(height: 100,width: 100,child: Image.asset('assets/sca.png'))
                              :
                              weatherMap!["weather"][0]["description"] == "few clouds" ?
                              Container(height: 100,width: 100,child: Image.asset('assets/fc.png'))
                              :
                              weatherMap!["weather"][0]["description"] == "light rain" ?
                              Container(height: 100,width: 100,child: Image.asset('assets/rain1.png'))
                              :
                              weatherMap!["weather"][0]["description"] == "overcast clouds" ?
                              Container(height: 100,width: 100,child: Image.asset('assets/ccc2.png'))
                              :
                              Container(height: 100,width: 100,child: Image.asset('assets/normal.jpg'))
                              ,
                              Text(
                                "${forecastMap!["list"][0]["main"]["temp"]}°",
                                    style:GoogleFonts.merriweather(textStyle:TextStyle(fontSize: 50, color: Color.fromARGB(255, 24, 24, 24),fontWeight: FontWeight.bold))
                                  ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Feeles like ${forecastMap!["list"][0]["main"]["feels_like"]}°",
                                style:GoogleFonts.merriweather(textStyle:
                                    TextStyle(fontSize: 20, color: Color.fromARGB(255, 26, 1, 26),fontWeight: FontWeight.bold),
                              ),),
                              Text(
                                "${forecastMap!["list"][0]["weather"][0]["description"]}",
                                style:GoogleFonts.merriweather(textStyle:
                                    TextStyle(fontSize: 20, color: Color.fromARGB(255, 28, 1, 36),fontWeight: FontWeight.bold),)
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Humidity :${forecastMap!["list"][0]["main"]["humidity"]}, Pressure ${forecastMap!["list"][0]["main"]["pressure"]}",
                                style:GoogleFonts.merriweather(textStyle:
                                    TextStyle(fontSize: 18, color: Color.fromARGB(255, 8, 8, 8),fontWeight: FontWeight.bold),),
                            ),
                            Text(
                              "Sunset ${Jiffy("${DateTime.fromMillisecondsSinceEpoch(weatherMap!["sys"]["sunset"] * 1000)}").format("h:mm:a")}, Sunrise ${Jiffy("${DateTime.fromMillisecondsSinceEpoch(weatherMap!["sys"]["sunrise"] * 1000)}").format("h:mm:a")}",
                                style:GoogleFonts.merriweather(textStyle:
                                    TextStyle(fontSize: 18, color: Color.fromARGB(255, 13, 12, 12),fontWeight: FontWeight.bold),)
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 180,
                          width: double.infinity,
                          
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: forecastMap!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width:100,
                                margin: EdgeInsets.only(right: 8),
                                height: double.infinity,
                               // color: Colors.blueGrey,
                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                  image: AssetImage('assets/ccc2.png'),fit: BoxFit.fill),
                  gradient: LinearGradient(

                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,

                    colors: [    
                    Color.fromARGB(255, 95, 96, 97),
                    Color.fromARGB(255, 66, 68, 69),
                    Color.fromARGB(255, 47, 48, 49),
                    Color.fromARGB(255, 32, 33, 33),
                    Color.fromARGB(255, 20, 20, 20),
                    Color.fromARGB(255, 0, 0, 0),

                  ])
                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                       
                                        Text(
                                          "${Jiffy(forecastMap!["list"][index]["dt_txt"]).format("EEE, h:mm")}",
                                style:GoogleFonts.merriweather(textStyle:
                                    TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold),)
                                        ),
                                       /* Image.network(
                                          "https://th.bing.com/th/id/OIP.KOhzhOJQ4AHmN25RM2zFbAHaFP?pid=ImgDet&rs=1",
                                          height: 70,
                                          width: 71,
                                        ),*/
                                                            forecastMap!["list"][index]["weather"][0]["description"] == "clear sky" ? 
                                                            Container(height:50 ,width: 50,child: Image(image: AssetImage('assets/clear.png')))
                                                            :  
                                                            forecastMap!["list"][index]["weather"][0]["description"] == "modarate rain" ?   
                                                            Container(height: 100,width: 100,child: Image.asset('assets/clouds1.png'))
                                                            : 
                                                            forecastMap!["list"][index]["weather"][0]["description"] == "scattered clouds" ?
                                                            Container(height: 100,width: 100,child: Image.asset('assets/sca.png'))
                                                            :
                                                            forecastMap!["list"][index]["weather"][0]["description"] == "light rain" ?
                                                            Container(height: 100,width: 100,child: Image.asset('assets/fc.png'))
                                                            :
                                                            forecastMap!["list"][index]["weather"][0]["description"] == "heavy intensity rain" ?
                                                            Container(height: 100,width: 100,child: Image.asset('assets/rain1.png'))
                                                            :
                                                            forecastMap!["list"][index]["weather"][0]["description"] == "overcast clouds" ?
                                                            Container(height: 100,width: 100,child: Image.asset('assets/clouds1.png'))
                                                            :
                                                            Container(height: 100,width: 100,child: Image.asset('assets/normal.jpg'))
                                                            ,
                                                           
                                        Text(
                                          "${forecastMap!["list"][index]["main"]["temp_min"]}/${forecastMap!["list"][index]["main"]["temp_max"]}",
                                           style:GoogleFonts.merriweather(textStyle:
                                    TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold),)
                                        ),
                                        Text(
                                          "${forecastMap!["list"][index]["weather"][0]["description"]}",
                                           style:GoogleFonts.merriweather(textStyle:
                                    TextStyle(fontSize: 10, color: Color.fromARGB(255, 255, 255, 255),),)
                                        ),
                                      ]),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ]),
              )
              : Center(child: CircularProgressIndicator()),
      ),
    );
  }
   _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    position = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });

    fetchWeatherData();

    print("Out latitude is $latitude and longitude is $longitude");
  }

  fetchWeatherData() async {
    var weatherResponce = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&exclude=hourly%2Cdaily&appid=cc93193086a048993d938d8583ede38a&fbclid=IwAR1rg9BHqDzqxJia8bplKeuzaNLUVMWNCsfmGjp1-IHI0hpsrGe7Hnq5FMI"));
    var forecastResponce = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=cc93193086a048993d938d8583ede38a&fbclid=IwAR3Hr9_sSo-ju9Us4-W-MpsVaeQyp10SZvo84iTiJ7WjrqTNSkbxRURH5RQ"));
    setState(() {
      weatherMap = Map<String, dynamic>.from(jsonDecode(weatherResponce.body));
      forecastMap =
          Map<String, dynamic>.from(jsonDecode(forecastResponce.body));
    });
    print("Full Weather Data:${weatherResponce.body}");
  }

  Map<String, dynamic>? weatherMap;
  Map<String, dynamic>? forecastMap;

  late Position position;
  double? latitude, longitude;
  
  _refreshAction() {
  setState(() {
  var weatherResponce =  http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&exclude=hourly%2Cdaily&appid=cc93193086a048993d938d8583ede38a&fbclid=IwAR1rg9BHqDzqxJia8bplKeuzaNLUVMWNCsfmGjp1-IHI0hpsrGe7Hnq5FMI"));
  var forecastResponce =  http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=cc93193086a048993d938d8583ede38a&fbclid=IwAR3Hr9_sSo-ju9Us4-W-MpsVaeQyp10SZvo84iTiJ7WjrqTNSkbxRURH5RQ"));
  });
}

}

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
List<String> searchTerms = [
	"Sylhet",
	"Dhaka",
	"Rajshshi",
	"Dinajpur",
	"Rangpur",
	"Chittagong",
	"Mymensingh ",
	""
];
	
// first overwrite to
// clear the search text
@override
List<Widget>? buildActions(BuildContext context) {
	return [
	IconButton(
		onPressed: () {
		query = '';
		},
		icon: Icon(Icons.clear),
	),
	];
}

// second overwrite to pop out of search menu
@override
Widget? buildLeading(BuildContext context) {
	return IconButton(
	onPressed: () {
		close(context, null);
	},
	icon: Icon(Icons.arrow_back),
	);
}

// third overwrite to show query result
@override
Widget buildResults(BuildContext context) {
	List<String> matchQuery = [];
	for (var fruit in searchTerms) {
	if (fruit.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(fruit);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return ListTile(
		title: Text(result),
		);
	},
	);
}

// last overwrite to show the
// querying process at the runtime
@override
Widget buildSuggestions(BuildContext context) {
	List<String> matchQuery = [];
	for (var fruit in searchTerms) {
	if (fruit.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(fruit);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return ListTile(
		title: Text(result),
		);
	},
	);
}
}

class SwitchScreen extends StatefulWidget { 

  @override  
  SwitchClass createState() => new SwitchClass();  
}  
  
class SwitchClass extends State {  
  bool isSwitched = false;  
  var textValue = 'F';  
  
  void toggleSwitch(bool value) {  
  
    if(isSwitched == false)  
    {  
      setState(() {  
        isSwitched = true;  
        textValue = 'F';  
        
      });  
      print('Switch Button is ON');  
    }  
    else  
    {  
      setState(() {  
        isSwitched = false;  
        textValue = 'C';  
      });  
      print('Switch Button is OFF');  
    }  
  }  
  @override  
  Widget build(BuildContext context) {  
    return Column(  
        mainAxisAlignment: MainAxisAlignment.center,  
        children:[ Transform.scale(  
            scale: 1,  
            child: Switch(  
              onChanged: toggleSwitch,  
              value: isSwitched,  
              activeColor: Colors.blue,  
              activeTrackColor: Colors.yellow,  
              inactiveThumbColor: Colors.redAccent,  
              inactiveTrackColor: Colors.orange,  
            )  
          ),  
          Text('$textValue', style: TextStyle(fontSize: 15),)  
        ]);  
  }  
}  

