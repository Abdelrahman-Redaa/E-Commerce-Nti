import 'package:bloc/bloc.dart';
import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/auth/data/model/request/login_request_dto.dart';
import 'package:e_commercenti/feature/auth/data/model/response/login_response_dto.dart';
import 'package:e_commercenti/feature/auth/data/repo/repository/auth_rebository_contract.dart';
import 'package:e_commercenti/feature/auth/data/repo/repository/auth_rebository_imp.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._Repository) : super(LoginInitial());
  final AuthRepositoryContract _Repository;
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final data = LoginRequestDto(email: email, password: password);
    final result = await _Repository.login(data);
    switch (result) {
      case NetworkSuccess<LoginResponseDto>():
        emit(LoginSuccess());
      case NetworkError<LoginResponseDto>():
        emit(LoginError());
    }
  }
}
