import 'package:dio/dio.dart';
import 'package:getx_flutter/entities/user.dart';
import 'package:getx_flutter/models/register_response_model.dart';

class RegisterHelper {
  final dio = Dio();

  Future<ResponseModel> createUser(RegisterBody user) async {
    final response = await dio.post('http://localhost:3000/api/users/create',
        data: user.toJson());
    final message = ResponseModel.fromJson(response.data);

    return ResponseModel(
      success: message.success,
      message: message.message,
      data: message.data,
    );
  }
}
