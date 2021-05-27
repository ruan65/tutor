///
//  Generated code. Do not modify.
//  source: tutor.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tutor.pb.dart' as $0;
export 'tutor.pb.dart';

class TutorClient extends $grpc.Client {
  static final _$getQuestion = $grpc.ClientMethod<$0.Empty, $0.Question>(
      '/Tutor/getQuestion',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Question.fromBuffer(value));
  static final _$sendAnswer = $grpc.ClientMethod<$0.Answer, $0.Evaluation>(
      '/Tutor/sendAnswer',
      ($0.Answer value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Evaluation.fromBuffer(value));
  static final _$getQuestions = $grpc.ClientMethod<$0.Empty, $0.Question>(
      '/Tutor/getQuestions',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Question.fromBuffer(value));

  TutorClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Question> getQuestion($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getQuestion, request, options: options);
  }

  $grpc.ResponseFuture<$0.Evaluation> sendAnswer($0.Answer request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendAnswer, request, options: options);
  }

  $grpc.ResponseStream<$0.Question> getQuestions($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getQuestions, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class TutorServiceBase extends $grpc.Service {
  $core.String get $name => 'Tutor';

  TutorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Question>(
        'getQuestion',
        getQuestion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Question value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Answer, $0.Evaluation>(
        'sendAnswer',
        sendAnswer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Answer.fromBuffer(value),
        ($0.Evaluation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Question>(
        'getQuestions',
        getQuestions_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Question value) => value.writeToBuffer()));
  }

  $async.Future<$0.Question> getQuestion_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getQuestion(call, await request);
  }

  $async.Future<$0.Evaluation> sendAnswer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Answer> request) async {
    return sendAnswer(call, await request);
  }

  $async.Stream<$0.Question> getQuestions_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* getQuestions(call, await request);
  }

  $async.Future<$0.Question> getQuestion(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Evaluation> sendAnswer(
      $grpc.ServiceCall call, $0.Answer request);
  $async.Stream<$0.Question> getQuestions(
      $grpc.ServiceCall call, $0.Empty request);
}
