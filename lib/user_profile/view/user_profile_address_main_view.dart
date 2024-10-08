part of 'view.dart';

class UserProfileAddressMainPage extends StatelessWidget {
  const UserProfileAddressMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserProfileAddressMainView();
  }
}

class UserProfileAddressMainView extends StatelessWidget {
  const UserProfileAddressMainView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> details = [
      {
        "title": "Home address",
        "subtitle": "Set address",
        "icon": LineItUpIcons().home,
      },
      {
        "title": "Office address",
        "subtitle": "Set address",
        "icon": LineItUpIcons().home,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(context, 'addresses'),
          style: LineItUpTextTheme().body.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: CustomTextField(
              onTap: () {
                // context.pushPage(const UserSearchPage());
              },
              hintText: 'Search for an address',
              hintStyle:
                  TextStyle(color: LineItUpColorTheme().grey, fontSize: 14),
              filled: true,
              fillColor: LineItUpColorTheme().grey20,
              prefixIcon: Icon(
                LineItUpIcons().search,
                color: LineItUpColorTheme().grey,
                size: 24,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: LineItUpColorTheme().white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: LineItUpColorTheme().black.withOpacity(0.25),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Text(
              translate(context, 'saved_address'),
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: InkWell(
              onTap: () {
                _showBottomSheet(context);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: LineItUpColorTheme().grey20,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: 64,
                          height: 64,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: LineItUpColorTheme().white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: LineItUpColorTheme().black30, width: 1),
                          ),
                          child: Image.asset(LineItUpImages.locationPin,
                              width: 40, height: 40)),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        "12348 street,LA",
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios,
                          color: LineItUpColorTheme().black, size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Text(
              translate(context, 'add_new_addresses'),
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: details.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    AddressListTile(
                      title: details[index]['title']!,
                      subtitle: details[index]['subtitle']!,
                      icon: details[index]['icon'] as IconData?,
                      onTap: () {
                        // Handle tap event (e.g., navigate to edit address)
                      },
                    ),
                    if (index < details.length - 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17.0),
                        child: Divider(
                          color: LineItUpColorTheme().grey30,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            color: LineItUpColorTheme().white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  translate(context, 'deliver_address'),
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  decoration: BoxDecoration(
                    color: LineItUpColorTheme().grey20,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(
                      "123458 street, LA",
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    subtitle: Text(
                      "California",
                      style: LineItUpTextTheme().body.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: LineItUpColorTheme().grey),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          context.pushPage(const UserSearchSomeWhereElsePage());
                        },
                        icon: Icon(
                          LineItUpIcons().edit,
                          color: LineItUpColorTheme().black,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                GestureDetector(
                  onTap: () {
                    _showBottomSheetDelete(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        LineItUpIcons().delete,
                        color: LineItUpColorTheme().red,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Remove this address",
                        style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: LineItUpColorTheme().red),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Divider(
                  color: LineItUpColorTheme().grey20,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      title: "Cancel",
                      fontColor: LineItUpColorTheme().black,
                      buttonColor: LineItUpColorTheme().grey20,
                      width: MediaQuery.of(context).size.width * 0.42,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      onTap: () {
                        context.popPage();
                      },
                    ),
                    CustomElevatedButton(
                      title: "Apply",
                      fontColor: LineItUpColorTheme().white,
                      buttonColor: LineItUpColorTheme().primary,
                      width: MediaQuery.of(context).size.width * 0.45,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheetDelete(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.24,
          decoration: BoxDecoration(
            color: LineItUpColorTheme().white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Remove this address",
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  "Are you sure you want to remove this address?",
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      title: "No",
                      fontColor: LineItUpColorTheme().black,
                      buttonColor: LineItUpColorTheme().grey20,
                      width: MediaQuery.of(context).size.width * 0.42,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      onTap: () {
                        context.popPage();
                      },
                    ),
                    CustomElevatedButton(
                      title: "Yes",
                      onTap: () {
                        context.popPage();
                      },
                      fontColor: LineItUpColorTheme().white,
                      buttonColor: LineItUpColorTheme().primary,
                      width: MediaQuery.of(context).size.width * 0.45,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
