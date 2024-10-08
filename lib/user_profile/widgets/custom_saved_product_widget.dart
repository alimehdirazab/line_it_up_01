part of 'widgets.dart';

class CustomSavedProductWidget extends StatelessWidget {
  final String? imageHeader;
  final String? imageMain;
  final String? title;
  final String? description;
  final String? estimatedCost;
  final String? cost;
  final bool showDivider;

  const CustomSavedProductWidget(
      {super.key,
      this.imageHeader,
      this.imageMain,
      this.title,
      this.description,
      this.estimatedCost,
      this.cost,
      this.showDivider = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity, // 89% of screen width
              height: MediaQuery.of(context).size.height * 0.16,
              decoration: BoxDecoration(
                color: LineItUpColorTheme().grey20,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            // Positioned.fill(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(8),
            //     child: Image(
            //       image: image!,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 12),
              child: Image.asset(
                imageHeader!,
              ),
            ),

            Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Image.asset(
                  imageMain!,
                  width: 50,
                  height: 50,
                )),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              title!,
              style: LineItUpTextTheme().heading.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
            ),
            const Spacer(),
            Icon(
              LineItUpIcons().heart,
              color: const Color(0xffFF0000),
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "$description • \$$estimatedCost",
          style: LineItUpTextTheme().body.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: LineItUpColorTheme().grey),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "\$$cost",
          style: LineItUpTextTheme().heading.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
        ),
        if (showDivider) ...[
          const SizedBox(
            height: 16,
          ),
          Divider(
            color: LineItUpColorTheme().grey30,
          ),
        ]
      ],
    );
  }
}
