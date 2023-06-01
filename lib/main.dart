import 'package:flutter/material.dart';
// import 'package:app_lista_tarefas/data/tarefa_inherited.dart';
import 'package:app_lista_tarefas/pages/homepage.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      // home: TarefaInherited(child: const HomePage()),
    );
  }
}
