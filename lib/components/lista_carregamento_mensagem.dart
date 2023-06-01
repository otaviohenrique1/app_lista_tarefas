import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/components/titulo.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/styles/fonts.dart';

class ListaCarregamentoMensagem extends StatelessWidget {
  const ListaCarregamentoMensagem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Titulo(
            titulo: "Carregando!!!",
            color: preto,
            alignment: Alignment.center,
            fontSize: 32,
            fontWeight: fontWeightBold,
          ),
        ],
      ),
    );
  }
}
