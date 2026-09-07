import 'package:flutter/material.dart';

/// An inline status badge rendered by the `status::Label::` syntax.
class TextfStatusBadge extends StatelessWidget {
  /// Creates an inline status badge.
  const TextfStatusBadge({required this.label, super.key});

  /// The status label displayed in the badge.
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = switch (label.trim().toLowerCase()) {
      'ordered' => colorScheme.primary,
      'received' || 'received / on hand' => colorScheme.secondary,
      'cut' || 'loaded' || 'completed' => colorScheme.tertiary,
      'not set' || 'not ordered' => colorScheme.error,
      _ => colorScheme.primary,
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
