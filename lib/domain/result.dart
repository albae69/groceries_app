sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success;
  const factory Result.fail(String message) = Fail;

  bool get isSuccess => this is Success<T>;
  bool get isFail => this is Fail<T>;
  T? get result => isSuccess ? (this as Success<T>).value : null;
  String? get errorMessage => isFail ? (this as Fail<T>).message : null;
}

class Success<T> extends Result<T> {
  final T value;

  const Success(this.value);
}

class Fail<T> extends Result<T> {
  final String message;

  const Fail(this.message);
}
