import 'package:e_commercenti/core/network/network.dart';

import 'package:e_commercenti/feature/auth/data/model/request/register_request_dto.dart';

import 'package:e_commercenti/feature/auth/data/model/response/register_response_dto.dart';

import '../../api/auth_api.dart';
import 'auth_data_source_contract.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSourceContract {
  AuthRemoteDataSourceImp(this._authApi);
  final AuthApi _authApi;
  @override
  Future<NetworkResult<RegisterResponseDto>> register(
    RegisterRequestDto request,
  ) => _authApi.register(request);
}
AuthRemoteDataSourceContract injectableAuthDataSource() =>
    AuthRemoteDataSourceImp(AuthApi.instance);
