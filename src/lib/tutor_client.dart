import 'package:grpc/grpc.dart';

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

  Future<void> callService() async {
    await getQuestion();
    await channel.shutdown();
  }
}

Future<void> main() async {
  final client = TutorConsoleClient();
  await client.callService();
}
