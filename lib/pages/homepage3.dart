import 'dart:async';
import 'package:app_lista_tarefas/pages/nova_tarefa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tarefas/components/item_lista_tarefas.dart';
import 'package:app_lista_tarefas/components/appbar_header.dart';
import 'package:app_lista_tarefas/components/titulo.dart';
import 'package:app_lista_tarefas/provider/tarefa_provider.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/styles/fonts.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  StreamController<List<TarefaModel>> streamController =
      StreamController<List<TarefaModel>>();

  @override
  Widget build(BuildContext context) {
    TarefaProvider tarefaProvider =
        Provider.of<TarefaProvider>(context, listen: false);

    void addDataToStream() async {
      List<TarefaModel> newData = tarefaProvider.listaTarefas;
      tarefaProvider.findAll();

      streamController.sink.add(newData);
    }

    addDataToStream();

    return Scaffold(
      appBar: const AppBarHeader(titulo: "Lista de tarefas"),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: Consumer<TarefaProvider>(
          builder: (context, providerListaTarefa, child) {
            return StreamBuilder<List<TarefaModel>>(
              stream: streamController.stream,
              // stream: Stream.fromFuture(TarefaDao().findAll()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<TarefaModel>? tarefas = snapshot.data;

                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 70),
                    itemCount: tarefas!.length,
                    itemBuilder: (context, index) {
                      TarefaModel item = tarefas[index];

                      return ItemListaTarefas(tarefa: item);
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Titulo(
                    titulo: "Erro ao carregar a lista de tarefas",
                    color: vermelho,
                    alignment: Alignment.center,
                    fontSize: 24,
                    fontWeight: fontWeightBold,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
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
