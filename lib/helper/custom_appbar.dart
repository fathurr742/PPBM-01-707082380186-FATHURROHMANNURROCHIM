// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppbar(
  String title,
) {
  return AppBar(
    foregroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        Image.asset(
          'assets/logo-rg.png',
          scale: 14,
        )
      ],
    ),
    backgroundColor: Colors.grey[700],
    elevation: 1,
    actions: const [],
  );
}
