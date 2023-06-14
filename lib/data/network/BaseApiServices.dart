abstract class BaseApiService{


  Future<dynamic> getApiResponse(String url);


  Future<dynamic> getpostApiResponse(String url, dynamic data);

}