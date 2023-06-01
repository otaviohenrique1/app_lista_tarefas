import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/components/titulo.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/styles/fonts.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> mensagemSnackBar({
  required BuildContext context,
  required String mensagem,
}) {
  // ScaffoldMessenger.of(widget.taskContext).showSnackBar(
  // ScaffoldMessenger.of(context).showSnackBar(
  //   const SnackBar(
  //     content: Titulo(
  //       titulo: "Contato adicionado com sucesso",
  //       alignment: Alignment.center,
  //       color: branco,
  //       fontSize: 16,
  //       fontWeight: fontWeightRegular,
  //     ),
  //   ),
  // );
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Titulo(
        titulo: mensagem,
        alignment: Alignment.centerLeft,
        color: branco,
        fontSize: 16,
        fontWeight: fontWeightRegular,
      ),
    ),
  );
}
