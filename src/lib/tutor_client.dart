import 'dart:async';

import 'package:grpc/grpc.dart';

import 'core/questions_db_driver.dart';
import 'generated/tutor.pbgrpc.dart';

class TutorConsoleClient {
  late final TutorClient stub;
  late final ClientChannel channel;

  TutorConsoleClient() {
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

  Future sendAnswers() async {
    final answersStream = StreamController<Answer>();

    final evaluation = stub.sendAnswers(answersStream.stream);

    for (var question in questionsDb) {
      answersStream.add(Answer()
        ..question = question
        ..id = question.id
        ..text = 'hz');
      await Future.delayed(Duration(seconds: 1));
    }
//     await answersStream.close();

    print(evaluation);
  }

  Future<void> callService() async {
//     await getQuestion();

//     await Future.delayed(Duration(seconds: 1));

//     await sendAnswer(Answer()
//       ..id = 100
//       ..text = 'I am fine');
    await questionsStream(Empty());
    await sendAnswers();
    await channel.shutdown();
  }
}

Future<void> main() async {
  final client = TutorConsoleClient();
  await client.callService();
}
