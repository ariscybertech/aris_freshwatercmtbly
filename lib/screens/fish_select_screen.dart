import 'package:flutter/material.dart';
import 'package:freshwater_compat_flutter/components/rounded_button.dart';
import 'package:freshwater_compat_flutter/utilities/constants.dart';

class FishSelectScreen extends StatefulWidget {
  FishSelectScreen({@required this.fish});

  final fish;

  @override
  _FishSelectScreenState createState() => _FishSelectScreenState();
}

class _FishSelectScreenState extends State<FishSelectScreen> {
  List<String> fishList;

  @override
  void initState() {
    super.initState();
    fishList = widget.fish;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Fish'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: fishList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context, fishList[index]);
                  },
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        '${fishList[index].replaceAll('_', ' ')}',
                        style: kListTextStyle,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RoundedButton(
              color: Colors.lightBlue,
              title: 'Clear Tank',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
