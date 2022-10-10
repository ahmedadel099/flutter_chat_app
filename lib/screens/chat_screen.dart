import 'package:chat_ap_ui/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  late User user;
  late Chat chat;
  late String text;

  @override
  void initState() {
    user = Get.arguments[0];
    chat = Get.arguments[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      child: Scaffold(
        appBar: _CustomAppBar(
          user: user,
        ),
        body: CustomContainer(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                _ChatMessages(chat: chat , scrollController: scrollController,),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: textEditingController,
                  onChanged: (value) {
                    setState(() {
                      text = value;
                      print(text);
                    });
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withAlpha(150),
                      hintText: 'Type your message here ...',
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.all(20.0),
                      suffixIcon: IconButton(
                        onPressed: () {
                          Message message = Message(
                              senderId: '1',
                              recipientId: user.id,
                              text: text,
                              createdAt: DateTime.now());

                          List<Message> messages = List.from(chat.messages)
                            ..add(message);
                          messages.sort(
                              (a, b) => b.createdAt.compareTo(a.createdAt));

                          setState(() {
                            chat = chat.copyWith(messages: messages);
                          });

                          scrollController.animateTo(
                            scrollController.position.minScrollExtent,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );

                          textEditingController.clear();
                        },
                        icon: const Icon(Icons.send),
                      )),
                )
              ],
            )),
      ),
    );
  }
}

class _ChatMessages extends StatelessWidget {
  const _ChatMessages({
    Key? key,
    required this.chat,
    required this.scrollController,
  }) : super(key: key);

  final Chat chat;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
          shrinkWrap: true,
          reverse: true,
          itemCount: chat.messages.length,
          itemBuilder: (context, index) {
            Message message = chat.messages[index];
            return Align(
              alignment: (message.senderId == '1')
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.66,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: (message.senderId == '1')
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                ),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(message.text),
              ),
            );
          }),
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            '${user.name} ${user.surname}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Online',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      elevation: 0,
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.imageUrl),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
