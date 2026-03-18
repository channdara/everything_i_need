abstract class EinPaginatedModel {}

class EinPaginatedLoading extends EinPaginatedModel {}

class EinPaginatedData<T> extends EinPaginatedModel {
  EinPaginatedData(this.item);

  final T item;
}
