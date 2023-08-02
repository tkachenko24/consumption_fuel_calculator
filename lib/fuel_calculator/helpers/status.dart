import 'package:meta/meta.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/helpers/export.dart';

@sealed
abstract class Status<E, S> {
  const Status();

  dynamic get();

  bool isEmpty();

  bool isLoading();

  bool isFailed();

  bool isSuccess();

  static Status<E, S> empty<E, S>() => EmptyStatus();

  static Status<E, S> loading<E, S>() => LoadingStatus();

  static Status<E, S> failed<E, S>(E failed) => FailedStatus(failed);

  static Status<E, S> success<E, S>(S success) => SuccessStatus(success);

  W when<W>({
    W Function()? empty,
    W Function()? loading,
    W Function(E failed)? failed,
    W Function(S success)? success,
    required W Function() other,
  });
}

class EmptyStatus<E, S> extends Status<E, S> {
  @override
  Unit get() {
    return unit;
  }

  @override
  bool isEmpty() => true;

  @override
  bool isLoading() => false;

  @override
  bool isFailed() => false;

  @override
  bool isSuccess() => false;

  @override
  W when<W>({
    W Function()? empty,
    W Function()? loading,
    W Function(E failed)? failed,
    W Function(S success)? success,
    required W Function() other,
  }) {
    if (empty != null) {
      return empty.call();
    }
    return other.call();
  }
}

@immutable
class LoadingStatus<E, S> extends Status<E, S> {
  @override
  Unit get() {
    return unit;
  }

  @override
  bool isEmpty() => false;

  @override
  bool isLoading() => true;

  @override
  bool isFailed() => false;

  @override
  bool isSuccess() => false;

  @override
  W when<W>({
    W Function()? empty,
    W Function()? loading,
    W Function(E failed)? failed,
    W Function(S success)? success,
    required W Function() other,
  }) {
    if (loading != null) {
      return loading.call();
    }
    return other.call();
  }
}

@immutable
class SuccessStatus<E, S> extends Status<E, S> {
  final S _success;

  @override
  S get() {
    return _success;
  }

  const SuccessStatus(
    this._success,
  );

  @override
  bool isEmpty() => false;

  @override
  bool isLoading() => false;

  @override
  bool isFailed() => false;

  @override
  bool isSuccess() => true;

  @override
  W when<W>({
    W Function()? empty,
    W Function()? loading,
    W Function(E failed)? failed,
    W Function(S success)? success,
    required W Function() other,
  }) {
    if (success != null) {
      return success.call(_success);
    }
    return other.call();
  }

  @override
  int get hashCode => _success.hashCode;

  @override
  bool operator ==(Object other) =>
      other is SuccessStatus && other._success == _success;
}

class FailedStatus<E, S> extends Status<E, S> {
  final E _failed;

  @override
  E get() {
    return _failed;
  }

  FailedStatus(this._failed);

  @override
  bool isEmpty() => false;

  @override
  bool isLoading() => false;

  @override
  bool isFailed() => true;

  @override
  bool isSuccess() => false;

  @override
  W when<W>({
    W Function()? empty,
    W Function()? loading,
    W Function(E failed)? failed,
    W Function(S success)? success,
    required W Function() other,
  }) {
    if (failed != null) {
      return failed.call(_failed);
    }
    return other.call();
  }

  @override
  int get hashCode => _failed.hashCode;

  @override
  bool operator ==(Object other) =>
      other is FailedStatus && other._failed == _failed;
}
