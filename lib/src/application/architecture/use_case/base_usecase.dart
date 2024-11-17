import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:standered_application/src/logger/failure/app_failures.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}