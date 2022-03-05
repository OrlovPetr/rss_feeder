/// [ListExtension] extension on [List]
extension ListExtension<T> on List<T> {
  /// Test and compare [List] of same type and check all values in test [List]
  /// if they contains in current list
  bool containsList(List<T> test) =>
      test.fold(true, (bool prev, T cur) => !contains(cur) ? false : prev);
}
