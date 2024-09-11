// JDoodle WebSocket management

import 'dart:io';
import 'jdoodle_auth.dart';

class JDoodleWebSocket {
  WebSocket? _channel;
  late String _token;

  Future<void> connect(String clientId, String clientSecret) async {
    _token = await JDoodleAuth.getAuthToken(clientId, clientSecret);
    _channel = await WebSocket.connect(
      'wss://api.jdoodle.com/v1/stomp',
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );
  }

  Future<void> sendCode({required String clientId, required String clientSecret, required String code, required String language}) async {
    if (_channel != null) {
      _channel!.add('{"clientId": "$clientId","clientSecret": "$clientSecret", "language": "$language", "script": "$code", "versionIndex": "0"}');
    }
  }

  void close() {
    if (_channel != null) {
      _channel!.close();
    }
  }

  Stream<String> get output async* {
    if (_channel != null) {
      await for (var message in _channel!) {
        yield message;
      }
    }
  }
}