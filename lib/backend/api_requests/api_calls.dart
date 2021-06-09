import 'api_manager.dart';

Future<dynamic> bitwearappCall() => ApiManager.instance.makeApiCall(
      callName: 'bitwearapp',
      apiDomain: 'www.bitwearapp.com',
      apiEndpoint: '',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      returnResponse: true,
    );

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
