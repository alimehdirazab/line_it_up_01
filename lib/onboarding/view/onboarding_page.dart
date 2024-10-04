part of 'view.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => __OnboardingViewState();
}

class __OnboardingViewState extends State<_OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(context.mWidth * 0.06),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(LineItUpImages.appogo,
                    height: context.mHeight * 0.2),
              ],
            ),
            Flexible(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: context.mWidth,
                  viewportFraction: 0.9,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    context.read<OnboardingCubit>().changePage(index);
                  },
                ),
                items: [
                  _SlidingPage(
                    title: translate(context, 'instant_pickup'),
                    description:
                        translate(context, 'instant_pickup_description'),
                    image: LineItUpImages.onboarding1,
                  ),
                  _SlidingPage(
                    title: translate(context, 'order_from_home'),
                    description:
                        translate(context, 'order_from_home_description'),
                    image: LineItUpImages.onboarding2,
                  ),
                  _SlidingPage(
                    title: translate(context, 'avoid_wait'),
                    description: translate(context, 'avoid_wait_description'),
                    image: LineItUpImages.onboarding3,
                  ),
                  _SlidingPage(
                    title: translate(context, 'delivery_at_doorstep'),
                    description:
                        translate(context, 'delivery_at_doorstep_description'),
                    image: LineItUpImages.onboarding4,
                  ),
                  _SlidingPage(
                    title: translate(context, 'track_order'),
                    description: translate(context, 'track_order_description'),
                    image: LineItUpImages.onboarding5,
                  ),
                ],
              ),
            ),

            // Expanding Dots Indicator using BlocBuilder
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5,
                      (index) => _buildExpandingDot(index, state.currentPage)),
                );
              },
            ),
            SizedBox(height: context.mHeight * 0.05),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                  title: translate(context, 'login'),
                  onTap: () {
                    context.pushPage(const LoginPage());
                  }),
            ),
            SizedBox(height: context.mHeight * 0.01),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                  title: translate(context, 'signup'),
                  buttonColor: Colors.transparent,
                  fontColor: LineItUpColorTheme().primary,
                  borderWidth: 1,
                  borderColor: LineItUpColorTheme().primary,
                  onTap: () {
                    context.pushPage(const SignUpPage());
                  }),
            ),
            SizedBox(height: context.mHeight * 0.02),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: translate(context, 'by_logging_in_or_registering'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 12,
                            color: LineItUpColorTheme().black.withOpacity(0.5),
                          ),
                    ),
                    TextSpan(
                      text: translate(context, 'terms_of'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: LineItUpColorTheme().black.withOpacity(0.8),
                          ),
                    ),
                    TextSpan(
                      text: translate(context, 'services'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: LineItUpColorTheme().black.withOpacity(0.8),
                          ),
                    ),
                    TextSpan(
                      text: translate(context, 'and'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 12,
                            color: LineItUpColorTheme().black.withOpacity(0.5),
                          ),
                    ),
                    TextSpan(
                      text: translate(context, 'privacy_policy'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: LineItUpColorTheme().black.withOpacity(0.8),
                          ),
                    ),
                  ],
                ),
                softWrap: true, // Allows text to wrap
                textAlign: TextAlign.center, // Centers the text
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build the expanding dots using Cubit's state
  Widget _buildExpandingDot(int index, int currentPage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
      height: currentPage == index ? 8.0 : 8.0, // Expanding height
      width: currentPage == index ? 22.0 : 8.0, // Expanding width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        color: currentPage == index
            ? LineItUpColorTheme().primary // Active dot color
            : LineItUpColorTheme().grey20, // Inactive dot color
      ),
    );
  }
}

class _SlidingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const _SlidingPage({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Image.asset(
            image,
          ),
        ),
        const SizedBox(height: 35),
        Text(
          title,
          style: LineItUpTextTheme().heading.copyWith(
                fontSize: 20,
              ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: context.mHeight * 0.02),
        Text(
          description,
          textAlign: TextAlign.center,
          style: LineItUpTextTheme().body.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: LineItUpColorTheme().black,
              ),
        ),
      ],
    );
  }
}
