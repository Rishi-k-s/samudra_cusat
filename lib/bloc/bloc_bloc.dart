import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:samudra_ai/models/chat_message_model.dart';
import 'package:samudra_ai/repos/chat_repo.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  List<ChatMessageModel> messages = [];
  bool generating = false;

  BlocBloc() : super(ChatSuccessState(messages: [])) {
    on<ChatGenerateNewTextMessageEvent>((event, Emitter<BlocState> emit) async {
      messages.add(ChatMessageModel(
          role: "user", parts: [ChatPartModel(text: event.inputMessage)]));

      emit(ChatSuccessState(messages: messages));
      generating = true;
      String generatedText = await ChatRepo.chatTextGenerationRepo(messages);
      if (generatedText.length > 0) {
        messages.add(ChatMessageModel(
            role: 'model', parts: [ChatPartModel(text: generatedText)]));
        emit(ChatSuccessState(messages: messages));
      }
      generating = false;
    });
  }
}
