import 'package:intl/intl.dart';

String formatCount(int? count) {
  if (count == null || count == 0) return '';

  if (count >= 1000000) {
    return '${(count ~/ 1000000)}M'; // 1M, 2M (no decimal)
  } else if (count >= 1000) {
    double result = count / 1000;
    return (count % 1000 == 0)
        ? '${count ~/ 1000}k' // Whole number, no decimal (e.g., 700k)
        : '${result.toStringAsFixed(1).replaceAll('.0', '')}k'; // 7.5k (removes unnecessary .0)
  } else {
    return NumberFormat.decimalPattern().format(count); // 999, 150, etc.
  }
}
