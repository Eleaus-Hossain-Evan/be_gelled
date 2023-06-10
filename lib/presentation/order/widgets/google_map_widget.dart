import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoogleMapWidget extends HookConsumerWidget {
  const GoogleMapWidget({
    super.key,
    required this.location,
  });

  final LatLng location;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('1'),
        position: location,
      ),
    };
    return GoogleMap(
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: location,
        zoom: 14.4746,
      ),
      markers: markers,
    );
  }
}
