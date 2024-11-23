import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:standered_application/features/sign_in/domain/entities/sign_in_params.dart';
import 'package:standered_application/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:standered_application/src/application/architecture/use_case/base_usecase.dart';
import 'package:standered_application/src/core/data/models/user_information.dart';
import 'package:standered_application/src/logger/failure/app_failures.dart';

@lazySingleton
class SignInUseCase extends BaseUseCase<UserInformation, SignInParams> {
  final SignInRepository baseRepositoryNameRepository;
  SignInUseCase({required this.baseRepositoryNameRepository});

  @override
  Future<Either<Failure, UserInformation>> call(parameters) async {
    return await baseRepositoryNameRepository.signIn(parameters);
  }
}
