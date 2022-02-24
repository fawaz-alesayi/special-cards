extension ListExtension<T> on List<T> {
  /// check if this list contains any of the elements in another list
  bool containsAny(List<T> other) {
    Set<T> thisSet = Set.from(this);
    Set<T> otherSet = Set.from(other);
    return thisSet.intersection(otherSet).isNotEmpty;
  }

  /// adds an element between each element in the list
  /// 
  /// [separator] is the element to add between each element
  List<T> intersperse(T separator) {
    List<T> result = [];
    for (int i = 0; i < this.length; i++) {
      result.add(this[i]);
      if (i != this.length - 1) {
        result.add(separator);
      }
    }
    return result;
  }
}