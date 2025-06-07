extension PriceFormat on String {
  String toUsd() {
    final value = double.tryParse(this) ?? 0.0;
    return '\$${value.toStringAsFixed(2)}';
  }
}