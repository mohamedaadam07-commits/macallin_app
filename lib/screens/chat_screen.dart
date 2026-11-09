import 'package:flutter/material.dart';

import '../app_colors.dart';

class ChatScreen extends StatefulWidget {
  final String teacherName;

  const ChatScreen({super.key, this.teacherName = 'Ahmed Mohamed'});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  final List<_Message> _messages = [
    _Message(
      text: 'Salaan, ma la wadaagi karnaa waqtiga?',
      time: '4:42 PM',
      isMe: false,
    ),
    _Message(
      text: 'Haa, 5 PM Isniin ma kuu fiicantahay?',
      time: '4:45 PM',
      isMe: true,
    ),
    _Message(
      text: 'Waa fiican, waan ku aqbalay!',
      time: '4:47 PM',
      isMe: false,
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();

    if (text.isEmpty) return;

    setState(() {
      _messages.add(_Message(text: text, time: 'Now', isMe: true));
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];

                return _ChatBubble(
                  text: message.text,
                  time: message.time,
                  isMe: message.isMe,
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      titleSpacing: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
      ),
      title: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0E5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.person_rounded,
                  color: AppColors.primary,
                  size: 25,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 11),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.teacherName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Online • Macallin',
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF22A55A),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildMessageInput() {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(top: BorderSide(color: Color(0xFFE5E7EB))),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.attach_file_rounded, color: AppColors.primary),
            ),
            Expanded(
              child: TextField(
                controller: _messageController,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _sendMessage(),
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 13,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF5F6F8),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 13,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Material(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: _sendMessage,
                borderRadius: BorderRadius.circular(16),
                child: const SizedBox(
                  width: 48,
                  height: 48,
                  child: Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 21,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isMe;

  const _ChatBubble({
    required this.text,
    required this.time,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.78,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.fromLTRB(15, 11, 15, 9),
        decoration: BoxDecoration(
          color: isMe ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isMe ? 18 : 5),
            bottomRight: Radius.circular(isMe ? 5 : 18),
          ),
          border: isMe ? null : Border.all(color: const Color(0xFFE5E7EB)),
          boxShadow: [
            if (!isMe)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.025),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : const Color(0xFF1F2937),
                fontSize: 14,
                height: 1.45,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: isMe
                        ? Colors.white.withValues(alpha: 0.75)
                        : const Color(0xFF9CA3AF),
                    fontSize: 10,
                  ),
                ),
                if (isMe) ...[
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.done_all_rounded,
                    size: 14,
                    color: Colors.white70,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Message {
  final String text;
  final String time;
  final bool isMe;

  const _Message({required this.text, required this.time, required this.isMe});
}
