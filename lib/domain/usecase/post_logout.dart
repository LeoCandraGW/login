// ignore_for_file: unused_import, non_constant_identifier_names
import 'dart:ffi';
import 'package:login/domain/repositories/login_repository.dart';
import 'package:login/domain/entities/login.dart';
import 'package:dartz/dartz.dart';
import '../../common/failure.dart';

class PostLogout {
  final LoginRepository repository;
  PostLogout(this.repository);
  Future<Either<Failure, void>> execute() {
    return repository.postLogout();
  }
}
