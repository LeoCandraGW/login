// ignore_for_file: non_constant_identifier_names
import 'package:login/domain/entities/login.dart';
import '../../common/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> postLogin(String username, String password);
  Future<Either<Failure, void>> postLogout();
}
