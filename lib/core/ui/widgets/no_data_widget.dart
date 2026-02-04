import 'package:flutter/material.dart';
import 'package:news/core/ui/extensions/context_extensions.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, this.title, this.message});
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 20,
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        children: [
          Text(title ?? 'No Data', style: context.textTheme.titleLarge),
          if (message != null)
            Text(message!, style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
