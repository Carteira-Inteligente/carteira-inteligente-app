import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        // Row(
        //   children: const <Widget>[
        //     Text(
        //       "thiago@email.com",
        //       style: TextStyle(
        //         color: cWhite,
        //         fontSize: 13,
        //         fontWeight: FontWeight.normal,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
