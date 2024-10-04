part of 'view.dart';

class LineSkipperPrivacyPolicyPage extends StatelessWidget {
  const LineSkipperPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperPrivacyPolicyView();
  }
}

class LineSkipperPrivacyPolicyView extends StatelessWidget {
  const LineSkipperPrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy',
            style: LineItUpTextTheme().body.copyWith(
                  fontWeight: FontWeight.w600,
                )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Text('Updated on Sept 23, 2024 | 20 min read',
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().grey60,
                      )),
              const SizedBox(height: 32),
              Text(
                'Introduction',
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application ("App"). Please read this policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the App.',
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 32),
              Text(
                'Information We Collect',
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'We may collect and store the following types of information:\n .Personal Information: Information such as your name, email address, phone number, and other details that you provide during account registration or app usage.Automatically Collected Information: Data such as IP address, device information, usage statistics, and app interactions. This is collected via cookies, tracking tools, and other technologies.Location Information: With your permission, we may collect and process location data to provide location-based services.',
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 32),
              Text(
                'How We Use Your Information',
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'We may use the information collected for:Providing and maintaining the functionality of the App.Personalizing your experience by analyzing your preferences.Sending you updates, notifications, and relevant promotional materials.Enhancing security and preventing unauthorized access to our systems.Analyzing usage data to improve app performance and user experience.',
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
