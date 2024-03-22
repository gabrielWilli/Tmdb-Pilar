import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) => const SliverToBoxAdapter(
        child: SizedBox(
          height: 274,
          child: Center(
            child: SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
}
