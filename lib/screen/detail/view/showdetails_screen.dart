import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/screen/home/model/home_model.dart';
import 'package:sky_scrapper/screen/home/provider/home_provider.dart';

class ShowDetailsScreen extends StatefulWidget {
  const ShowDetailsScreen({super.key});

  @override
  State<ShowDetailsScreen> createState() => _ShowDetailsScreenState();
}

class _ShowDetailsScreenState extends State<ShowDetailsScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;

  @override
  Widget build(BuildContext context) {
    HomeModel m1 = ModalRoute.of(context)!.settings.arguments as HomeModel;
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: providerr!.islight ? Colors.black : Colors.white,
          ),
          title: Text(
            "Manage cities",
            style: TextStyle(
              color: providerr!.islight ? Colors.black : Colors.white,
            ),
          ),
          actions: [
            Icon(
              Icons.more_vert_outlined,
              color: providerr!.islight ? Colors.black : Colors.white,
            ),
          ],
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/image/weather1.jpeg",
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "City",
                          style: TextStyle(fontSize: 25),
                        )),
                    Text(
                      "City Name = ${providerr!.homeModel!.name}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Country = ${providerr!.homeModel!.sysModel!.country}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "TimeZone = ${providerr!.homeModel!.timezone}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Details Temp : ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: MediaQuery.sizeOf(context).height * 0.12,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: Colors.grey.shade500)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Temp ",
                                style: TextStyle(fontSize: 18),
                              ),
                              const Icon(Icons.thermostat_auto,color: Colors.white,),
                              Text(
                                "${providerr!.homeModel!.mainModel!.temp} ",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Temp Min ",
                                style: TextStyle(fontSize: 18),
                              ),
                              const Icon(Icons.thermostat,color: Colors.orangeAccent,),
                              Text(
                                "${providerr!.homeModel!.mainModel!.temp_min} ",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Temp Max ",
                                style: TextStyle(fontSize: 18),
                              ),
                              const Icon(Icons.device_thermostat_sharp,color: Colors.white,),
                              Text(
                                "${providerr!.homeModel!.mainModel!.temp_max} ",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Wind : ",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: MediaQuery.sizeOf(context).height * 0.12,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: Colors.grey.shade500)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Speed ",
                                style: TextStyle(fontSize: 18),
                              ),
                              const Icon(Icons.cloud,color: Colors.orangeAccent,),
                              Text(
                                "${providerr!.homeModel!.windModel!.speed} ",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                " Deg",
                                style: TextStyle(fontSize: 18),
                              ),
                              const Icon(Icons.cloud,color: Colors.white,),
                              Text(
                                "${providerr!.homeModel!.windModel!.deg} ",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Visibility",
                                style: TextStyle(fontSize: 18),
                              ),
                              const Icon(Icons.device_thermostat_sharp,color: Colors.orangeAccent,),
                              Text(
                                "${providerr!.homeModel!.visibility} ",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.12,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: Colors.grey.shade500)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Today's Temerature",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Expect the same as yesterday",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Icon(Icons.more_horiz_outlined,color: Colors.white,),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.33,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: Colors.grey.shade500)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1/12",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Today",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.cloud,
                                  color: Colors.white,
                                ),
                                Text(
                                  "21°/11° ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1/13",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Yest",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.sunny,
                                  color: Colors.orangeAccent,
                                ),
                                Text(
                                  "19°/11° ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1/14",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Sun",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.sunny,
                                  color: Colors.orangeAccent,
                                ),
                                Text(
                                  "14°/11° ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1/15",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Mon",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.sunny,
                                  color: Colors.orangeAccent,
                                ),
                                Text(
                                  "14°/18° ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1/16",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Tue",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.sunny,
                                  color: Colors.orangeAccent,
                                ),
                                Text(
                                  "16°/28° ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1/17",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Wed",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.cloud,
                                  color: Colors.white,
                                ),
                                Text(
                                  "26°/28° ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1/18",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Thu",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.sunny,
                                  color: Colors.orangeAccent,
                                ),
                                Text(
                                  "16°/18° ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1/19",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Fri",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.sunny,
                                  color: Colors.orangeAccent,
                                ),
                                Text(
                                  "16°/12° ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
