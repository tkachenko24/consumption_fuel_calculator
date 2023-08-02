import 'package:meta/meta.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/helpers/export.dart';

@sealed
abstract class Try<E, S> {
  const Try();

  dynamic get();

  static Try<E, S> catching<E, S, W extends Object>(
    S Function() action,
    E Function(W error) onError,
  ) {
    try {
      return Try.success(action());
    } on W catch (error) {
      return Try.failed(onError(error));
    }
  }

  static Try<E, S> condition<E, S>(
    bool Function() predicate,
    S Function() success,
    E Function() failed,
  ) {
    return predicate() ? Try.success(success()) : Try.failed(failed());
  }

  static Try<E, S> failed<E, S>(E failed) => Failed(failed);

  static Try<E, S> success<E, S>(S data) => Success(data);

  S getOrElse(S Function() other);

  bool isFailed();

  bool isSuccess();

  W fold<W>(
    W Function(E failed) failed,
    W Function(S success) success,
  );

  Try<TE, TS> either<TE, TS>(
    TE Function(E failed) failed,
    TS Function(S success) success,
  );

  Try<E, W> then<W>(Try<E, W> action);

  Status<E, S> toStatus();

  Try<E, W> map<W>(W Function(S data) action);

  Try<E, W> flatMap<W>(Try<E, W> Function(S success) action) =>
      fold((failed) => Try.failed<E, W>(failed), action);

  bool every(bool Function(S success) action) =>
      fold((failed) => false, action);

  Future<Try<E, W>> future<W>(Future<W> Function(S success) action);

  @override
  String toString() => fold((l) => 'Success($l)', (r) => 'Failed($r)');

  Try<S, E> swap() => fold(
        (failed) => Try.success(failed),
        (success) => Try.failed(success),
      );
}

@immutable
class Success<E, S> extends Try<E, S> {
  const Success(
    this._success,
  );

  final S _success;

  @override
  S get() {
    return _success;
  }

  @override
  bool isFailed() => false;

  @override
  bool isSuccess() => true;

  @override
  int get hashCode => _success.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Success && other._success == _success;

  @override
  S getOrElse(Function() other) => get();

  @override
  W fold<W>(
    W Function(E failed) failed,
    W Function(S success) success,
  ) {
    return success(_success);
  }

  @override
  Try<TE, TS> either<TE, TS>(
    TE Function(E failed) failed,
    TS Function(S success) success,
  ) {
    return Try.success<TE, TS>(success(_success));
  }

  @override
  Try<E, W> then<W>(Try<E, W> action) {
    return action;
  }

  @override
  Try<E, W> map<W>(W Function(S data) action) {
    return Try.success(action(_success));
  }

  @override
  Status<E, S> toStatus() {
    return Status.success(_success);
  }

  @override
  Future<Try<E, W>> future<W>(Future<W> Function(S success) action) {
    return action(_success).then(Try.success);
  }
}

@immutable
class Failed<E, S> extends Try<E, S> {
  const Failed(this._failed);

  final E _failed;

  @override
  E get() {
    return _failed;
  }

  @override
  bool isFailed() => true;

  @override
  bool isSuccess() => false;

  @override
  int get hashCode => _failed.hashCode;

  @override
  bool operator ==(Object other) => other is Failed && other._failed == _failed;

  @override
  W fold<W>(
    W Function(E failed) failed,
    W Function(S success) success,
  ) {
    return failed(_failed);
  }

  @override
  Try<TE, TS> either<TE, TS>(
    TE Function(E failed) failed,
    TS Function(S success) success,
  ) {
    return Try.failed<TE, TS>(failed(_failed));
  }

  @override
  S getOrElse(Function() other) => other();

  @override
  Try<E, W> then<W>(Try<E, W> action) {
    return Try.failed(_failed);
  }

  @override
  Try<E, W> map<W>(W Function(S data) action) {
    return Try.failed(_failed);
  }

  @override
  Status<E, S> toStatus() {
    return Status.failed(_failed);
  }

  @override
  Future<Try<E, W>> future<W>(Future<W> Function(S success) action) {
    return Future.microtask(() => Try.failed(_failed));
  }
}

typedef TryFuture<Failed, Success> = Future<Try<Failed, Success>>;
