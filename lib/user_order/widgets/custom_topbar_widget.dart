import 'package:flutter/material.dart';


import '../../utils/generics/generics.dart';
import '../../utils/theme/theme.dart';

class CustomTopbarWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomTopbarWidget({super.key,
  required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24,),
        Row(
          children: [
            Text(
              translate(context, 'details'),
              style: LineItUpTextTheme().body.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),

            const Spacer(),
            CircleAvatar(
              backgroundColor: LineItUpColorTheme().grey,
              child: IconButton(
                icon: Icon(
                  LineItUpIcons().notification,
                  color: LineItUpColorTheme().white,
                ),
                onPressed: () {},
              ),
            ),

          ],
        ),
      ],
    );
  }
}
