import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'image_list_record.g.dart';

abstract class ImageListRecord
    implements Built<ImageListRecord, ImageListRecordBuilder> {
  static Serializer<ImageListRecord> get serializer =>
      _$imageListRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'image_list')
  BuiltList<String> get imageList;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ImageListRecordBuilder builder) =>
      builder..imageList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('image_list');

  static Stream<ImageListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ImageListRecord._();
  factory ImageListRecord([void Function(ImageListRecordBuilder) updates]) =
      _$ImageListRecord;
}

Map<String, dynamic> createImageListRecordData() => serializers.toFirestore(
    ImageListRecord.serializer, ImageListRecord((i) => i..imageList = null));

ImageListRecord get dummyImageListRecord {
  final builder = ImageListRecordBuilder()
    ..imageList = ListBuilder([dummyImagePath, dummyImagePath]);
  return builder.build();
}

List<ImageListRecord> createDummyImageListRecord({int count}) =>
    List.generate(count, (_) => dummyImageListRecord);
