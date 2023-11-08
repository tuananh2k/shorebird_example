class DirectionRemoteDatasource {
  /**
   * Example class datasource
  final Request request = getIt<Request>();
  final mapBoxAccessToken = dotenv.env['MAPBOX_ACCESS_TOKEN'];

  Future<Either<Failure, Map>> searchPlaces(String place) async {
    var response = await request
        .get('$MAPBOX_DOMAIN/search/searchbox/v1/suggest', queryParameters: {
      'q': place,
      'language': 'en',
      'access_token': mapBoxAccessToken,
      'session_token': DateTime.now().millisecondsSinceEpoch.toString(),
    });

    if (response.statusCode == 200) {
      if (response.data is! Map) {
        return left(const Exception('Data is not Map'));
      }
      return right(response.data);
    }
    return left(ConnectionFailure(
        'Connect failed, status code: ${response.statusCode}'));
  }

  Future<Map?> getLatLngPlace(String mapboxId) async {
    var response = await request.get(
        '$MAPBOX_DOMAIN/search/searchbox/v1/retrieve/$mapboxId',
        queryParameters: {
          'access_token': mapBoxAccessToken,
          'session_token': DateTime.now().millisecondsSinceEpoch.toString(),
        });
    if (response.statusCode == 200 && response.data is Map) {
      return response.data;
    }
    return null;
  }

  Future<Either<Failure, Map>> getDirection(
    String startLngLat,
    String endLngLat, {
    String mode = 'driving',
    bool step = true,
    bool alternatives = true,
    String language = 'en', // key 'ja' for Japanese
  }) async {
    var response = await request.get(
        '$MAPBOX_DOMAIN/directions/v5/mapbox/$mode/$startLngLat;$endLngLat',
        queryParameters: {
          'alternatives': alternatives,
          'language': language,
          'steps': step,
          'geometries': 'geojson',
          'overview': 'full',
          'access_token': mapBoxAccessToken,
        });

    if (response.statusCode == 200) {
      if (response.data is! Map) {
        return left(const Exception('Data is not Map'));
      }
      return right(response.data);
    }
    return left(ConnectionFailure(
        'Connect failed, status code: ${response.statusCode}'));
  }*/
}
