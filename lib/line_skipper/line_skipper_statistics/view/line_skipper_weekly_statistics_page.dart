part of 'view.dart';

class LineSkipperWeeklyStatisticsPage extends StatelessWidget {
  const LineSkipperWeeklyStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperWeeklyStatisticsView();
  }
}

class LineSkipperWeeklyStatisticsView extends StatelessWidget {
  const LineSkipperWeeklyStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the total orders (this should come from your data)
    int totalOrders = 20;
    int week = 7; // Number of days in the week

    // Calculate mid point
    int midPoint = (totalOrders / 2).round();

    List<int> randomData = [
      1,
      2,
      3,
      4,
      2,
      0,
      11,
    ]; // Example data for each day of the week

    // X-axis labels for days of the week
    Widget bottomTitles(double value, TitleMeta meta) {
      const style = TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
      List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

      if (value >= 0 && value < days.length) {
        return SideTitleWidget(
          axisSide: meta.axisSide,
          child: Text(days[value.toInt()], style: style),
        );
      }
      return const SizedBox();
    }

    // Y-axis labels for the right side
    Widget rightTitles(double value, TitleMeta meta) {
      String text;
      if (value == 0) {
        text = '0'; // Ensure '0' is displayed
      } else if (value == 1) {
        text = '1';
      } else if (value == midPoint.toDouble()) {
        text = midPoint.toString(); // Show midPoint value
      } else if (value == totalOrders.toDouble()) {
        text = totalOrders.toString();
      } else {
        return const SizedBox();
      }
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(
          text,
          style: const TextStyle(fontSize: 10),
        ),
      );
    }

    // Bar data for the number of hours worked
    List<BarChartGroupData> getData() {
      return List.generate(week, (index) {
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(0),
              toY: randomData[index].toDouble(),
              width: 8,
              color: LineItUpColorTheme().primary,
            ),
          ],
        );
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatisticsSummary(
            title: 'weekly_earnings',
            earning: 100.78,
            hoursWorked: 70,
            orders: 20,
            tip: 46,
            dropDownFilter: true,
          ),
          const SizedBox(height: 42),
          SizedBox(
            height: 150,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: rightTitles,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                // Ensure mid-point line is drawn correctly
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    if (value == 0) {
                      return FlLine(
                        strokeWidth: 1,
                        color: LineItUpColorTheme().grey30,
                      );
                    } else if (value == midPoint.toDouble()) {
                      // Mid-point line
                      return FlLine(
                        strokeWidth: 2, // Increased stroke width
                        color: LineItUpColorTheme().grey30,
                        dashArray: [5, 10], // Dashed line
                      );
                    } else if (value == totalOrders.toDouble()) {
                      return FlLine(
                        strokeWidth: 1,
                        color: LineItUpColorTheme().grey30,
                      );
                    }
                    return const FlLine(strokeWidth: 0); // Hide other lines
                  },
                  checkToShowHorizontalLine: (value) {
                    return value == 0 ||
                        value ==
                            midPoint
                                .toDouble() || // Ensure mid-point is checked
                        value == totalOrders.toDouble();
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                groupsSpace: 40,
                barGroups: getData(),
                minY: 0,
                maxY: (totalOrders.toDouble() + 5), // Adjust maxY
              ),
            ),
          ),
        ],
      ),
    );
  }
}
