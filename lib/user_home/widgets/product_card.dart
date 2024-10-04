part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
             // Image.asset(LineItUpImages.product1),
            ],
          ),
        )
      ],
    );
  }
}
