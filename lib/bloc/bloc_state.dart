part of 'bloc_bloc.dart';

@immutable
sealed class BlocState {}

final class BlocInitial extends BlocState {}

class ChatSuccessState extends BlocState {
  final List<ChatMessageModel> messages;
  ChatSuccessState({
    required this.messages,
  });
}
