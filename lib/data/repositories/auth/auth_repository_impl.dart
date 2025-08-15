import 'dart:developer';
import 'dart:ffi';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSigninService _googleSigninService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSigninService googleSigninService,
  }) : _localStorageService = localStorageService,
       _googleSigninService = googleSigninService;
  @override
  Future<Result<Bool>> isLogged() {
    // TODO: implement isLogged
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSigninService.signIn();
    switch (result) {
      case Success<String>(:final value):
        await _localStorageService.saveIdToken(value);
        //fazer login no nosso backend
        return successOfUnit();
      case Failure<String>(:final error):
        log(
          'Erro ao realizar o login com o Goole',
          name: 'AuthRepository',
          error: error,
        );
        return Failure(
          DataException(message: 'Erro ao realozar o login com o Google'),
        );
    }
  }

  @override
  Future<Result<Unit>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
