// ignore_for_file: non_constant_identifier_names

import "package:flutter/material.dart";

Widget custom_icon(
    IconData icon, String namaIcon, double size, VoidCallback onTap) {
  //iconbutton with text
  return Material(
    color: Colors.transparent,
    child: InkWell(
      radius: 5,
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: size),
          SizedBox(
            width: 80,
            child: Text(
              textAlign: TextAlign.center,
              namaIcon,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    ),
  );
}
