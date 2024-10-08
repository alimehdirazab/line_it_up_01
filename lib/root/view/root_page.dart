part of 'view.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(),
      child: const _RootView(),
    );
  }
}

class _RootView extends StatelessWidget {
  const _RootView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _RootViewPages(),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class _RootViewPages extends StatelessWidget {
  const _RootViewPages();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      buildWhen: (previous, current) =>
          previous.navBarItem != current.navBarItem,
      builder: (context, state) {
        return IndexedStack(
          index: _buildPageIndex(state),
          children: const [
            UserHomePage(),
            UserBrowsePage(),
            LineSkipperPage(),
            UserOrderPage(),
            UserProfilePage(),
          ],
        );
      },
    );
  }

  int _buildPageIndex(RootState state) {
    switch (state.navBarItem) {
      case NavBarItem.home:
        return 0;
      case NavBarItem.browse:
        return 1;
      case NavBarItem.lineskipper:
        return 2;
      case NavBarItem.orders:
        return 3;
      case NavBarItem.setting:
        return 4;
    }
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      buildWhen: (previous, current) =>
          previous.navBarItem != current.navBarItem,
      builder: (context, state) {
        return BottomNavBarWidget(
          currentIndex: state.navBarItem.index,
          onTapHome: () =>
              context.read<RootCubit>().getNavBarItem(NavBarItem.home),
          onTapDelivery: () =>
              context.read<RootCubit>().getNavBarItem(NavBarItem.browse),
          onTapLinSkipper: () =>
              context.read<RootCubit>().getNavBarItem(NavBarItem.lineskipper),
          onTapOrders: () =>
              context.read<RootCubit>().getNavBarItem(NavBarItem.orders),
          onTapProfile: () =>
              context.read<RootCubit>().getNavBarItem(NavBarItem.setting),
        );
      },
    );
  }
}
