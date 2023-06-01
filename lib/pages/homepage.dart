import 'dart:async';

import 'package:app_lista_tarefas/components/appbar_header.dart';
import 'package:app_lista_tarefas/components/lista_carregamento_mensagem.dart';
import 'package:app_lista_tarefas/components/lista_vazia_mensagem.dart';
import 'package:app_lista_tarefas/components/titulo.dart';
import 'package:app_lista_tarefas/data/tarefa_dao.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';
import 'package:app_lista_tarefas/pages/nova_tarefa.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/styles/fonts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    StreamController<List<TarefaModel>> _streamController =
        StreamController<List<TarefaModel>>();

    var dados = Stream.fromFuture(TarefaDao().findAll());

    return Scaffold(
      appBar: const AppBarHeader(titulo: "Lista de tarefas"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: StreamBuilder<List<TarefaModel>>(
            stream: dados,
            builder: (context, snapshot) {
              List<TarefaModel>? tarefas = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const ListaCarregamentoMensagem();
                // break;
                case ConnectionState.waiting:
                  return const ListaCarregamentoMensagem();
                // break;
                case ConnectionState.active:
                  return const ListaCarregamentoMensagem();
                // break;
                case ConnectionState.done:
                  if (snapshot.hasData && tarefas != null) {
                    if (tarefas.isNotEmpty) {
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 24, bottom: 70),
                        itemCount: tarefas.length,
                        itemBuilder: (context, index) {
                          TarefaModel item = tarefas[index];
                          String tarefa = "${item.tarefa.substring(0, 40)}...";
                          String autor = item.autor;
                          String dataHora = item.dataCriacao;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              title: Text(tarefa),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(autor),
                                  Text(dataHora),
                                ],
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const ListaVaziaMensagem();
                  }
                  return const Titulo(
                    titulo: "Erro ao carregar a lista de contatos",
                    color: vermelho,
                    alignment: Alignment.center,
                    fontSize: 24,
                    fontWeight: fontWeightBold,
                  );
                default:
                  return const Titulo(
                    titulo: "Erro desconhecido!!!",
                    color: vermelho,
                    alignment: Alignment.center,
                    fontSize: 32,
                    fontWeight: fontWeightBold,
                  );
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
