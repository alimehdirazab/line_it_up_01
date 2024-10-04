part of 'view.dart';

class LineSkipeprCardDetailsPage extends StatelessWidget {
  const LineSkipeprCardDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperCardDetailsView();
  }
}

class LineSkipperCardDetailsView extends StatelessWidget {
  const LineSkipperCardDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(context, 'details'),
          style: LineItUpTextTheme().body.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        leading: IconButton(
            onPressed: () {
              context.pushPage(const LineSkipperRootPage());
            },
            icon: Icon(LineItUpIcons().cross)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: DebitCard(),
            ),
            const SizedBox(height: 56),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child:
                      Text(translate(context, 'set_as_primary_payment_method'),
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                ),
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: LineItUpColorTheme().green,
                  activeTrackColor: LineItUpColorTheme().grey40,
                  inactiveTrackColor: LineItUpColorTheme().grey40,
                  inactiveThumbColor: LineItUpColorTheme().grey,
                ),
              ],
            ),
            const SizedBox(width: 16),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  // Added to prevent overflow
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        translate(context, 'remove_card'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(
                          height: 4), // Added spacing for better readability
                      Text(
                        translate(context,
                            'this_payment_method_will_be_removed_from_wallet'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: LineItUpColorTheme().grey60,
                            ),
                        overflow: TextOverflow
                            .ellipsis, // Optional: in case the text is too long
                        maxLines: 2, // Optional: to limit the number of lines
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const RemoveCardBottomSheet();
                        });
                  },
                  icon: Icon(
                    LineItUpIcons().delete1,
                    color: LineItUpColorTheme().red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RemoveCardBottomSheet extends StatelessWidget {
  const RemoveCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: context.mHeight * 0.25,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            translate(context, 'remove_this_card'),
            style: LineItUpTextTheme().body.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            translate(context, 'are_you_sure_you_want_to_remove_this_card'),
            style: LineItUpTextTheme().body.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: context.mWidth * 0.40,
                child: CustomElevatedButton(
                  title: translate(context, 'no'),
                  buttonColor: LineItUpColorTheme().grey20,
                  fontColor: LineItUpColorTheme().black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  onTap: () {
                    context.popPage();
                  },
                ),
              ),
              CustomElevatedButton(
                width: context.mWidth * 0.40,
                title: translate(context, 'yes'),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                onTap: () {
                  context.popPage();
                  context.pushPage(const AddCardDetailsPage());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
