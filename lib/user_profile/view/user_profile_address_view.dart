part of 'view.dart';

class UserProfileAddressPage extends StatelessWidget {
  const UserProfileAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserProfileAddressView();
  }
}

class UserProfileAddressView extends StatelessWidget {
  const UserProfileAddressView({super.key});

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
      // Add more address details as needed
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Add the back arrow icon
          onPressed: () {
            // Navigate back to the previous screen or push to a specific page
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const UserProfilePage()), // Replace with your page
            );
          },
        ),
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
              readOnly: true,
              hintText: 'Search for an address',
              hintStyle:
                  TextStyle(color: LineItUpColorTheme().grey, fontSize: 14),
              filled: true,
              fillColor: LineItUpColorTheme().grey20,
              //fillColor: LineItUpColorTheme().black,
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
              translate(context, 'add_new_addresses'),
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 16,
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
}
