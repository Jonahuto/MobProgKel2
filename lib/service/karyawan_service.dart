import '../model/karyawan.dart';
import '../helpers/api_client.dart';

class KaryawanService {
  Future<List<Karyawan>> listData() async {
    final response = await ApiClient().get('karyawan');
    final List data = response.data as List;
    List<Karyawan> result = data.map((json) => Karyawan.fromJson(json)).toList();
    return result;
  }

  Future<Karyawan> Simpan(Karyawan karyawan) async {
    var data = karyawan.toJson();
    final response = await ApiClient().post('karyawan', data);
    Karyawan result = Karyawan.fromJson(response.data);
    return result;
  }

  Future<Karyawan> Ubah(Karyawan karyawan, String id) async{
    var data = karyawan.toJson();
    final response = await ApiClient().put('karyawan/${id}', data);
    print(response);
    Karyawan result = Karyawan.fromJson(response.data);
    return result;
  }

  Future<Karyawan> getById(String id) async {
    final response = await ApiClient().get('karyawan/${id}');
    Karyawan result = Karyawan.fromJson(response.data);
    return result;
  }

  Future<Karyawan> hapus(Karyawan karyawan) async {
    final response = await ApiClient().delete('karyawan/${karyawan.id}');
    Karyawan result = Karyawan.fromJson(response.data);
    return result;
  }
    
}   
