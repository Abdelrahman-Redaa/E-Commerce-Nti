import 'package:e_commercenti/feature/auth/data/model/request/login_request_dto.dart';
import 'package:e_commercenti/feature/auth/data/model/response/login_response_dto.dart';

import '../../../../../core/network/network.dart';
import '../../model/request/register_request_dto.dart';
import '../../model/response/register_response_dto.dart';

abstract class AuthRepositoryContract{
  Future< NetworkResult<RegisterResponseDto>> register(RegisterRequestDto request);
  Future<NetworkResult<LoginResponseDto>> login(LoginRequestDto request);

}