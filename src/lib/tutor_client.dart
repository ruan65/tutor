import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:pedantic/pedantic.dart';

import 'core/questions_db_driver.dart';
import 'generated/tutor.pbgrpc.dart';

class TutorConsoleClient {
  late final TutorClient stub;
  late final ClientChannel channel;
  late final String arg;

  TutorConsoleClient(this.arg) {
    channel = ClientChannel('127.0.0.1',
        port: 5555,
        options: ChannelOptions(credentials: ChannelCredentials.insecure()));
    stub = TutorClient(channel);
  }

  Future<Question> getQuestion() async {
    final question = await stub.getQuestion(Empty());
    print('got question: $question');
    return question;
  }

  Future<void> questionsStream(Empty request) async {
    await for (var question in stub.getQuestions(request)) {
      print(question);
    }
  }

  Future sendAnswer(Answer answer) async {
    final evaluation = await stub.sendAnswer(answer);
    print('your score is ${evaluation.score}');
  }

  Future<ExamEvaluation> sendAnswers() async {
    final answersStream = StreamController<Answer>();

    final evaluation = stub.sendAnswers(answersStream.stream);

    for (var question in questionsDb) {
      answersStream.add(Answer()
        ..question = question
        ..id = question.id
        ..text = arg);
      await Future.delayed(Duration(seconds: 2));
    }

    unawaited(answersStream.close());

    return evaluation;
  }

  Future liveEvaluation() async {
    final answersStream = StreamController<Answer>();
    final questionsStream = stub.liveEvaluation(answersStream.stream);

    questionsStream.listen((question) {
      print('got live question: $question');
      final id = question.id;

      final answer = Answer()
        ..question = question
        ..id = 777
        ..text = 'yes+$id';
      answersStream.add(answer);
    });
  }

  Future<void> callService() async {
//     await getQuestion();

//     await Future.delayed(Duration(seconds: 1));

//     await sendAnswer(Answer()
//       ..id = 100
//       ..text = 'I am fine');
//     await questionsStream(Empty());
//     final evaluation = await sendAnswers();
//     print(evaluation);
//     await channel.shutdown();
    await liveEvaluation();
  }
}

Future<void> main(List<String> args) async {
  print('arg0: ${args[0]}');
  final client = TutorConsoleClient(args[0]);
  await client.callService();
}
