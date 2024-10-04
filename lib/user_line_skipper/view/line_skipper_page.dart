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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.mWidth * 0.04),
            child: CircleAvatar(
              backgroundColor: LineItUpColorTheme().grey,
              child: IconButton(
                icon: Icon(
                  LineItUpIcons().notification,
                  color: LineItUpColorTheme().white,
                ),
                onPressed: () {},
              ),
            ),
          ),
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
                                categoryText: translate(context, 'grocery'),
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
                                categoryText: translate(context, 'fast_food'),
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
                                categoryText: translate(context, 'coffee'),
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
                                categoryText: translate(context, 'pizza'),
                                categoryImage: LineItUpImages.pizza,
                                isSelected:
                                    state.selectedCategory == Catergory.pizza,
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
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store2,
                      name: 'Food for Health',
                      distance: '2.3 mi',
                      isClosed: true,
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store3,
                      name: 'Bristol Farms',
                      distance: '2.3 mi',
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store4,
                      name: 'Pavilions',
                      distance: '2.3 mi',
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store5,
                      name: 'Food for Health',
                      distance: '2.3 mi',
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
