import 'package:dartz/dartz.dart';

typedef APIResponse<T> = Either<Failure, T>;

class Failure {
  final dynamic code;
  final Object reponse;

  Failure({
    this.code = 500,
    required this.reponse,
  });

  @override
  String toString() => 'Failure(code: $code, response: $reponse)';
}
