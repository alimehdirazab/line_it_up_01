part of 'view.dart';

class LineSkipperPage extends StatelessWidget {
  const LineSkipperPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure that BlocProvider is provided for the entire LineSkipperView
    return BlocProvider(
      create: (context) => LineSkipperCubit(),
      child: const LineSkipperView(),
    );
  }
}

class LineSkipperView extends StatelessWidget {
  const LineSkipperView({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocBuilder can now access the LineSkipperCubit
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(context, 'line_skipper'),
          style: LineItUpTextTheme().body,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: context.mWidth * 0.04),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushPage(const UserAddToCartPage());
                    },
                    child: Badge(
                      label: Text(
                        '2',
                        style: LineItUpTextTheme().body.copyWith(
                            color: LineItUpColorTheme().white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      backgroundColor: LineItUpColorTheme().primary,
                      child: Icon(
                        LineItUpIcons().cart1,
                        color: LineItUpColorTheme().black,
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      context.pushPage(const NotificationPage());
                    },
                    child: Badge(
                      label: Text(
                        '1',
                        style: LineItUpTextTheme().body.copyWith(
                            color: LineItUpColorTheme().white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      backgroundColor: LineItUpColorTheme().primary,
                      child: Icon(
                        LineItUpIcons().notification,
                        color: LineItUpColorTheme().black,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 12),
        child: Column(
          children: [
            CustomTextField(
              hintText: translate(context, 'search_for_line_skipper'),
              prefixIcon: Icon(
                LineItUpIcons().search,
                color: LineItUpColorTheme().grey,
                size: 24,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: LineItUpColorTheme().grey.withOpacity(0.5),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: LineItUpColorTheme().grey.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<LineSkipperCubit, LineSkipperState>(
                      buildWhen: (previous, current) =>
                          previous.selectedCategory != current.selectedCategory,
                      builder: (context, state) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CategoryCard(
                                onTap: () {
                                  context
                                      .read<LineSkipperCubit>()
                                      .selectCategory(
                                        Catergory.grocery,
                                      );
                                },
                                categoryText: 'Grocery',
                                categoryImage: LineItUpImages.grocery,
                                isSelected:
                                    state.selectedCategory == Catergory.grocery,
                              ),
                              CategoryCard(
                                onTap: () {
                                  context
                                      .read<LineSkipperCubit>()
                                      .selectCategory(
                                        Catergory.fastFood,
                                      );
                                },
                                categoryText: 'Fast Food',
                                categoryImage: LineItUpImages.fastFood,
                                isSelected: state.selectedCategory ==
                                    Catergory.fastFood,
                              ),
                              CategoryCard(
                                onTap: () {
                                  context
                                      .read<LineSkipperCubit>()
                                      .selectCategory(
                                        Catergory.coffee,
                                      );
                                },
                                categoryText: 'Coffee',
                                categoryImage: LineItUpImages.coffee,
                                isSelected:
                                    state.selectedCategory == Catergory.coffee,
                              ),
                              CategoryCard(
                                onTap: () {
                                  context
                                      .read<LineSkipperCubit>()
                                      .selectCategory(
                                        Catergory.pizza,
                                      );
                                },
                                categoryText: 'Pizza',
                                categoryImage: LineItUpImages.pizza,
                                isSelected:
                                    state.selectedCategory == Catergory.pizza,
                              ),
                              CategoryCard(
                                onTap: () {
                                  context
                                      .read<LineSkipperCubit>()
                                      .selectCategory(
                                        Catergory.chinese,
                                      );
                                },
                                categoryText: 'Chinese',
                                categoryImage: LineItUpImages.chinese,
                                isSelected:
                                    state.selectedCategory == Catergory.chinese,
                              ),
                              CategoryCard(
                                onTap: () {
                                  context
                                      .read<LineSkipperCubit>()
                                      .selectCategory(
                                        Catergory.tacos,
                                      );
                                },
                                categoryText: 'Tacos',
                                categoryImage: LineItUpImages.tacos,
                                isSelected:
                                    state.selectedCategory == Catergory.tacos,
                              ),
                              CategoryCard(
                                onTap: () {
                                  context
                                      .read<LineSkipperCubit>()
                                      .selectCategory(
                                        Catergory.thai,
                                      );
                                },
                                categoryText: 'Thai',
                                categoryImage: LineItUpImages.thai,
                                isSelected:
                                    state.selectedCategory == Catergory.thai,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    GeneralTile(
                      icon: LineItUpIcons().location,
                      title: translate(context, 'nearby'),
                      subtitle: '12348 street, LA',
                      trailing: LineItUpIcons().edit,
                      onTap: () {
                        context.pushPage(const ConfirmLocationPage());
                      },
                    ),
                    const SizedBox(height: 16),
                    const StroreCard(
                      image: LineItUpImages.store1,
                      name: 'Cost Less Food Company',
                      distance: '2.3 mi',
                      showDotSepreator: false,
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store2,
                      name: 'Food for Health',
                      distance: '2.3 mi',
                      isClosed: true,
                      showDotSepreator: false,
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store3,
                      name: 'Bristol Farms',
                      distance: '2.3 mi',
                      showDotSepreator: false,
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store4,
                      name: 'Pavilions',
                      distance: '2.3 mi',
                      showDotSepreator: false,
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store5,
                      name: 'Food for Health',
                      distance: '2.3 mi',
                      showDotSepreator: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
