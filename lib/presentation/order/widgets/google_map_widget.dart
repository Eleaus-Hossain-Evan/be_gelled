import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:be_gelled/utils/assets/resources.dart';

// class GoogleMapWidget extends HookConsumerWidget {
//   const GoogleMapWidget({
//     super.key,
//     required this.location,
//   });

//   final LatLng location;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final markerIcon = useState(BitmapDescriptor.defaultMarker);

//     Future<BitmapDescriptor> addCustomIcon() async {
//       return await BitmapDescriptor.fromAssetImage(
//         const ImageConfiguration(),
//         Images.iconMyLocation,
//       );
//     }

//     useEffect(() {
//       Future.microtask(
//           () => addCustomIcon().then((value) => markerIcon.value = value));

//       return null;
//     }, const []);

//     final markers = useState({
//       Marker(
//         markerId: const MarkerId('1'),
//         position: location,
//         icon: markerIcon.value,
//       ),
//     });
//     return GoogleMap(
//       myLocationButtonEnabled: false,
//       myLocationEnabled: true,
//       initialCameraPosition: CameraPosition(
//         target: location,
//         zoom: 14.4746,
//       ),
//       markers: markers.value,
//       zoomControlsEnabled: false,
//       zoomGesturesEnabled: false,
//       scrollGesturesEnabled: false,
//     );
//   }
// }

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({
    Key? key,
    required this.location,
  }) : super(key: key);

  final LatLng location;

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), Images.iconMyLocation)
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.location,
          zoom: 16,
        ),
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        zoomGesturesEnabled: false,
        scrollGesturesEnabled: false,
        padding: EdgeInsets.only(top: 10.h),
        markers: {
          Marker(
            markerId: const MarkerId("marker1"),
            position: widget.location,
            draggable: true,
            onDragEnd: (value) {
              // value is the new position
            },
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker2"),
            position: const LatLng(37.415768808487435, -122.08440050482749),
          ),
        },
      ),
    );
  }
}
