import 'package:app_lista_tarefas/components/alert_warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tarefas/pages/editar_tarefa.dart';
import 'package:app_lista_tarefas/pages/homepage.dart';
import 'package:app_lista_tarefas/components/botao.dart';
import 'package:app_lista_tarefas/components/item_tarefa_detalhes.dart';
import 'package:app_lista_tarefas/components/appbar_header.dart';
import 'package:app_lista_tarefas/provider/tarefa_provider.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';

class TarefaDetalhes extends StatefulWidget {
  const TarefaDetalhes({
    super.key,
    required this.idTarefa,
  });

  final String idTarefa;

  @override
  State<TarefaDetalhes> createState() => _TarefaDetalhesState();
}

class _TarefaDetalhesState extends State<TarefaDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHeader(titulo: "Dados da tarefa"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Consumer<TarefaProvider>(
            builder: (context, tarefaProvider, child) {
              tarefaProvider.findById(widget.idTarefa);
              TarefaModel dados = tarefaProvider.dadosTarefa;

              return Column(
                children: [
                  ItemTarefaDetalhes(
                    titulo: "ID:",
                    descricao: dados.id,
                  ),
                  const SizedBox(height: 16),
                  ItemTarefaDetalhes(
                    titulo: "Titulo:",
                    descricao: dados.titulo,
                  ),
                  const SizedBox(height: 16),
                  ItemTarefaDetalhes(
                    titulo: "Tarefa:",
                    descricao: dados.tarefa,
                  ),
                  const SizedBox(height: 16),
                  ItemTarefaDetalhes(
                    titulo: "Autor:",
                    descricao: dados.autor,
                  ),
                  const SizedBox(height: 16),
                  ItemTarefaDetalhes(
                    titulo: "Concluido:",
                    descricao: dados.concluido,
                  ),
                  const SizedBox(height: 16),
                  ItemTarefaDetalhes(
                    titulo: "Data e hora de criação",
                    descricao: dados.dataCriacao,
                  ),
                  const SizedBox(height: 16),
                  Botao(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditarTarefa(idTarefa: widget.idTarefa),
                        ),
                      );
                    },
                    fontColor: branco,
                    label: "Editar",
                    backgroundColor: azul1,
                  ),
                  const SizedBox(height: 8),
                  Consumer<TarefaProvider>(
                    builder: (context, providerTarefaModel, child) {
                      return Botao(
                        onPressed: () {
                          alertWarningDialog(
                            context: context,
                            titulo: "Deseja remover a tarefa?",
                            onPressed: () {
                              // Navigator.pop(context);
                              Navigator.pop(context, 'OK');
                              providerTarefaModel.delete(widget.idTarefa);
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                          );
                        },
                        fontColor: branco,
                        label: "Remover",
                        backgroundColor: azul1,
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
