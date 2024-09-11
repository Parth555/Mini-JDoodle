import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel channel;

  WebSocketService()
      : channel = WebSocketChannel.connect(
    Uri.parse('wss://api.jdoodle.com/v1/execute'),
  );

  Stream<String> get output => channel.stream.map((event) {
    final message = jsonDecode(event) as Map<String, dynamic>;
    return message['body'] ?? '';
  });

  void sendCode(String script, String language, int versionIndex,String token) {
    final data = jsonEncode({
      'script': script,
      'language': language,
      'versionIndex': versionIndex,
    });

    channel.sink.add(jsonEncode({
      'message_type': 'execute',
      'token': token,
      'data': data,
    }));
  }

  void sendInput(String input) {
    channel.sink.add(jsonEncode({
      'message_type': 'input',
      'data': input,
    }));
  }

  void close() {
    channel.sink.close();
  }
}
