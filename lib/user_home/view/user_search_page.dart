part of 'view.dart';

class UserSearchPage extends StatelessWidget {
  const UserSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserSearchView();
  }
}

class UserSearchView extends StatelessWidget {
  const UserSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: CustomTextField(
              hintText: translate(context, 'search_mart_product_foods'),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: LineItUpColorTheme().grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: LineItUpColorTheme().grey)),
              prefixIcon: IconButton(
                onPressed: () {
                  context.popPage();
                },
                icon: Icon(LineItUpIcons().backArrow),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translate(context, 'recent_searches'),
                    style: LineItUpTextTheme()
                        .body
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        LineItUpIcons().timer,
                        color: LineItUpColorTheme().black,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Fast Food',
                        style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        LineItUpIcons().timer,
                        color: LineItUpColorTheme().black,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Grocery',
                        style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        LineItUpIcons().timer,
                        color: LineItUpColorTheme().black,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Pizza',
                        style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        LineItUpIcons().timer,
                        color: LineItUpColorTheme().black,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Bakery',
                        style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        LineItUpIcons().timer,
                        color: LineItUpColorTheme().black,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Food for Health',
                        style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    translate(context, 'recommended_for_you'),
                    style: LineItUpTextTheme()
                        .body
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        LineItUpIcons().timer,
                        color: LineItUpColorTheme().black,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Coffee',
                        style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        LineItUpIcons().timer,
                        color: LineItUpColorTheme().black,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Redbull',
                        style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        LineItUpIcons().timer,
                        color: LineItUpColorTheme().black,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Chicken Wings',
                        style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        LineItUpIcons().timer,
                        color: LineItUpColorTheme().black,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Beef Burger',
                        style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        LineItUpIcons().timer,
                        color: LineItUpColorTheme().black,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Frozen Food',
                        style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
