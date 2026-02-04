import 'package:flutter/material.dart';
import 'package:news/core/ui/extensions/context_extensions.dart';
import 'package:news/core/utils/date_format_util.dart';

class LastUpdatedTimestamp extends StatelessWidget {
  const LastUpdatedTimestamp({super.key, required this.timestamp});
  final DateTime? timestamp;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'Last Updated: '),
          TextSpan(
            text: DateFormatUtil.toLocalReadable(timestamp),
            style: TextStyle(fontWeight: .bold),
          ),
        ],
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
