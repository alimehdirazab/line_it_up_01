part of 'view.dart';

class LineSkipperDailyStatisticsPage extends StatelessWidget {
  const LineSkipperDailyStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperDailyStatisticsView();
  }
}

class LineSkipperDailyStatisticsView extends StatelessWidget {
  const LineSkipperDailyStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the total orders (this should come from your data)
    int totalOrders = 20;
    int totalHoursWorked = 12; // Dynamically adjust hours worked

    // Calculate mid point
    int midPoint = (totalOrders / 2).round();

    List<int> randomData = [
      1,
      16,
      3,
      4,
      0,
      0,
      2,
      0,
      11,
      17,
      2,
      0
    ]; // Example data for 12 hours

    // X-axis labels for hours
    Widget bottomTitles(double value, TitleMeta meta) {
      const style = TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
      String text = '${(value + 1).toInt()}h'; // Dynamically generate hours
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(text, style: style),
      );
    }

    // Y-axis labels for the right side
    Widget rightTitles(double value, TitleMeta meta) {
      String text;
      if (value == 0) {
        text = '0'; // Ensure '0' is displayed
      } else if (value == 1) {
        text = '1';
      } else if (value == midPoint.toDouble()) {
        text = midPoint.toString();
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
      return List.generate(totalHoursWorked, (index) {
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
            title: 'daily_earnings',
            earning: 100.78,
            hoursWorked: 12,
            orders: 20,
            tip: 10,
          ),
          const SizedBox(height: 42),
          // Wrap the BarChart with a SizedBox to control the size
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
                      showTitles: false, // Hide left side values
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40, // Space for Y-axis values on the right
                      getTitlesWidget: rightTitles,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    // Ensure we draw the 0, midPoint (dashed), and totalOrders lines
                    if (value == 0) {
                      return FlLine(
                        strokeWidth: 1,
                        color: LineItUpColorTheme().grey30,
                      );
                    } else if (value == midPoint.toDouble()) {
                      return const FlLine(
                        strokeWidth: 1,
                        color: Colors.grey,
                        dashArray: [5, 5],
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
                        value == midPoint ||
                        value == totalOrders;
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                groupsSpace: 20, // Space between bars
                barGroups: getData(), // Use generated data for hours
                minY: 0, // Ensure the first horizontal line is at 0
                maxY: totalOrders.toDouble() +
                    0.01, // Adjust maxY slightly to ensure the last line shows
              ),
            ),
          ),
        ],
      ),
    );
  }
}
