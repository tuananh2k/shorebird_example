import '../../domain/repository/direction_repository.dart';

class DirectionRepositoryIml implements DirectionRepository {
  /**
      final remoteDatasource = getIt<DirectionRemoteDatasource>();

      @override
      Future<Either<Failure, LocationEntity>> getCurrentLocation() async {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
      final isEnabled = await Geolocator.openAppSettings();
      if (!isEnabled) {
      return left(const CurrentLocationFailure(
      error: 'Don\'t have location service enabled'));
      }
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
      return left(const CurrentLocationFailure(
      error: "You don't have all the permissions granted."
      '\nYou need to activate them manually.',
      ));
      }
      }

      if (permission == LocationPermission.deniedForever) {
      return left(const CurrentLocationFailure(
      error:
      "Location permissions are permanently denied, we cannot request permissions."));
      }

      Position? locationData;
      try {
      locationData = await Geolocator.getCurrentPosition();
      } catch (e) {
      return left(const CurrentLocationFailure(
      error: 'Something went wrong getting your location',
      ));
      }

      final latitude = locationData.latitude;
      final longitude = locationData.longitude;

      return right(
      LocationModel(latitude: latitude, longitude: longitude).toEntity());
      }

      @override
      Future<Either<Failure, List<PlaceSuggestionEntity>>> searchPlaceSuggestion(
      String place) async {
      try {
      final result = await remoteDatasource.searchPlaces(place);
      return result.fold((failure) {
      return Left(failure);
      }, (data) {
      if (data['suggestions'] is! List) {
      return const Left(Exception('Suggestions is not List'));
      }
      if (data['suggestions'].isEmpty) {
      return const Left(Exception('Suggestions is empty'));
      }
      List<PlaceSuggestionEntity> listModel = data['suggestions']
      .map<PlaceSuggestionEntity>(
      (e) => PlaceSuggestionModel.fromJson(e).toEntity())
      .toList();
      return Right(listModel);
      });
      } catch (e) {
      return Left(Exception(e.toString()));
      }
      }

      @override
      Future<Either<Failure, LocationEntity>> getLatLngPlace(
      String mapboxId) async {
      final result = await remoteDatasource.getLatLngPlace(mapboxId);
      if (result is! Map) {
      return left(const ConnectionFailure(
      'Something went wrong getting lat, long from mapboxId',
      ));
      }

      if (result['features'] is! List) {
      return left(const ParsingFailure('Could not parse features'));
      }
      if (result['features'].isEmpty) {
      return left(const ParsingFailure('Could not parse geometry'));
      }

      try {
      double lng = result['features'][0]['geometry']['coordinates'][0];
      double lat = result['features'][0]['geometry']['coordinates'][1];
      return right(LocationEntity(latitude: lat, longitude: lng));
      } catch (e) {
      return left(const ParsingFailure('Could not parse geometry'));
      }
      }

      @override
      Future<Either<Failure, List<RouteEntity>>> getDirections(
      LocationEntity start, LocationEntity end) async {
      String startLngLat = '${start.longitude},${start.latitude}';
      String endLngLat = '${end.longitude},${end.latitude}';
      var res = await remoteDatasource.getDirection(startLngLat, endLngLat);
      return res.fold((failure) {
      return Left(failure);
      }, (data) {
      if (data['routes'] is! List) {
      return const Left(Exception('Routes is not List'));
      }
      if (data['routes'].isEmpty) {
      return const Left(Exception('Routes is empty'));
      }
      List<RouteEntity> listEntity = data['routes']
      .map<RouteEntity>((e) => RouteModel.fromJson(e).toEntity())
      .toList();
      return Right(listEntity);
      });
      }
   * */
}
