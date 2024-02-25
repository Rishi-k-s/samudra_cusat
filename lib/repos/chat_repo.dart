import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:samudra_ai/models/chat_message_model.dart';
import 'package:samudra_ai/utils/constants.dart';

class ChatRepo {
  static Future<String> chatTextGenerationRepo(
      List<ChatMessageModel> previousMessages) async {
    try {
      final dio = Dio();

      final response = await dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=${API_KEY}",
        data: {
          "contents": previousMessages.map((e) => e.toMap()).toList(),
          "generationConfig": {
            "temperature": 0.9,
            "topK": 1,
            "topP": 1,
            "maxOutputTokens": 2048,
            "stopSequences": [],
          },
          "safetySettings": [
            {
              "category": "HARM_CATEGORY_HARASSMENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_HATE_SPEECH",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
          ],
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final candidates = response.data?['candidates'];
        if (candidates is List && candidates.isNotEmpty) {
          final content = candidates.first?['content'];
          if (content is Map) {
            final parts = content['parts'];
            if (parts is List && parts.isNotEmpty) {
              final text = parts.first?['text'];
              if (text is String) {
                return text;
              }
            }
          }
        }
      }
    } catch (e, stackTrace) {
      log("Error in chatTextGenerationRepo: $e",
          error: e, stackTrace: stackTrace);
    }
    return ''; // Return a default value or handle it according to your needs
  }
}
