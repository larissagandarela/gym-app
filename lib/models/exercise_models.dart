class ExerciseModels{
  String id;
  String name;
  String training;
  String howToDo;

  String? urlImage;

  ExerciseModels({
    required this.id,
    required this.name,
    required this.training,
    required this.howToDo,
  });

  // class utilizada para pegar informações no banco de dados
  ExerciseModels.fromMap(Map<String, dynamic> map)

    : id = map["id"],
      name = map["name"],
      training = map["training"],
      howToDo = map["howToDo"],
      urlImage = map["urlImage"];
  
  // class utililizada para enviar informações para o banco de dados
  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "training": training,
      "howToDo": howToDo,
      "urlImage": urlImage,
    };
  }
}