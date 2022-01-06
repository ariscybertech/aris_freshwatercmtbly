import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freshwater_compat_flutter/components/rounded_button.dart';
import 'package:freshwater_compat_flutter/screens/fish_select_screen.dart';
import 'package:freshwater_compat_flutter/utilities/constants.dart';
import 'package:freshwater_compat_flutter/utilities/fish_comparator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.fishData});

  final fishData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var fishAvailableList = <String>[];
  var compData = <dynamic>[];
  FishComparator fishComparator;

  var addedFish = <String>[];
  var detailedResults = <String>[];
  String topLevelResult = 'Start by adding a fish';
  String imagePath = 'images/fish_tank_empty.png';

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    parseFishData();
    fishComparator = FishComparator(compData, fishAvailableList.length);
  }

  void parseFishData() {
    Map<String, dynamic> decodedData = jsonDecode(widget.fishData);
    compData = decodedData["data"];

    for (int i = 0; i < compData.length; i++) {
      fishAvailableList.add(compData[i]['Comparison_Fish']);
    }
  }

  void determineResult() {
    List<String> results = fishComparator.compareFish(addedFish);
    detailedResults = fishComparator.detailedResults;

    setState(() {
      if (results.contains('no')) {
        imagePath = 'images/fish_tank_bad.png';
        topLevelResult = 'Not Compatible';
      } else if (results.contains('warn')) {
        imagePath = 'images/fish_tank_warn.png';
        topLevelResult = 'Use Caution';
      } else if (results.contains('yes')) {
        imagePath = 'images/fish_tank_good.png';
        topLevelResult = 'Generally Compatible';
      } else {
        imagePath = 'images/fish_tank_empty.png';
        topLevelResult = 'Add another fish!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Freshwater Compatibility'),
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return Future.value(false);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Image(
                image: AssetImage('$imagePath'),
              ),
            ),
            Center(
              child: Text(
                '$topLevelResult',
                style: kResultTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: detailedResults.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 40,
                    child: Center(
                        child: Text(
                      '${detailedResults[index].replaceAll('_', ' ')}',
                      textAlign: TextAlign.center,
                    )),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundedButton(
                  color: Colors.lightBlue,
                  title: 'Add Fish',
                  onPressed: () async {
                    var fishToAdd = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FishSelectScreen(
                                  fish: fishAvailableList,
                                )));

                    if (fishToAdd != null) {
                      print('added: ' + fishToAdd);
                      addedFish.add(fishToAdd);
                      print(addedFish);

                      //compareFish();
                      determineResult();
                    }
                  },
                ),
                RoundedButton(
                  color: Colors.lightBlue,
                  title: 'Clear Tank',
                  onPressed: () {
                    setState(() {
                      addedFish.clear();
                      fishComparator.detailedResults.clear();
                      topLevelResult = 'Tank cleared, add a fish to continue!';
                      imagePath = 'images/fish_tank_empty.png';
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
