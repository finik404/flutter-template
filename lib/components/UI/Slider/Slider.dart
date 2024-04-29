import 'package:template/components/UI/Slider/DotsIndicator.dart';
import 'package:flutter/material.dart';

/*
  CSlider Component ----------------
 */
class CSlider extends StatelessWidget {
  // Variables ----------------
  final PageController _controller = PageController();
  final int length;
  final Function(BuildContext, int)? builder;
  final dynamic child;

  // Props ----------------
  CSlider({
    required this.length,
    this.builder,
    this.child,
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 344,
        padding: const EdgeInsets.only(top: 20),
        width: double.infinity,
        child: PageView.builder(
          controller: _controller,
          itemCount: length,
          itemBuilder: (context, index) {
            if (builder != null) {
              return builder!(context, index);
            } else if (child != null) {
              if (child is Widget Function(int)) {
                return child(index);
              } else {
                return child;
              }
            }
            return Container();
          },
        ),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DotsIndicator(
          controller: _controller,
          itemCount: length,
        ),
      ),
    ]);
  }
}
