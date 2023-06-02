import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tarefas/components/botao.dart';
import 'package:app_lista_tarefas/components/campo_texto.dart';
import 'package:app_lista_tarefas/components/snackbar_mensagem.dart';
import 'package:app_lista_tarefas/components/appbar_header.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';
import 'package:app_lista_tarefas/provider/tarefa_provider.dart';
import 'package:app_lista_tarefas/utils/validator.dart';

class EditarTarefa extends StatefulWidget {
  const EditarTarefa({
    super.key,
    required this.idTarefa,
  });
  final String idTarefa;

  @override
  State<EditarTarefa> createState() => _EditarTarefaState();
}

class _EditarTarefaState extends State<EditarTarefa> {
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
    TarefaProvider providerTarefa =
        Provider.of<TarefaProvider>(context, listen: false);

    providerTarefa.findById(widget.idTarefa);
    TarefaModel tarefa = providerTarefa.dadosTarefa;

    _tarefaController.text = tarefa.tarefa;
    _autorController.text = tarefa.autor;
    String id = tarefa.id;
    String dataCriacao = tarefa.dataCriacao;
    String concluido = tarefa.concluido;

    return Scaffold(
      appBar: const AppBarHeader(titulo: "Nova tarefa"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Consumer<TarefaProvider>(
            builder: (context, providerTarefaModel, child) {
              return Form(
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
                    Botao(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            String tarefa = _tarefaController.text;
                            String autor = _autorController.text;
                            TarefaModel novaTarefa = TarefaModel(
                              id: id,
                              tarefa: tarefa,
                              concluido: concluido,
                              autor: autor,
                              dataCriacao: dataCriacao,
                            );
                            providerTarefaModel.update(novaTarefa, id);
                            mensagemSnackBar(
                              context: context,
                              mensagem: "Tarefa atualizada com sucesso!",
                            );
                            Navigator.pop(context);
                          });
                        }
                      },
                      fontColor: branco,
                      label: "Salvar",
                      backgroundColor: azul1,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
