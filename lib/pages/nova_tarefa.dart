import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/components/appbar_header.dart';
import 'package:app_lista_tarefas/components/titulo.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/styles/fonts.dart';

class NovaTarefa extends StatefulWidget {
  const NovaTarefa({super.key});

  @override
  State<NovaTarefa> createState() => _NovaTarefaState();
}

class _NovaTarefaState extends State<NovaTarefa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHeader(titulo: "Nova tarefa"),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Titulo(
                titulo: "Nova tarefa",
                color: preto,
                alignment: Alignment.center,
                fontSize: 32,
                fontWeight: fontWeightBold,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: azul1,
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: "Adicionar",
        shape: const CircleBorder(),
        child: const Icon(Icons.arrow_back, color: branco),
      ),
    );
  }
}
