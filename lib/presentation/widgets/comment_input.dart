import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_threads/presentation/bloc/comments/comments_cubit.dart';

class CommentInput extends StatefulWidget {
  const CommentInput({super.key});

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CommentsCubit>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              child: Text('M'),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Написать комментарий...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                final text = _controller.text.trim();
                if (text.isEmpty) return;

                cubit.addComment(text);
                _controller.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}