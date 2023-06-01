import 'package:app_lista_tarefas/components/botao.dart';
import 'package:app_lista_tarefas/components/campo_texto.dart';
import 'package:app_lista_tarefas/components/snackbar_mensagem.dart';
import 'package:app_lista_tarefas/data/tarefa_dao.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';
import 'package:app_lista_tarefas/utils/helpers.dart';
import 'package:app_lista_tarefas/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/components/appbar_header.dart';
import 'package:app_lista_tarefas/styles/cores.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
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
                Botao(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        String id = geraUuid();
                        String tarefa = _tarefaController.text;
                        String autor = _autorController.text;
                        String dataCriacao = geraDataHoraFormatada();
                        bool concluido = false;
                        TarefaModel novaTarefa = TarefaModel(
                          id: id,
                          tarefa: tarefa,
                          concluido: concluido,
                          autor: autor,
                          dataCriacao: dataCriacao,
                        );
                        TarefaDao().save(novaTarefa);
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
                )
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: azul1,
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   tooltip: "Adicionar",
      //   shape: const CircleBorder(),
      //   child: const Icon(Icons.arrow_back, color: branco),
      // ),
    );
  }
}
