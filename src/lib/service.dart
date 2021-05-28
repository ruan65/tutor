import 'package:grpc/src/server/call.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'core/questions_db_driver.dart';
import 'generated/tutor.pbgrpc.dart';

class TutorService extends TutorServiceBase {
  @override
  Future<Question> getQuestion(ServiceCall call, Empty request) async {
    return Question()
      ..id = 0
      ..text = 'How are you?';
  }

  @override
  Future<Evaluation> sendAnswer(ServiceCall call, Answer answer) async {
    final evaluation = Evaluation(id: 71, answerId: answer.id);

    await Future.delayed(Duration(seconds: 2));

    if (answer.text.contains('fine')) {
      return evaluation..score = 10;
    }
    return evaluation..score = 0;
  }

  @override
  Stream<Question> getQuestions(ServiceCall call, Empty request) async* {
    for (var question in questionsDb) {
      yield question;
      await Future.delayed(Duration(seconds: 1));
    }
  }

  @override
  Future<ExamEvaluation> sendAnswers(
      ServiceCall call, Stream<Answer> answersStream) async {
    var score = 0;
    await for (var answer in answersStream) {
      print(answer);
      score++;
    }
    return ExamEvaluation()..totalScore = score;
  }
}

class Server {
  Future<void> run() async {
    final server = grpc.Server([TutorService()]);
    await server.serve(port: 5555);
    print('serving on port ${server.port}');
  }
}

Future<void> main() async {
  final server = Server();
  await server.run();
}
