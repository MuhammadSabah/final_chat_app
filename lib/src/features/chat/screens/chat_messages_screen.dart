import 'package:flutter/material.dart';

class ChatMessagesScreen extends StatefulWidget {
  const ChatMessagesScreen({super.key});

  @override
  State<ChatMessagesScreen> createState() => _ChatMessagesScreenState();
}

class _ChatMessagesScreenState extends State<ChatMessagesScreen> {
  bool isFieldActive = false;
  String? fieldValue;
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    textController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isFieldActive = textController.text.isNotEmpty;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0).copyWith(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 10, top: 2, bottom: 2),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade500),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Scrollbar(
                                controller: scrollController,
                                thumbVisibility: true,
                                child: TextField(
                                  onChanged: (String? value) {
                                    setState(() {
                                      fieldValue = value;
                                    });
                                  },
                                  textDirection: TextDirection.ltr,
                                  scrollController: scrollController,
                                  controller: textController,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.left,
                                  keyboardType: TextInputType.multiline,
                                  cursorWidth: 1,
                                  minLines: 1,
                                  maxLines: 4,
                                  decoration: const InputDecoration(
                                    hintText: 'Type a message...',
                                    isCollapsed: true,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  isFieldActive
                      ? const SizedBox()
                      : IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.image_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            // color: iconColor,
                          ),
                        ),
                  IconButton(
                    onPressed: () {
                      if (isFieldActive) {}
                    },
                    icon: Icon(
                      Icons.send_outlined,
                      color: isFieldActive
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
