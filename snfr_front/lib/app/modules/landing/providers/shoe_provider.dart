import 'package:get/get.dart';

import '../shoe_model.dart';

class ShoeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Shoe.fromJson(map);
      if (map is List) return map.map((item) => Shoe.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Shoe?> getShoe(int id) async {
    final response = await get('shoe/$id');
    return response.body;
  }

  Future<Response<Shoe>> postShoe(Shoe shoe) async => await post('shoe', shoe);
  Future<Response> deleteShoe(int id) async => await delete('shoe/$id');
}
