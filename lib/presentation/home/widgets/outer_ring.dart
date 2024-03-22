import 'package:flutter/material.dart';
import 'package:tmdb_pilar/core/utils/constants/constants.dart';

class OuterRing extends StatelessWidget {
  const OuterRing({
    super.key,
    required this.percent,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0XFF0D253F),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            bottom: 4,
            left: 4,
            right: 4,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black.withOpacity(0.29),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            top: 4,
            bottom: 4,
            left: 4,
            right: 4,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              value: percent / 100,
              valueColor: percent > 60
                  ? const AlwaysStoppedAnimation<Color>(Color(0XFF21D07A))
                  : const AlwaysStoppedAnimation<Color>(Color(0XFFd2d531)),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  text: percent.ceil().toString(),
                  style: const TextStyle(
                    fontFamily: sourceSansPro,
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: const [
                    TextSpan(
                      text: '%',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
