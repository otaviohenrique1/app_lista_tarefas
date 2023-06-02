import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/components/titulo.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/styles/fonts.dart';

class ItemTarefaDetalhes extends StatelessWidget {
  const ItemTarefaDetalhes({
    super.key,
    required this.titulo,
    required this.descricao,
  });

  final String titulo;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: preto, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Titulo(
              titulo: titulo,
              alignment: Alignment.centerLeft,
              color: preto,
              fontSize: 16,
              fontWeight: fontWeightBold,
            ),
            Titulo(
              titulo: descricao,
              alignment: Alignment.centerRight,
              color: preto,
              fontSize: 18,
              fontWeight: fontWeightRegular,
            ),
          ],
        ),
      ),
    );
  }
}
