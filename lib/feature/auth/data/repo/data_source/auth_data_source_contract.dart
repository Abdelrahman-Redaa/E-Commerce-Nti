 import '../../../../../core/network/network.dart';
import '../../model/request/register_request_dto.dart';
import '../../model/response/register_response_dto.dart';

abstract class AuthRemoteDataSourceContract{
  Future< NetworkResult<RegisterResponseDto>> register(RegisterRequestDto request);
 }
 abstract class AuthLocalDataSourceContract{}

