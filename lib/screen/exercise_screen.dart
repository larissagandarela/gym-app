import 'package:flutter/material.dart';
import 'package:gym_app/_core/my_colors.dart';
import 'package:gym_app/models/exercise_models.dart';
import 'package:gym_app/models/fellings_models.dart';

class ExerciseScreen extends StatelessWidget {
  ExerciseScreen({super.key});

  final ExerciseModels exerciseModels = ExerciseModels(
    id: "Ex001",
    name: "[nome do exercicio]",
    training: "tipo de treino",
    howToDo: "utiliza barra");

  final List<FellingModels> listFeelings = [
    FellingModels(
      id: "Ex001",
      feeling: "não sei o que estou sentindo",
      date: "2023-11-05"),

    FellingModels(
      id: "Ex001",
      feeling: "não sei o que estou sentindo (2)",
      date: "2023-11-06")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              exerciseModels.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              exerciseModels.training,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: MyColors.darkBlue,
        elevation: 0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Foi clicado");
      }, 
      child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: (){},
                    child: const Text("Enviar foto"),
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: const Text("Tirar foto"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Como fazer?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(exerciseModels.howToDo),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black),
            ),
            const Text(
              "Como estou me sentindo?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listFeelings.length, (index){
                FellingModels feelingNow = listFeelings[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(feelingNow.feeling),
                  subtitle: Text(feelingNow.date),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: (){
                      print("Deletar ${feelingNow.feeling}");
                    },),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}