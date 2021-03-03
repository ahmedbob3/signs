import 'package:Inventory/utils/network/result.dart';
import 'package:dio/dio.dart';
import 'package:Inventory/utils/network/consts.dart';
import 'package:Inventory/utils/network/error.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkUtil{
  static final NetworkUtil _networkUtil = NetworkUtil._internal();
  Dio dio = new Dio();
  NetworkUtil._internal(){
    initDio();
  }
  factory NetworkUtil(){
    return _networkUtil;
  }

  void initDio() {
    // Set default configs
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 50000; //50s
    dio.options.receiveTimeout = 30000;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

  Future<Result> get(String endPoint,{Map<String, dynamic> headers, Map<String, dynamic> queryParams}) async{
    try{
      Response response = await dio.get(endPoint, options: Options(headers: headers), queryParameters: queryParams);
      if(response.statusCode < 200 || response.statusCode > 400 || response.data == null){
        print("status code error : ${response.statusCode}");
        return Result.failed(getApplicationError(response));
      } else{
        return Result.success(response.data);
      }
    } catch(e){
      print("Network error parsing error: $endPoint");
      return Result.failed(getApplicationErrorFromDioError(e));
    }
  }

  Future<Result> post(String endPoint, {Map<String, dynamic> headers, dynamic body}) async{
    // use try/catch block because dio through exception in case of wrong status code
    try{
      Response response = await dio.post(endPoint, data: body, options: Options(headers: headers));
      if(response.statusCode < 200 || response.statusCode >= 400 || response.data == null){
        print("status code error : ${response.statusCode}");
        return Result.failed(getApplicationError(response));
      } else{
        return Result.success(response.data);
      }
    } catch(e){
      print("Network error parsing error: $endPoint");
      return Result.failed(getApplicationErrorFromDioError(e));
    }
  }

  // not used as dio through exception if status code not valid
  ApplicationError getApplicationError(Response response) {
    ErrorType errorType;
    String errorMsg = "un expected error";
    if(response.data != null && response?.data is Map){
      errorMsg = response.data["message"];
    }
    if(response.statusCode == 401){
      errorType = Unauthorized();
      // errorMsg = "un authorized";
    } else if(response.statusCode == 404){
      errorType = ResourceNotFound();
      // errorMsg = "resource not found";
    } else{
      errorType = UnExpected();
      // errorMsg = "un expected error";
    }
    return ApplicationError( type: errorType, errorMsg: errorMsg);
  }

  // convert Dio error to application error
  ApplicationError getApplicationErrorFromDioError(DioError dioError) {
    ErrorType errorType;
    String errorMsg = "Network error";
    dynamic extra;
    if(dioError?.response?.data != null && dioError?.response?.data is Map){
      errorMsg = dioError?.response?.data["message"]??"Network error";
      extra = dioError?.response?.data["errors"];
    }
    if(dioError?.response?.statusCode == 401){
      errorType = Unauthorized();
      // errorMsg = "un authorized";
    } else if(dioError?.response?.statusCode == 404){
      errorType = ResourceNotFound();
      // errorMsg = "resource not found";
    } else{
      errorType = NetworkError(dioError?.response?.statusCode??0);
      // errorMsg = "un expected error";
    }
    return ApplicationError( type: errorType, errorMsg: errorMsg, extra: extra);
  }
}