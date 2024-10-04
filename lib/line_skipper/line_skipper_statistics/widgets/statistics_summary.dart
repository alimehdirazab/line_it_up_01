part of 'widgets.dart';

class StatisticsSummary extends StatelessWidget {
  final String title;
  final double earning;
  final double hoursWorked;
  final int orders;
  final double tip;
  final bool? dropDownFilter;

  const StatisticsSummary(
      {super.key,
      required this.title,
      required this.earning,
      required this.hoursWorked,
      required this.orders,
      required this.tip,
      this.dropDownFilter = false});

  @override
  Widget build(BuildContext context) {
    const List<CustomDropDownOption<String>> weeksList = [
      CustomDropDownOption<String>(value: 'Week1', displayOption: 'Week 1'),
      CustomDropDownOption<String>(value: 'Week2', displayOption: 'Week 2'),
      CustomDropDownOption<String>(value: 'Week3', displayOption: 'Week 3'),
      CustomDropDownOption<String>(value: 'Week4', displayOption: 'Week 4'),
    ];

    const List<CustomDropDownOption<String>> monthsList = [
      CustomDropDownOption<String>(value: 'January', displayOption: 'January'),
      CustomDropDownOption<String>(
          value: 'February', displayOption: 'February'),
      CustomDropDownOption<String>(value: 'March', displayOption: 'March'),
      CustomDropDownOption<String>(value: 'April', displayOption: 'April'),
      CustomDropDownOption<String>(value: 'May', displayOption: 'May'),
      CustomDropDownOption<String>(value: 'June', displayOption: 'June'),
      CustomDropDownOption<String>(value: 'July', displayOption: 'July'),
      CustomDropDownOption<String>(value: 'August', displayOption: 'August'),
      CustomDropDownOption<String>(
          value: 'September', displayOption: 'September'),
      CustomDropDownOption<String>(value: 'October', displayOption: 'October'),
      CustomDropDownOption<String>(
          value: 'November', displayOption: 'November'),
      CustomDropDownOption<String>(
          value: 'December', displayOption: 'December'),
    ];

    const List<CustomDropDownOption<String>> yearsList = [
      CustomDropDownOption<String>(value: '2024', displayOption: '2024'),
      CustomDropDownOption<String>(value: '2025', displayOption: '2025'),
      CustomDropDownOption<String>(value: '2026', displayOption: '2026'),
      CustomDropDownOption<String>(value: '2027', displayOption: '2027'),
      CustomDropDownOption<String>(value: '2028', displayOption: '2028'),
      CustomDropDownOption<String>(value: '2029', displayOption: '2029'),
      CustomDropDownOption<String>(value: '2030', displayOption: '2030'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(translate(context, title),
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        )),
                const SizedBox(height: 8),
                Text('\$$earning',
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )),
              ],
            ),
            if (dropDownFilter == true)
              BlocBuilder<LineSkipperStatisticsCubit,
                  LineSkipperStatisticsState>(builder: (context, state) {
                List<CustomDropDownOption<String>> currentList;
                String? defaultValue;

                // Determine which list and default value to use
                if (state.statisticsType == 1) {
                  currentList = weeksList;
                  defaultValue =
                      'Week1'; // Ensure this is a valid value in weeksList
                } else if (state.statisticsType == 2) {
                  currentList = monthsList;
                  defaultValue =
                      'January'; // Ensure this is a valid value in monthsList
                } else {
                  currentList = yearsList;
                  defaultValue =
                      '2024'; // Ensure this is a valid value in yearsList
                }

                return SizedBox(
                  width: 125,
                  height: 40,
                  child: CustomDropDown(
                    enabledBorder: const OutlineInputBorder(),
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: LineItUpColorTheme().black,
                        ),
                    value:
                        defaultValue, // Set the correct default value based on the list
                    dropdownColor: LineItUpColorTheme().white,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    options:
                        currentList, // Use the current list based on the statisticsType
                    onChanged: (value) {
                      // Handle onChange logic here
                    },
                  ),
                );
              }),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$hoursWorked hr',
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: LineItUpColorTheme().primary,
                        )),
                const SizedBox(height: 4),
                Text(translate(context, 'hours_work'),
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: LineItUpColorTheme().grey,
                        )),
              ],
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(orders.toString(),
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: LineItUpColorTheme().primary,
                        )),
                const SizedBox(height: 4),
                Text(translate(context, 'orders'),
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: LineItUpColorTheme().grey,
                        )),
              ],
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$$tip',
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: LineItUpColorTheme().primary,
                        )),
                const SizedBox(height: 4),
                Text(translate(context, 'tip'),
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: LineItUpColorTheme().grey,
                        )),
              ],
            ),
          ],
        )
      ],
    );
  }
}
