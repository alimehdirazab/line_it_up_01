part of 'view.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LineSkipperCubit(), // Provide LineSkipperCubit
      child: const OrderListView(),
    );
  }
}

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
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
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translate(context, 'order_list'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: translate(context, 'list_one_product_at_a_time'),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      LineItUpIcons().add,
                      color: LineItUpColorTheme().black,
                    ),
                    Text(
                      translate(context, 'add_more_items'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                translate(context, 'other_instruction'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: translate(context, 'write_instructions'),
              ),
              const SizedBox(height: 24),
              Text(
                translate(context, 'estimated_order_price'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                translate(
                    context, 'setting_a_estimated_price_helps_line_skipper'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: LineItUpColorTheme().grey,
                    ),
              ),
              const SizedBox(height: 8),
              _buildPriceChipSelector(),
              const SizedBox(height: 24),
              Text(
                translate(context, 'payment_method'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: LineItUpColorTheme().grey20,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      LineItUpIcons().add,
                      color: LineItUpColorTheme().black,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      translate(context, 'add_a_payment_method'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                translate(context, 'tip_for_rider'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                translate(
                    context, 'your_selected_tip_go_directly_to_your_rider'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: LineItUpColorTheme().grey,
                    ),
              ),
              const SizedBox(height: 8),
              _buildTipChipSelector(),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onTap: () {
                    context.pushPage(const FindingLineSkipperPage());
                  },
                  title: translate(context, 'continue'),
                  padding: const EdgeInsets.all(17),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Price Chip Selector
  Widget _buildPriceChipSelector() {
    return BlocBuilder<LineSkipperCubit, LineSkipperState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildChip(context, '\$5-20', 0,
                  state.selectedPriceChipIndex == 0, true),
              const SizedBox(width: 8),
              _buildChip(context, '\$20-40', 1,
                  state.selectedPriceChipIndex == 1, true),
              const SizedBox(width: 8),
              _buildChip(context, '\$40-60', 2,
                  state.selectedPriceChipIndex == 2, true),
              const SizedBox(width: 8),
              _buildChip(context, '\$60-80', 3,
                  state.selectedPriceChipIndex == 3, true),
              const SizedBox(width: 8),
              _buildChip(context, '\$80-100', 4,
                  state.selectedPriceChipIndex == 4, true),
            ],
          ),
        );
      },
    );
  }

  // Tip Chip Selector
  Widget _buildTipChipSelector() {
    return BlocBuilder<LineSkipperCubit, LineSkipperState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildChip(
                  context, '\$5', 0, state.selectedTipChipIndex == 0, false),
              const SizedBox(width: 8),
              _buildChip(
                  context, '\$10', 1, state.selectedTipChipIndex == 1, false),
              const SizedBox(width: 8),
              _buildChip(
                  context, '\$12', 2, state.selectedTipChipIndex == 2, false),
              const SizedBox(width: 8),
              _buildChip(
                  context, '\$15', 3, state.selectedTipChipIndex == 3, false),
              const SizedBox(width: 8),
              _buildChip(
                  context, '\$20', 4, state.selectedTipChipIndex == 4, false),
              const SizedBox(width: 8),
              _buildChip(
                  context, '\$100', 5, state.selectedTipChipIndex == 5, false),
              const SizedBox(width: 8),
              _buildChip(
                  context, '\$150', 6, state.selectedTipChipIndex == 6, false),
            ],
          ),
        );
      },
    );
  }

  // Chip widget to handle both price and tip chips
  Widget _buildChip(BuildContext context, String label, int index,
      bool isSelected, bool isPrice) {
    return GestureDetector(
      onTap: () {
        if (isPrice) {
          context.read<LineSkipperCubit>().selectPriceChip(index);
        } else {
          context.read<LineSkipperCubit>().selectTipChip(index);
        }
      },
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected
            ? LineItUpColorTheme().primary
            : LineItUpColorTheme().white,
        labelStyle: LineItUpTextTheme().body.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? LineItUpColorTheme().white
                  : LineItUpColorTheme().black,
            ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        side: BorderSide(
          color: isSelected
              ? LineItUpColorTheme().primary
              : LineItUpColorTheme().grey,
          width: 0.2,
        ),
      ),
    );
  }
}
