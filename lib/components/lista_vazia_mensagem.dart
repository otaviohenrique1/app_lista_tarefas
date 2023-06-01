import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/components/titulo.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/styles/fonts.dart';

class ListaVaziaMensagem extends StatelessWidget {
  const ListaVaziaMensagem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 32),
          Icon(
            Icons.error_outline,
            size: 96,
            color: vermelho,
          ),
          SizedBox(height: 16),
          Titulo(
            titulo: "Lista vazia",
            color: cinza1,
            alignment: Alignment.center,
            fontSize: 32,
            fontWeight: fontWeightBold,
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
