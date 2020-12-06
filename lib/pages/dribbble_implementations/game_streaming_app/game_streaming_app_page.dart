import 'package:flutter/material.dart';

class GameStreamingApp extends StatefulWidget {
  GameStreamingApp({Key key}) : super(key: key);

  @override
  _GameStreamingAppState createState() => _GameStreamingAppState();
}

class _GameStreamingAppState extends State<GameStreamingApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(children: [
            _buildHeaderBar(),
            SizedBox(height: 70.0),
            _buildHeaderText(),
          ]),
        ),
      ),
    );
  }

  /* START HEADER BAR */
  Widget _buildHeaderBar() {
    double containerSize = 55.0;

    return Row(
      children: [
        _buildLeadingHeaderButton(containerSize),
        Spacer(),
        _buildTrailingHeaderButton(containerSize),
      ],
    );
  }

  Widget _buildLeadingHeaderButton(double containerSize) {
    double containerPadding = 13.0;
    double circleIconSize = 8.0;
    Radius borderRadius = Radius.circular(15.0);
    return InkWell(
      child: Container(
        width: containerSize,
        height: containerSize,
        padding: EdgeInsets.all(containerPadding),
        decoration: BoxDecoration(
          color: const Color(0xffe6e3f5),
          borderRadius: BorderRadius.only(topLeft: borderRadius, topRight: borderRadius, bottomRight: borderRadius),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(4, (index) => Icon(Icons.circle, size: circleIconSize)),
        ),
      ),
    );
  }

  Widget _buildTrailingHeaderButton(double containerSize) {
    Radius borderRadius = Radius.circular(15.0);
    return InkWell(
      child: Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: const Color(0xffc9e088),
            borderRadius:
                BorderRadius.only(bottomLeft: borderRadius, topRight: borderRadius, bottomRight: borderRadius),
          ),
          child: Image(image: AssetImage('assets/images/dribbble_game_streaming_app.png'))),
    );
  }

  /* END HEADER BAR */

  /* START HEADER TEXT */
  Widget _buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('What would', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
        Text('you like to Play?', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w300)),
      ],
    );
  }
}
