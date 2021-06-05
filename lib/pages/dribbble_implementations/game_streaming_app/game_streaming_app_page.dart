import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GameStreamingApp extends StatefulWidget {
  GameStreamingApp({Key key}) : super(key: key);

  @override
  _GameStreamingAppState createState() => _GameStreamingAppState();
}

class _GameStreamingAppState extends State<GameStreamingApp> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, keepPage: true, viewportFraction: 0.43);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 30.0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: _buildHeaderBarWidget(),
            ),
            SizedBox(height: 70.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: _buildHeaderTextWidget(),
            ),
            SizedBox(height: 35.0),
            _buildGameListWidget(),
            SizedBox(height: 35.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: _buildLiveChannelList(),
            ),
          ]),
        ),
      ),
    );
  }

  /* START HEADER BAR WIDGET */
  Widget _buildHeaderBarWidget() {
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
          borderRadius: BorderRadius.only(bottomLeft: borderRadius, topRight: borderRadius, bottomRight: borderRadius),
        ),
        child: Image(image: AssetImage('assets/images/dribbble_game_streaming_app.png')),
      ),
    );
  }

  /* END HEADER BAR WIDGET */

  /* START HEADER TEXT WIDGET */
  Widget _buildHeaderTextWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('What would', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
        Text('you like to Play?', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w300)),
      ],
    );
  }

  /* END HEADER TEXT WIDGET */

  /* START GAMES LIST WIDGET */
  Widget _buildGameListWidget() {
    List<Map<String, dynamic>> games = [
      {'name': 'Puzzle', 'color': Color(0xffcdfffe), 'imagePath': 'assets/images/power_teal.png'},
      {'name': 'Racing', 'color': Color(0xffeee9ff), 'imagePath': 'assets/images/power_teal.png'},
      {'name': 'FPS', 'color': Color(0xfffef2fb), 'imagePath': 'assets/images/power_teal.png'},
      {'name': 'FPS', 'color': Color(0xfffef2fb), 'imagePath': 'assets/images/power_teal.png'},
      {'name': 'FPS', 'color': Color(0xfffef2fb), 'imagePath': 'assets/images/power_teal.png'},
      {'name': 'FPS', 'color': Color(0xfffef2fb), 'imagePath': 'assets/images/power_teal.png'},
      {'name': 'FPS', 'color': Color(0xfffef2fb), 'imagePath': 'assets/images/power_teal.png'},
      {'name': 'FPS', 'color': Color(0xfffef2fb), 'imagePath': 'assets/images/power_teal.png'},
      {'name': 'FPS', 'color': Color(0xfffef2fb), 'imagePath': 'assets/images/power_teal.png'},
    ];

    return Carousel(
      height: 210,
      items: games,
      builderFunction: (context, item) {
        return _buildGameCard(item);
      },
    );

    // return SizedBox(
    //   height: 220.0,
    //   child: PageView(
    //     controller: pageController,
    //     children: games.map((game) => _buildGameCard(game)).toList(),
    //   ),
    // );
  }

  Widget _buildGameCard(Map<String, dynamic> game) {
    return Container(
      width: 170.0,
      child: Card(
        color: game['color'],
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Image.asset(game['imagePath'], height: 60.0),
            SizedBox(height: 8),
            Expanded(
                child: Text(
              game['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
  /* END GAMES LIST WIDGET */

  /* START LIVE CHANNEL LIST WIDGET */
  Widget _buildLiveChannelList() {
    List<Map<String, dynamic>> liveChannels = [
      {'name': 'Jungmin123', 'viewCount': '89.4K', 'loves': '12k'},
      {'name': 'PetStory234', 'viewCount': '2309', 'loves': '237'},
      {'name': 'FamBrosStream', 'viewCount': '89.4K', 'loves': '12k'},
      {'name': 'FamBrosStream', 'viewCount': '89.4K', 'loves': '12k'},
      {'name': 'FamBrosStream', 'viewCount': '89.4K', 'loves': '12k'},
      {'name': 'FamBrosStream', 'viewCount': '89.4K', 'loves': '12k'},
      {'name': 'FamBrosStream', 'viewCount': '89.4K', 'loves': '12k'},
      {'name': 'FamBrosStream', 'viewCount': '89.4K', 'loves': '12k'},
    ];

    return Container(
      child: Column(
        children: liveChannels.map((channel) => _buildLiveChannelRow(channel)).toList(),
      ),
    );
  }

  Widget _buildLiveChannelRow(Map<String, dynamic> liveChannel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          _buildTrailingHeaderButton(55.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text(liveChannel['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
                      SizedBox(width: 20.0),
                      Container(
                        width: 45.0,
                        height: 18.0,
                        decoration: BoxDecoration(
                          color: const Color(0xffff5cac),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(children: [
                          SizedBox(width: 11),
                          Text('LIVE',
                              style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w600, color: Colors.white)),
                        ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.0),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: const Color(0xffebeafe),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.public,
                              size: 14.0,
                              color: Color(0xff9b91fb),
                            ),
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            '${liveChannel["viewCount"]} Views',
                            style: TextStyle(color: Color(0xffa19fa8), fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.0),
                      Row(
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: const Color(0xfffdb3d2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(Icons.favorite, size: 14.0, color: Colors.white),
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            '${liveChannel["loves"]} Loves',
                            style: TextStyle(color: Color(0xffa19fa8), fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  /* END LIVE CHANNEL LIST WIDGET */
}

class Carousel extends StatelessWidget {
  Carousel({
    Key key,
    @required this.items,
    @required this.builderFunction,
    @required this.height,
    this.dividerIndent = 10,
  }) : super(key: key);

  final List<dynamic> items;
  final double dividerIndent;

  final Function(BuildContext context, dynamic item) builderFunction;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView.separated(
          physics: PageScrollPhysics(),
          separatorBuilder: (context, index) => Divider(
                indent: dividerIndent,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            Widget item = builderFunction(context, items[index]);
            if (index == 0) {
              return Padding(
                child: item,
                padding: EdgeInsets.only(left: dividerIndent),
              );
            } else if (index == items.length - 1) {
              return Padding(
                child: item,
                padding: EdgeInsets.only(right: dividerIndent),
              );
            }
            return item;
          }),
    );
  }
}
