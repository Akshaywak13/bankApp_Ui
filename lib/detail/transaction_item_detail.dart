import 'package:bank_app_ui/detail/statistics_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TransactionItemDetails extends StatefulWidget {
  const TransactionItemDetails({super.key});

  @override
  State<TransactionItemDetails> createState() => _TransactionItemDetailsState();
}

class _TransactionItemDetailsState extends State<TransactionItemDetails> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          sliderMenu(),
          const SizedBox(
            height: 40,
          ),
          totalIncomeExpanse(),
           const SizedBox(
            height: 40,
          ),
          totalLineCharts(),

          const StatisticsData(),
          
        ],
      )),
    );
  }

  SizedBox totalLineCharts() {
    return SizedBox(
          height: 240,
          child: LineChart(
            LineChartData(
              lineTouchData: const LineTouchData(enabled: false),
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const style =
                          TextStyle(color: Colors.white60, fontSize: 15);
                      Widget text;
                      switch (value.toInt()) {
                        case 1:
                          text = const Text('Mon', style: style);
                          break;
                        case 2:
                          text = const Text('Thu', style: style);
                          break;
                          case 3:
                          text = const Text('Wed', style: style);
                          break;
                          case 4:
                          text = const Text('Thr', style: style);
                          break;
                          case 5:
                          text = const Text('Fri', style: style);
                          break;
                          case 6:
                          text = const Text('Sat', style: style);
                          break;
                          case 7:
                          text = const Text('Sun', style: style);
                          break;
                          default: text = const Text(" ");
                      }
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 10,
                        child: text,
                      );
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  curveSmoothness: 0.4,
                  color: Colors.cyanAccent,
                  barWidth: 6,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                  spots: [
                    // x y
                    const FlSpot(1, 3),
                    const FlSpot(2, 1),
                    const FlSpot(3, 5),
                    const FlSpot(4, 2),
                    const FlSpot(5, 5),
                    const FlSpot(6, 6),
                    const FlSpot(7, 9),
                  ],
                ),
              ],
              maxX: 8,
              maxY: 10,
              minX: 0,
              minY: 0,
            ),
          ),
        );
  }

  Padding totalIncomeExpanse() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Total Income",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white60),
              ),
              Text(
                "\$2,500",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 45,
            child: VerticalDivider(
              color: Colors.white54,
            ),
          ),
          Column(
            children: [
              Text(
                "Total Income",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white60),
              ),
              Text(
                "\$2,500",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  CarouselSlider sliderMenu() {
    return CarouselSlider(
      items: [
        carouselItems(
            index: 0, color: Colors.blueAccent, icon: Icons.flight_takeoff),
        carouselItems(index: 1, color: Colors.orange, icon: Icons.fastfood),
        carouselItems(index: 2, color: Colors.red, icon: Icons.menu_outlined),
      ],
      options: CarouselOptions(
        autoPlay: false,
        height: 100,
        enlargeCenterPage: true,
        viewportFraction: 0.3,
        initialPage: currentIndex,
        onPageChanged: (index, reason) {
          currentIndex = index;
        },
      ),
    );
  }

  Container carouselItems({
    required int index,
    required Color color,
    required IconData icon,
  }) {
    Color backgroundColor = index == currentIndex ? color : Colors.transparent;
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white54,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
        ),
        child: Icon(
          icon,
          color: backgroundColor == color ? Colors.white : color,
          size: 35,
        ),
      ),
    );
  }
}


