import 'package:app_lista_tarefas/components/appbar_header.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';
import 'package:app_lista_tarefas/pages/nova_tarefa.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHeader(titulo: "Lista de tarefas"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 24, bottom: 70),
          itemCount: listaTarefas.length,
          itemBuilder: (context, index) {
            List<TarefaModel> lista = listaTarefas;
            TarefaModel item = lista[index];
            String tarefa = "${item.tarefa.substring(0, 40)}...";
            String autor = item.autor;
            String dataHora = item.dataCriacao;

            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                title: Text(tarefa),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(autor),
                    Text(dataHora),
                  ],
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  side: BorderSide(color: Colors.black, width: 1),
                ),
              ),
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

final List<TarefaModel> listaTarefas = [
  TarefaModel(
    id: "46aa7b8d-2d6b-4e8a-9986-ca852226d213",
    tarefa:
        "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit tempora facere odit nulla veritatis eum porro ex non esse magni laborum sed, temporibus eligendi accusantium ut adipisci, aliquid alias dignissimos.",
    autor: "Jeca",
    concluido: false,
    dataCriacao: "31/05/2023 20:43:47",
  ),
  TarefaModel(
    id: "f18dd68f-0af6-417e-8947-bfdd4dded1a1",
    tarefa:
        "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Officiis maiores illo neque mollitia est ex voluptas quis, iusto pariatur fugit explicabo tempore necessitatibus nesciunt exercitationem deserunt quam. Labore, eligendi dolore?",
    autor: "Jeca",
    concluido: false,
    dataCriacao: "31/05/2023 20:43:47",
  ),
  TarefaModel(
    id: "32ce842d-a08e-4152-aa2b-71167c1a0874",
    tarefa:
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit eum hic esse quo ad explicabo beatae natus unde ex recusandae, voluptas quidem nihil, blanditiis nulla dolores ipsa odio aperiam ea.",
    autor: "Jeca",
    concluido: false,
    dataCriacao: "31/05/2023 20:43:47",
  ),
  TarefaModel(
    id: "eef1715b-4e6f-4a99-bdde-d7c7745d3275",
    tarefa:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Blanditiis necessitatibus, soluta commodi vero quasi magnam dolorem excepturi itaque libero ullam sed ipsum, iusto perspiciatis accusamus, odit veniam quas deserunt! Dicta.",
    autor: "Jeca",
    concluido: false,
    dataCriacao: "31/05/2023 20:43:47",
  ),
  TarefaModel(
    id: "35ba0db1-8ade-4b8a-9e77-eddc91474184",
    tarefa:
        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ad, deleniti? Dolorem repellendus eveniet quos amet, aliquid, reiciendis fugit ut a ratione culpa quas laudantium nesciunt quia itaque hic saepe. Ducimus!",
    autor: "Jeca",
    concluido: false,
    dataCriacao: "31/05/2023 20:43:47",
  ),
  TarefaModel(
    id: "59fdc1ee-1471-4449-a0ac-448807743634",
    tarefa:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Laborum quas voluptatibus eius esse, doloribus accusantium ea consectetur beatae sapiente quisquam nisi perferendis, asperiores maiores exercitationem nulla quos reiciendis eum minus?",
    autor: "Jeca",
    concluido: false,
    dataCriacao: "31/05/2023 20:43:47",
  ),
  TarefaModel(
    id: "1bc46dc4-3719-4084-8a67-e7b758df2aaf",
    tarefa:
        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed error pariatur perspiciatis non adipisci dolor perferendis commodi, ratione nesciunt facere suscipit vitae et sit! Sequi aliquid iste quasi impedit possimus.",
    autor: "Jeca",
    concluido: false,
    dataCriacao: "31/05/2023 20:43:47",
  ),
  TarefaModel(
    id: "ec66e7c1-a981-4527-b69b-886e633a7485",
    tarefa:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Non quibusdam ut amet totam fugiat ipsum nulla cupiditate? Iste temporibus quas dolor fugit debitis fugiat exercitationem ipsa eum nesciunt, ea molestiae?",
    autor: "Jeca",
    concluido: false,
    dataCriacao: "31/05/2023 20:43:47",
  ),
  TarefaModel(
    id: "8594a41b-126e-4b2e-960c-9e6a1e53c65e",
    tarefa:
        "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Placeat necessitatibus molestias expedita, tenetur repudiandae, praesentium corrupti consectetur corporis explicabo perferendis omnis alias beatae earum nobis doloribus, delectus debitis inventore nam.",
    autor: "Jeca",
    concluido: false,
    dataCriacao: "31/05/2023 20:43:47",
  ),
  TarefaModel(
    id: "00442774-fd95-4ff9-8ca9-f6c3eb73517a",
    tarefa:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis amet tempora quaerat sapiente sit quis iusto saepe excepturi id, earum delectus? Harum tenetur velit nulla mollitia. Provident, dolor aut. Voluptates!",
    autor: "Jeca",
    concluido: false,
    dataCriacao: "31/05/2023 20:43:47",
  ),
];
