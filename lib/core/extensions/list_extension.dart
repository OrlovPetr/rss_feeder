/// [ListExtension] extension on [List]
extension ListExtension<T> on List<T> {
  /// Test and compare [List] of same type and check all values in test [List]
  /// if they contains in current list
  bool containsList(List<T> test) =>
      test.fold(true, (bool prev, T cur) => !contains(cur) ? false : prev);

  /// Test if [List] contains searching element and return index of it
  int getIndex(T el) => contains(el)
      ? indexWhere((T element) => contains(el) && element == el)
      : 0;
}
