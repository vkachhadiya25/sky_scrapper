import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/screen/home/provider/home_provider.dart';
import 'package:sky_scrapper/utils/check_internet.dart';
import 'package:sky_scrapper/utils/share_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;
  TextEditingController txtCityName = TextEditingController();
  NetworkConnection networkConnection=NetworkConnection();

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getWeatherAPI();
    networkConnection.checkConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
          actions: [
            const Icon(Icons.settings),
            Consumer<HomeProvider>(
              builder: (context, value1, child) => Switch(
                value: providerr!.islight,
                onChanged: (value) {
                  ShareHelper shr = ShareHelper();
                  shr.setTheme(value);
                  providerr!.changeTheme();
                },
              ),
            ),
          ],
        ),
        drawer: const Drawer(),
        body: providerw!.isOnline?providerw!.homeModel == null
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Image.asset("assets/image/weather.jpeg",
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.cover),
                   SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                           SizedBox(
                             height : 40,
                             child: SearchBar(
                              leading: const Icon(Icons.search),
                              hintText: "Search city Name",
                              trailing: const [Icon(Icons.cancel)],
                              onSubmitted: (value){
                                providerr!.city(value.toLowerCase());
                                providerr!.getWeatherAPI();
                              },
                                                       ),
                           ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${providerr!.homeModel!.name}",
                                  style: TextStyle(
                                      color: providerr!.islight
                                          ? Colors.black
                                          : Colors.black,
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'details',
                                          arguments: providerw!.homeModel);
                                    },
                                    icon: const Icon(
                                      Icons.note_add_outlined,
                                      color: Colors.black,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${providerw!.homeModel!.cloudModel!.all} °C",
                                style: TextStyle(
                                  fontSize: 45,
                                  color: providerr!.islight
                                      ? Colors.black
                                      : Colors.black,
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sunny 18 °C/31 °C Air quantity : 92 - satisfactory",
                            style: TextStyle(
                              fontSize: 16,
                              color: providerr!.islight
                                  ? Colors.black
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: MediaQuery.sizeOf(context).height * 0.06,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(width: 2, color: Colors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: providerr!.islight
                                        ? Colors.black
                                        : Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Very few pollen count",
                                    style: TextStyle(
                                        color: providerr!.islight
                                            ? Colors.black
                                            : Colors.black,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: MediaQuery.sizeOf(context).height * 0.13,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(width: 2, color: Colors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    const SizedBox(width: 10),
                                    Column(
                                      children: [
                                        Text(
                                          "Nov",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: providerr!.islight
                                                ? Colors.black
                                                : Colors.black,
                                          ),
                                        ),
                                        Icon(
                                          Icons.cloud,
                                          color: providerr!.islight
                                              ? Colors.orangeAccent
                                              : Colors.orangeAccent,
                                        ),
                                        Text(
                                          "4°",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: providerr!.islight
                                                ? Colors.black
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Nov",
                                          style: TextStyle(color: providerr!.islight? Colors.black:Colors.black,fontSize: 18),
                                        ),
                                        Icon(Icons.cloud,color: providerr!.islight? Colors.white:Colors.white,),
                                        Text(
                                          "5°",
                                          style: TextStyle(color: providerr!.islight? Colors.black:Colors.black,fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Nov",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                        Icon(Icons.cloud,color: providerr!.islight? Colors.orangeAccent:Colors.orangeAccent,),
                                        Text(
                                          "6°",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Nov",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                        Icon(Icons.cloud,color: providerr!.islight? Colors.white:Colors.white,),
                                        Text(
                                          "7°",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Nov",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                        Icon(Icons.cloud,color: providerr!.islight? Colors.orangeAccent:Colors.orangeAccent,),
                                        Text(
                                          "4°",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "12:00",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                        Icon(Icons.sunny,color: providerr!.islight? Colors.white:Colors.white,),
                                        Text(
                                          "2°",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width:
                                      12,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "1:00",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                        Icon(Icons.sunny,color: providerr!.islight? Colors.orangeAccent:Colors.orangeAccent,),
                                        Text(
                                          "4°",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "1:00",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                        Icon(Icons.sunny,color: providerr!.islight? Colors.orangeAccent:Colors.orangeAccent,),
                                        Text(
                                          "4°",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "1:00",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                        Icon(Icons.sunny,color: providerr!.islight? Colors.white:Colors.white,),
                                        Text(
                                          "4°",
                                          style: TextStyle(fontSize: 18,color: providerr!.islight? Colors.black:Colors.black,),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.10,
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          width: 2, color: Colors.grey)),
                                  child: Column(
                                    children: [
                                       Text(
                                        "Lat =",
                                        style: TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                      ),
                                      Text(
                                        "${providerw!.homeModel!.coordModel!.lat}",
                                        style:  TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.10,
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          width: 2, color: Colors.grey)),
                                  child: Column(
                                    children: [
                                       Text(
                                        "Lon =",
                                        style: TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                      ),
                                      Text(
                                        "${providerw!.homeModel!.coordModel!.lon}",
                                        style:  TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: MediaQuery.sizeOf(context).height * 0.10,
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border:
                                        Border.all(width: 2, color: Colors.grey)),
                                child: Column(
                                  children: [
                                     Text(
                                      "All Clouds =",
                                      style: TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                    ),
                                    Text(
                                      "${providerw!.homeModel!.cloudModel!.all}",
                                      style:  TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.sizeOf(context).height * 0.10,
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border:
                                        Border.all(width: 2, color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                           Text(
                                            "Wind Speed =",
                                            style: TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                          ),
                                          Text(
                                            "${providerw!.homeModel!.windModel!.speed}",
                                            style:  TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                           Text(
                                            "Wind Speed =",
                                            style: TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                          ),
                                          Text(
                                            "${providerw!.homeModel!.windModel!.deg}",
                                            style:  TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: MediaQuery.sizeOf(context).height * 0.07,
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(width: 2, color: Colors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                   Text(
                                    "Timezone =",
                                    style: TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                  ),
                                  Text(
                                    "${providerw!.homeModel!.timezone}",
                                    style:  TextStyle(fontSize: 20,color: providerr!.islight? Colors.black:Colors.black,),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ):Center(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Image(
                  image: AssetImage("assets/image/network.png"),
                  fit: BoxFit.cover),
            )),
      ),
    );
  }
}

