import 'api_manager.dart';

Future<dynamic> sendPicsCall({
  String pics = '',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'sendPics',
      apiDomain: 'bitwearapp.com',
      apiEndpoint: 'uploadfiles/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'pics': pics,
      },
      returnResponse: true,
    );
