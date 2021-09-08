abstract class IBaseRepository {
  Future<List<dynamic>?> getAll(String url);

  Future<Map<String, dynamic>?> get(String url);

  Future<Map<String, dynamic>?> post(String url, Map<String, dynamic> json);

  Future<Map<String, dynamic>?> findById(String url, int id);

  Future<Map<String, dynamic>?> create(String url, Map<String, dynamic> jsonVm);

  Future<Map<String, dynamic>?> edit(String url, Map<String, dynamic> jsonVm);

  Future<Map<String, dynamic>?> delete(String url, int id);
}
