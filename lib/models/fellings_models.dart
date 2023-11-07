class FellingModels{
  String id;
  String feeling;
  String date;

  FellingModels({
    required this.id,
    required this.feeling,
    required this.date,
  });

  // class utilizada para pegar informações no banco de dados
  FellingModels.fromMap(Map<String, dynamic> map)

    : id = map["id"],
      feeling = map["feeling"],
      date = map["date"];
      
  // class utililizada para enviar informações para o banco de dados
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "feeling": feeling,
      "date": date,
    };
  }
}