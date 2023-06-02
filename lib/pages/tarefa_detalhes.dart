import 'package:app_lista_tarefas/components/botao.dart';
import 'package:app_lista_tarefas/pages/editar_tarefa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tarefas/components/titulo.dart';
import 'package:app_lista_tarefas/components/appbar_header.dart';
import 'package:app_lista_tarefas/provider/tarefa_provider.dart';
import 'package:app_lista_tarefas/styles/fonts.dart';
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
                  Consumer<TarefaProvider>(
                    builder: (context, providerTarefaModel, child) {
                      return Botao(
                        onPressed: () {
                          providerTarefaModel.delete(widget.idTarefa);
                        },
                        fontColor: branco,
                        label: "Remover",
                        backgroundColor: azul1,
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

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
              fontSize: 20,
              fontWeight: fontWeightRegular,
            ),
          ],
        ),
      ),
    );
  }
}
