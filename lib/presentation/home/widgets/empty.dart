import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) => const SliverToBoxAdapter(
        child: SizedBox(
          height: 274,
          child: Center(
            child: Text('Empty'),
          ),
        ),
      );
}
