class ContohModel {
  ContohModel({
    required this.testName,
    required this.totalParticipant,
    required this.createdDate,
    required this.minimumScore,
    required this.questions,
    required this.trainingTestId,
  });
  late final String testName;
  late final int totalParticipant;
  late final String createdDate;
  late final int minimumScore;
  late final List<Questions> questions;
  late final int trainingTestId;
  
  ContohModel.fromJson(Map<String, dynamic> json){
    testName = json['testName'];
    totalParticipant = json['totalParticipant'];
    createdDate = json['createdDate'];
    minimumScore = json['minimumScore'];
    questions = List.from(json['questions']).map((e)=>Questions.fromJson(e)).toList();
    trainingTestId = json['trainingTestId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['testName'] = testName;
    _data['totalParticipant'] = totalParticipant;
    _data['createdDate'] = createdDate;
    _data['minimumScore'] = minimumScore;
    _data['questions'] = questions.map((e)=>e.toJson()).toList();
    _data['trainingTestId'] = trainingTestId;
    return _data;
  }
}

class Questions {
  Questions({
    required this.questionId,
    required this.answer,
    required this.question,
    required this.optionsType,
    required this.questionPage,
  });
  late final int questionId;
  late final String answer;
  late final String question;
  late final String optionsType;
  late final int questionPage;
  
  Questions.fromJson(Map<String, dynamic> json){
    questionId = json['questionId'];
    answer = json['answer'];
    question = json['question'];
    optionsType = json['optionsType'];
    questionPage = json['questionPage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['questionId'] = questionId;
    _data['answer'] = answer;
    _data['question'] = question;
    _data['optionsType'] = optionsType;
    _data['questionPage'] = questionPage;
    return _data;
  }
}