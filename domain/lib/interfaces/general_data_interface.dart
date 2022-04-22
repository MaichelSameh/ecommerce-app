///The letter [T] is simply referring to any type of data
///So our interface doesn't need to work only for product's or users or anything else
mixin GeneralDataInterface<T> {
  //the first function we are going to need is the fetch list function
  ///this function will return a [List] of type [T]
  Future<List<T>> getAll();

  ///this function will return only one [T] with the given [id]
  Future<T> getById({required String id});
}
