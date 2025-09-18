import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/auth/data/model/request/login_request_dto.dart';
import 'package:e_commercenti/feature/auth/data/model/request/register_request_dto.dart';
import 'package:e_commercenti/feature/auth/data/model/response/login_response_dto.dart';
import 'package:e_commercenti/feature/auth/data/model/response/register_response_dto.dart';
import 'package:e_commercenti/feature/auth/data/repo/data_source/auth_data_source_contract.dart';
import 'package:e_commercenti/feature/auth/data/repo/data_source/auth_data_source_impl.dart';
import 'package:e_commercenti/feature/auth/data/repo/repository/auth_rebository_contract.dart';

class AuthRebositoryImp implements AuthRepositoryContract {
  AuthRebositoryImp(this._dataSourceRemote);
  final AuthRemoteDataSourceContract _dataSourceRemote;

  @override
  Future<NetworkResult<RegisterResponseDto>> register(
    RegisterRequestDto request,
  ) => _dataSourceRemote.register(request);

  @override
  Future<NetworkResult<LoginResponseDto>> login(LoginRequestDto request) =>
      _dataSourceRemote.login(request);
}

AuthRepositoryContract injectableAuthRepo() =>
    AuthRebositoryImp(injectableAuthDataSource());
