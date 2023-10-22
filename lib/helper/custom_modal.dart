import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  final String title;
  final Widget content;
  final Widget actions;

  const CustomModal({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 225,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          content,
          const SizedBox(
            height: 15,
          ),
          actions,
        ],
      ),
    );
  }
}
