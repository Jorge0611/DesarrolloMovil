import 'package:chat_app/entities/message.dart';
import 'package:chat_app/models/request_model.dart';
import 'package:dio/dio.dart';

class RequestHelper {
  final dio = Dio();

  Future<Message> getAnswer() async {
    final response = await dio.get('https://yesno.wtf/api');
    final message = RequestModel.fromJson(response.data);
    return message.parseMessage();
  }
}
