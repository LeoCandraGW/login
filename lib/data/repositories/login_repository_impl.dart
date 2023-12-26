// ignore_for_file: non_constant_identifier_names, override_on_non_overriding_member, unused_local_variable, null_argument_to_non_null_type
import 'dart:io';
import 'package:login/common/exception.dart';
import 'package:login/common/failure.dart';
import 'package:login/data/datasources/login_remote_datasource.dart';
import 'package:login/domain/entities/login.dart';
import 'package:login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  LoginRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, Login>> postLogin(username, password) async {
    try {
      final result = await remoteDataSource.postLogin(username, password);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, void>> postLogout() async {
    try {
      final result = await remoteDataSource.postLogout();
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
