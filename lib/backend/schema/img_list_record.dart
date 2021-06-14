import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'img_list_record.g.dart';

abstract class ImgListRecord
    implements Built<ImgListRecord, ImgListRecordBuilder> {
  static Serializer<ImgListRecord> get serializer => _$imgListRecordSerializer;

  @nullable
  BuiltList<String> get imgs;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ImgListRecordBuilder builder) =>
      builder..imgs = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('imgList');

  static Stream<ImgListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ImgListRecord._();
  factory ImgListRecord([void Function(ImgListRecordBuilder) updates]) =
      _$ImgListRecord;
}

Map<String, dynamic> createImgListRecordData() => serializers.toFirestore(
    ImgListRecord.serializer, ImgListRecord((i) => i..imgs = null));

ImgListRecord get dummyImgListRecord {
  final builder = ImgListRecordBuilder()
    ..imgs = ListBuilder([dummyImagePath, dummyImagePath]);
  return builder.build();
}

List<ImgListRecord> createDummyImgListRecord({int count}) =>
    List.generate(count, (_) => dummyImgListRecord);
