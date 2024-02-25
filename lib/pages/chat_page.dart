import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:samudra_ai/bloc/bloc_bloc.dart';
import 'package:samudra_ai/models/chat_message_model.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final BlocBloc blocBloc = BlocBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    blocBloc.close(); // Close the bloc when the widget is disposed
    textEditingController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BlocBloc, BlocState>(
        bloc: blocBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messages;
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          Text(
                            'Chat Bots',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color.fromRGBO(20, 17, 99, 1)),
                          ),
                          Icon(
                            Icons.image_search,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                                top: 12, left: 10, right: 10),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color.fromARGB(24, 24, 103, 105),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  messages[index].role == 'user'
                                      ? "User"
                                      : "AI",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Text(messages[index].parts.first.text),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    if (blocBloc.generating)
                      Row(
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              child: Lottie.asset('assets/loader.json')),
                        ],
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'Message...',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                fillColor:
                                    const Color.fromRGBO(96, 221, 142, 1),
                                filled: true,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                String text = textEditingController.text;
                                textEditingController.clear();
                                blocBloc.add(
                                  ChatGenerateNewTextMessageEvent(
                                    inputMessage: text,
                                  ),
                                );
                              }
                            },
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundColor: Color.fromRGBO(63, 159, 127, 1),
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
