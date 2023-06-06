import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:move_app/services/dio_service.dart';

class DioServiceImp implements DioService {
  //dio é o cara que vamos fazer requissicoes http
  @override
  Dio getDio() {
    //retorno um dio so que customizado, com baseOtions
    return Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/4/', headers: {
      'content-type': 'application/json;charset=utf-8',
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYTJlZTEyZmIzZmUxZDIzYmE2ZTEzZTYyMDg4ZTU5YiIsInN1YiI6IjY0N2IzOGY1Y2Y0YjhiMDEwMzFlNDNkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8txYqf4LRuHdXtkRC3-zFe8CdIp-M_vRRlNtJrN-0VU'
    }));
  }
}
