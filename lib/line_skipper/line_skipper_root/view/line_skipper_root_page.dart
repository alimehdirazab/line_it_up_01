part of 'view.dart';

class LineSkipperRootPage extends StatelessWidget {
  const LineSkipperRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LineSkipperHomeCubit>(
          create: (context) => LineSkipperHomeCubit(),
        ),
        BlocProvider<LineSkipperRootCubit>(
          create: (context) => LineSkipperRootCubit(),
        ),
      ],
      child: const _LineSkipperRootView(),
    );
  }
}

class _LineSkipperRootView extends StatelessWidget {
  const _LineSkipperRootView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _LineSkipperRootViewPages(),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class _LineSkipperRootViewPages extends StatelessWidget {
  const _LineSkipperRootViewPages();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LineSkipperRootCubit, LineSkipperRootState>(
      buildWhen: (previous, current) =>
          previous.navBarItem != current.navBarItem,
      builder: (context, state) {
        return IndexedStack(
          index: _buildPageIndex(state),
          children: const [
            LineSkipperHomePage(),
            LineSkipperOrderPage(),
            LineSkipperProfilePage(),
          ],
        );
      },
    );
  }

  int _buildPageIndex(LineSkipperRootState state) {
    switch (state.navBarItem) {
      case NavBarItem.home:
        return 0;
      case NavBarItem.orders:
        return 1;
      case NavBarItem.profile:
        return 2;
    }
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LineSkipperRootCubit, LineSkipperRootState>(
      buildWhen: (previous, current) =>
          previous.navBarItem != current.navBarItem,
      builder: (context, state) {
        return BottomNavBarWidget(
          currentIndex: state.navBarItem.index,
          onTapHome: () => context
              .read<LineSkipperRootCubit>()
              .getNavBarItem(NavBarItem.home),
          onTapOrders: () => context
              .read<LineSkipperRootCubit>()
              .getNavBarItem(NavBarItem.orders),
          onTapProfile: () => context
              .read<LineSkipperRootCubit>()
              .getNavBarItem(NavBarItem.profile),
        );
      },
    );
  }
}
