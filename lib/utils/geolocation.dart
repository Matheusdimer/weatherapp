import 'package:geolocator/geolocator.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Serviço de localização desabilitado.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Sem permissão de acesso a localização.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Permissão de localização revogada permanentemente.');
  }

  return await Geolocator.getCurrentPosition();
}
