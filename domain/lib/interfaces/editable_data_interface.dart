///this [class] will contain the necessary function to edit any type of data
mixin EditableDataInterface<T> {
  ///this function will upload a new [item] to the database at the given path
  Future<T> upload({required T item});

  ///this function will edit the existing [item] with the new one\
  Future<T> edit({required T item});

  ///this function will remove the item with the given [id]
  Future<bool> delete({required String id});
}
