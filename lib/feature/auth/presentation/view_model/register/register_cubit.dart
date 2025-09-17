import 'package:bloc/bloc.dart';
import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/auth/data/model/response/register_response_dto.dart';
import 'package:e_commercenti/feature/auth/data/repo/repository/auth_rebository_contract.dart';
import 'package:meta/meta.dart';

import '../../../data/api/auth_api.dart';
import '../../../data/model/request/register_request_dto.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._repository) : super(RegisterInitial());
  final AuthRepositoryContract _repository;

  Future<void> register(String name, String email, String password) async {
    emit(RegisterLoading());
    final request = RegisterRequestDto(
      name: name,
      email: email,
      password: password,
    );
    final result = await _repository.register(request);
    switch (result) {
      case NetworkSuccess<RegisterResponseDto>():
         emit(RegisterSuccess());
      case NetworkError<RegisterResponseDto>():
        emit(RegisterError());
}  }
}
