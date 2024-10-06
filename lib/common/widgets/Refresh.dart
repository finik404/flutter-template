import 'package:flutter/material.dart';

class UIRefresh extends StatelessWidget {
  const UIRefresh({
    required this.child,
    required this.refresh,
    super.key,
  });

  final Widget child;
  final Future<void> Function() refresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: child,
    );
  }
}
