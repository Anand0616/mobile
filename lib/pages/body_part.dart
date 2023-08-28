import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';

class Body extends StatelessWidget {
  Body({super.key, required this.title, required this.storedEmail});
  final String title;
  final String storedEmail;

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/news_1.jpg',
      'assets/images/news_2.jpg',
      'assets/images/news_3.jpg',
    ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 800.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                    height: 400,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8),
                items: imageSliders,
              ),
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: (2.5 / 2.9),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
                child: LineChart(
                  LineChartData(
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: 6,
                      titlesData: const FlTitlesData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                            spots: [
                              FlSpot(0, 3),
                              FlSpot(1, 1),
                              FlSpot(1.2, 4.1),
                              FlSpot(2.6, 1.3),
                              FlSpot(3.2, 2.8),
                              FlSpot(4, 3),
                              FlSpot(4.6, 2.5),
                              FlSpot(5.1, 5),
                              FlSpot(6, 3.4),
                              FlSpot(7, 5.2),
                            ],
                            isCurved: true,
                            barWidth: 5,
                            dotData: const FlDotData(show: false),
                            gradient: LinearGradient(colors: gradientColors),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                  colors: gradientColors
                                      .map((e) => e.withOpacity(0.3))
                                      .toList()),
                            ))
                      ]),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: InkWell(
                onTap: () {
                  // Navigator.pop(context);
                },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/back_2.jpg'))),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: InkWell(
                onTap: () {
                  // Navigator.pop(context);
                },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/back_3.jpg'))),
                  ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}