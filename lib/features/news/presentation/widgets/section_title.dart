import 'package:flutter/material.dart';
import 'package:news/core/ui/extensions/context_extensions.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(vertical: 20, horizontal: 20),
      child: Text(title, style: context.textTheme.titleSmall),
    );
  }
}
