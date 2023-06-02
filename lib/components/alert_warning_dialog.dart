import 'package:flutter/material.dart';

alertWarningDialog({
  required BuildContext context,
  required String titulo,
  required Function()? onPressed,
}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Aviso!'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(titulo),
        ],
      ),
      icon: const Icon(
        Icons.warning_amber_rounded,
        size: 64,
      ),
      iconColor: Colors.red,
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          // onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Não'),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text('Sim'),
        ),
      ],
    ),
  );
}
