import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:freshwater_compat_flutter/screens/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getFishData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.lightBlue,
          size: 100.0,
        ),
      ),
    );
  }

  void getFishData() async {
    var fishData =
        await rootBundle.loadString('assets/family_comparison_freshwater.json');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        fishData: fishData,
      );
    }));
  }
}
