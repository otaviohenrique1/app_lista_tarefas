import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tarefas/components/botao.dart';
import 'package:app_lista_tarefas/components/campo_texto.dart';
import 'package:app_lista_tarefas/components/snackbar_mensagem.dart';
import 'package:app_lista_tarefas/components/appbar_header.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';
import 'package:app_lista_tarefas/provider/tarefa_provider.dart';
import 'package:app_lista_tarefas/utils/helpers.dart';
import 'package:app_lista_tarefas/utils/listas.dart';
import 'package:app_lista_tarefas/utils/validator.dart';

class NovaTarefa2 extends StatefulWidget {
  const NovaTarefa2({super.key});

  @override
  State<NovaTarefa2> createState() => _NovaTarefa2State();
}

class _NovaTarefa2State extends State<NovaTarefa2> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _tarefaController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();

  @override
  void dispose() {
    _tarefaController.dispose();
    _autorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHeader(titulo: "Nova tarefa"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CampoTexto(
                  exibeLabel: true,
                  label: "Tarefa",
                  maxLines: 10,
                  keyboardType: TextInputType.text,
                  controller: _tarefaController,
                  hintText: "Digite a tarefa",
                  obscureText: false,
                  validator: validaCampoVazio,
                ),
                const SizedBox(height: 20),
                CampoTexto(
                  exibeLabel: true,
                  label: "Autor",
                  validator: validaCampoVazio,
                  keyboardType: TextInputType.text,
                  controller: _autorController,
                  hintText: "Digite o nome do autor",
                  obscureText: false,
                ),
                const SizedBox(height: 32),
                Consumer<TarefaProvider2>(
                  builder: (context, providerTarefaModel, child) {
                    return Botao(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            String id = geraUuid();
                            String tarefa = _tarefaController.text;
                            String autor = _autorController.text;
                            String dataCriacao = geraDataHoraFormatada();
                            String concluido = "Não";
                            TarefaModel novaTarefa = TarefaModel(
                              id: id,
                              tarefa: tarefa,
                              concluido: concluido,
                              autor: autor,
                              dataCriacao: dataCriacao,
                            );
                            providerTarefaModel.save(novaTarefa);
                            _tarefaController.clear();
                            _autorController.clear();
                            mensagemSnackBar(
                              context: context,
                              mensagem: "Tarefa salva",
                            );
                            Navigator.pop(context);
                          });
                        }
                      },
                      fontColor: branco,
                      label: "Salvar",
                      backgroundColor: azul1,
                    );
                  },
                ),
                const SizedBox(height: 8),
                Botao(
                  onPressed: () {
                    setState(() {
                      _tarefaController.text = listaTarefas[
                              Random().nextInt(listaTarefas.length - 1)]
                          .tarefa;
                      _autorController.text = "Jeca";
                    });
                  },
                  fontColor: branco,
                  label: "Dados",
                  backgroundColor: azul1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
