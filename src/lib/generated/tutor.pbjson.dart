///
//  Generated code. Do not modify.
//  source: tutor.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use questionDescriptor instead')
const Question$json = const {
  '1': 'Question',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `Question`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List questionDescriptor = $convert.base64Decode('CghRdWVzdGlvbhIOCgJpZBgBIAEoBVICaWQSEgoEdGV4dBgCIAEoCVIEdGV4dA==');
@$core.Deprecated('Use answerDescriptor instead')
const Answer$json = const {
  '1': 'Answer',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'student', '3': 3, '4': 1, '5': 11, '6': '.Student', '10': 'student'},
    const {'1': 'question', '3': 4, '4': 1, '5': 11, '6': '.Question', '10': 'question'},
  ],
};

/// Descriptor for `Answer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List answerDescriptor = $convert.base64Decode('CgZBbnN3ZXISDgoCaWQYASABKAVSAmlkEhIKBHRleHQYAiABKAlSBHRleHQSIgoHc3R1ZGVudBgDIAEoCzIILlN0dWRlbnRSB3N0dWRlbnQSJQoIcXVlc3Rpb24YBCABKAsyCS5RdWVzdGlvblIIcXVlc3Rpb24=');
@$core.Deprecated('Use studentDescriptor instead')
const Student$json = const {
  '1': 'Student',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Student`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studentDescriptor = $convert.base64Decode('CgdTdHVkZW50Eg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1l');
@$core.Deprecated('Use evaluationDescriptor instead')
const Evaluation$json = const {
  '1': 'Evaluation',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'answerId', '3': 2, '4': 1, '5': 5, '10': 'answerId'},
    const {'1': 'score', '3': 3, '4': 1, '5': 5, '10': 'score'},
  ],
};

/// Descriptor for `Evaluation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List evaluationDescriptor = $convert.base64Decode('CgpFdmFsdWF0aW9uEg4KAmlkGAEgASgFUgJpZBIaCghhbnN3ZXJJZBgCIAEoBVIIYW5zd2VySWQSFAoFc2NvcmUYAyABKAVSBXNjb3Jl');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
