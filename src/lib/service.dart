import 'package:grpc/src/server/call.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'generated/tutor.pbgrpc.dart';

class TutorService extends TutorServiceBase {
  @override
  Future<Question> getQuestion(ServiceCall call, Empty request) async {
    return Question()
      ..id = 0
      ..text = 'How are you?';
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
