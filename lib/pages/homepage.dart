import 'package:app_lista_tarefas/components/titulo.dart';
import 'package:app_lista_tarefas/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tarefas/provider/tarefa_provider.dart';
import 'package:app_lista_tarefas/pages/nova_tarefa.dart';
import 'package:app_lista_tarefas/components/item_lista_tarefas.dart';
import 'package:app_lista_tarefas/components/appbar_header.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TarefaProvider tarefaProvider =
        Provider.of<TarefaProvider>(context, listen: false);

    tarefaProvider.findAll();

    return Scaffold(
      appBar: const AppBarHeader(titulo: "Lista de tarefas"),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: Consumer<TarefaProvider>(
          builder: (context, tarefaProvider, child) {
            return (tarefaProvider.listaTarefas.isEmpty)
                ? const Center(
                    child: Titulo(
                      titulo: "Lista Vazia",
                      alignment: Alignment.center,
                      color: vermelho,
                      fontSize: 32,
                      fontWeight: fontWeightBold,
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 70),
                    itemCount: tarefaProvider.listaTarefas.length,
                    itemBuilder: (context, index) {
                      TarefaModel item = tarefaProvider.listaTarefas[index];

                      return ItemListaTarefas(tarefa: item);
                    },
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: azul1,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NovaTarefa(),
              ));
        },
        tooltip: "Adicionar",
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: branco),
      ),
    );
  }
}
