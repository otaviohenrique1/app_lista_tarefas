import 'dart:async';
import 'package:app_lista_tarefas/data/tarefa_inherited.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/components/appbar_header.dart';
import 'package:app_lista_tarefas/components/titulo.dart';
import 'package:app_lista_tarefas/data/tarefa_dao.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';
import 'package:app_lista_tarefas/pages/nova_tarefa.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/styles/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<List<TarefaModel>> streamController =
      StreamController<List<TarefaModel>>();

  @override
  Widget build(BuildContext context) {
    void addDataToStream() async {
      List<TarefaModel> newData = await TarefaDao().findAll();

      streamController.sink.add(newData);
    }

    addDataToStream();

    return Scaffold(
      appBar: const AppBarHeader(titulo: "Lista de tarefas"),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: StreamBuilder<List<TarefaModel>>(
            // stream: streamController.stream,
            stream: Stream.fromFuture(TarefaDao().findAll()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<TarefaModel>? tarefas = snapshot.data;

                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 70),
                  itemCount: tarefas!.length,
                  itemBuilder: (context, index) {
                    TarefaModel item = tarefas[index];

                    return Tarefa(tarefa: item);
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
            }),
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

class Tarefa extends StatefulWidget {
  const Tarefa({
    super.key,
    required this.tarefa,
  });

  final TarefaModel tarefa;

  @override
  State<Tarefa> createState() => _TarefaState();
}

class _TarefaState extends State<Tarefa> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    // _isChecked = (widget.tarefa.concluido == "Sim") ? true : false;

    var item = widget.tarefa;

    updateCheckbox(value) {
      setState(() {
        TarefaDao().update(
            TarefaModel(
              id: item.id,
              tarefa: item.tarefa,
              autor: item.autor,
              concluido: (_isChecked) ? "Não" : "Sim",
              dataCriacao: item.dataCriacao,
            ),
            item.id);
        _isChecked = value!;
      });
    }

    return Container(
      // key: Key(uuid),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text("${item.tarefa.substring(0, 40)}..."),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.autor),
            Text(item.dataCriacao),
            Text(item.concluido),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          side: BorderSide(color: Colors.black, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: Checkbox(
          value: _isChecked,
          onChanged: updateCheckbox,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                TarefaDao().delete(item.id);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
