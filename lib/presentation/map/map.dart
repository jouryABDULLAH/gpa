import 'dart:async';
import 'package:boxicons/boxicons.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/Map/mapkey.dart';
import 'package:gpa/presentation/Map/markers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:location/location.dart';

//import 'package:gpa/presentation/Map/FAB.dart';

class screen_Map extends ConsumerStatefulWidget {
  const screen_Map({Key? key}) : super(key: key);

  @override
  _screen_Map createState() => _screen_Map();
}

class _screen_Map extends ConsumerState<screen_Map> {
  Set<Marker> Qbuildings = marks.Qbuildings;

  Completer<GoogleMapController> _controller = Completer();
  final locationController = Location();
  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};

  Set<Marker> selectedMarkers = {};

  Set<Polygon> _createPolygons() {
    final polygons = <Polygon>{};
    List<LatLng> _createPolygonPoints() {
      return const [
        LatLng(26.345759, 43.773258),
        LatLng(26.342467916425075, 43.76944350394701),
        LatLng(26.340934845736683, 43.76783853235856),
        LatLng(26.341973354975124, 43.76663082948568),
        LatLng(26.3441879761044, 43.764061842980425),
        LatLng(26.345115273050354, 43.76303470851816),
        LatLng(26.345009474447693, 43.76274302924851),
        LatLng(26.344094938352097, 43.76159813764617),
        LatLng(26.341897138146514, 43.75922094638717),
        LatLng(26.340201542514254, 43.75717317266534),
        LatLng(26.34073883270159, 43.755576999253435),
        LatLng(26.34078644700235, 43.754964189748556),
        LatLng(26.341598610803743, 43.753833297154614),
        LatLng(26.344146130309635, 43.74820207184782),
        LatLng(26.344784736775825, 43.74405030189676),
        LatLng(26.345208158670367, 43.7426250674185),
        LatLng(26.34670053494838, 43.74250887982744),
        LatLng(26.349785954759646, 43.74241948839774),
        LatLng(26.349785954759646, 43.74241948839774),
        LatLng(26.350313317470835, 43.742428683857206),
        LatLng(26.35232386570832, 43.74230454515595),
        LatLng(26.35493826079973, 43.742224269333974),
        LatLng(26.36830789357227, 43.74166217781414),
        LatLng(26.369237751511967, 43.742158536655715),
        LatLng(26.36887389493614, 43.745858666273),
        LatLng(26.367883390686984, 43.752130837207865),
        LatLng(26.367418457204288, 43.757703593292796),
        LatLng(26.367236526177834, 43.75964390517453),
        LatLng(26.367175882440915, 43.7686009261489),
        LatLng(26.365157572869425, 43.77258043554448),
        LatLng(26.363750595991505, 43.77392316329437),
        LatLng(26.361874600120334, 43.77499279389486),
        LatLng(26.361880809957984, 43.77491397866336),
        LatLng(26.36068326597235, 43.77526104561693),
        LatLng(26.359100968198952, 43.775462421595755),
        LatLng(26.357990570791383, 43.77575674034178),
        LatLng(26.356255553614385, 43.77628341597868),
        LatLng(26.35518677002884, 43.77681009162867),
        LatLng(26.35268827647308, 43.777832461982655),
        LatLng(26.35126973540698, 43.77843385403138),
        LatLng(26.35142222024536, 43.77837004138082),
        LatLng(26.350996751737338, 43.778153811880806),
        LatLng(26.348916447665285, 43.77622388234052),
        LatLng(26.34815166858873, 43.77488504319114),
        LatLng(26.34725088922295, 43.774403383617475),
        LatLng(26.345759, 43.773258),
      ];
    }

    polygons.add(
      Polygon(
        fillColor: Colors.black.withOpacity(0.6),
        polygonId: const PolygonId('test2'),
        points: const [
          LatLng(85, 90),
          LatLng(85, 0.1),
          LatLng(85, -90),
          LatLng(85, -179.9),
          LatLng(0, -179.9),
          LatLng(-85, -179.9),
          LatLng(-85, -90),
          LatLng(-85, 0.1),
          LatLng(-85, 90),
          LatLng(-85, 179.9),
          LatLng(0, 179.9),
          LatLng(85, 179.9)
        ],
        visible: true,
        geodesic: false,
        strokeWidth: 0,
      ),
    );
    if (_createPolygonPoints().isNotEmpty) {
      polygons.add(
        Polygon(
          fillColor: Color.fromARGB(0, 255, 255, 255).withOpacity(0.3),
          strokeColor: Color.fromARGB(253, 17, 54, 90),
          polygonId: const PolygonId('test3'),
          points: _createPolygonPoints(),
          visible: true,
          geodesic: false,
          strokeWidth: 4,
        ),
      );
    }
    return polygons;
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await initializeMap());
    loadData();
    addCustomIcon();
    addCustomIcon_2();
    fetchMarkersFromFirestore();

    fetchLocationUpdates();
    /* Timer.periodic(Duration(seconds: 10), (_) {
      if (currentPosition != null) {
        updatePath(currentPosition!);
      }
    });*/
  }

  // Update the camera position whenever the user's location changes
  void updateCameraPosition(LatLng position) async {
    if (position != null) {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: position, zoom: 15)));
    }
  }

  // Update the user's path
  void updatePath(LatLng position) async {
    if (position != null && currentPosition != null) {
      final List<LatLng> polylineCoordinates = await fetchPolylinePoints(
        currentPosition!,
        position,
      );
      generatePolyLineFromPoints(polylineCoordinates);
      updateCameraPosition(position); // Update camera position
    }
  }

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIcon_2 = BitmapDescriptor.defaultMarker;
  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/bookmark.png")
        .then(
      (icon) {
        if (mounted) {
          setState(() {
            markerIcon = icon;
          });
        }
      },
    );
  }

  void addCustomIcon_2() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/current.png")
        .then(
      (icon) {
        if (mounted) {
          setState(() {
            markerIcon_2 = icon;
          });
        }
      },
    );
  }

  static const B = LatLng(26.34900306634682, 43.76681242106987);

  Future<void> initializeMap() async {
    await fetchLocationUpdates();
    if (currentPosition != null) {
      final coordinates = await fetchPolylinePoints(
        currentPosition!,
        B, // Provide the destination location here
      );
      fetchMarkersFromFirestore();
      // addPolygon();
      generatePolyLineFromPoints(coordinates);
    }
  }

  void fetchMarkersFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('selected_places').get();

      querySnapshot.docs.forEach((doc) {
        final data = doc.data() as Map<String, dynamic>?; // Explicit cast
        if (data != null) {
          final latitude = data['latitude'];
          final longitude = data['longitude'];
          final placeName = data['placeName']; // Get the place name
          final markerId = MarkerId(doc.id);

          final String uniqueMarkerId = '$placeName';

          if (latitude != null && longitude != null) {
            final Marker marker = Marker(
              markerId: MarkerId(uniqueMarkerId),
              position: LatLng(latitude, longitude),
              icon: markerIcon,
              infoWindow: InfoWindow(title: placeName),
              onTap: () =>
                  _onMarkerLongPressed(MarkerId(uniqueMarkerId), markerId),
            );

            setState(() {
              _markers.add(marker);
              Qbuildings.add(marker); // Add marker to Qbuildings set
            });
          }
        }
      });
    } catch (error) {
      print('Failed to fetch markers from Firestore: $error');
    }
  }

  void onDestinationSelected(LatLng destination) async {
    if (currentPosition != null) {
      final List<LatLng> polylineCoordinates = await fetchPolylinePoints(
        currentPosition!,
        destination,
      );
      generatePolyLineFromPoints(polylineCoordinates);
    }
    setState(() {
      placeSelected = true;
    });
  }

  void closeSearchList() {
    setState(() {
      suggestions.clear();
    });
  }

  TextEditingController searchController = TextEditingController();

  bool getDirections = false;

  bool showSearchMarker = false;
  bool showNavigationMarkers = false;
  bool placeSelected = false; // Add this flag

  int markerIdCounter = 1;
  int polylineIdCounter = 1;

  Uint8List? marketimages;

  List<String> images = [
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    'assets/images/collage.png',
    //---
    'assets/images/عمادة.png',
    'assets/images/عمادة.png',
    'assets/images/عمادة.png',
    'assets/images/عمادة.png',
    'assets/images/عمادة.png',
    'assets/images/عمادة.png',
    'assets/images/عمادة.png',
    'assets/images/عمادة.png',
    'assets/images/عمادة.png',
    'assets/images/عمادة.png',
    //--
    'assets/images/out.png',
    'assets/images/out.png',
    'assets/images/out.png',
    'assets/images/out.png',
    'assets/images/out.png',
    'assets/images/out.png',
    'assets/images/out.png',
    'assets/images/out.png',
    'assets/images/bus.png', //bus
    'assets/images/out.png',
    'assets/images/out.png',
    'assets/images/out.png',
    //--
    'assets/images/cafe.png',
    'assets/images/cafe.png',
    'assets/images/cafe.png',
    'assets/images/cafe.png',
    'assets/images/cafe.png',
    'assets/images/cafe.png',
    'assets/images/cafe.png',
    'assets/images/cafe.png',
    'assets/images/cafe.png',
    'assets/images/cafe.png',
    'assets/images/cafe.png',
    //--
    'assets/images/rest.png',
    'assets/images/rest.png',
    'assets/images/rest.png',
    //--
    'assets/images/building.png',
    'assets/images/building.png',
    'assets/images/building.png',
    'assets/images/building.png',
    'assets/images/building.png',
    'assets/images/building.png',
    'assets/images/building.png',
    'assets/images/building.png',
    //--
    'assets/images/book.png',
    'assets/images/book.png',
    'assets/images/book.png',
    'assets/images/book.png',
    'assets/images/book.png',
    //--
    'assets/images/hos.png',
    'assets/images/hos.png',
    'assets/images/hos.png',
    'assets/images/hos.png',
    //--
    'assets/images/mosq.png',
    'assets/images/rajhi.png',
    'assets/images/stage.png',
    'assets/images/stad.png',
    'assets/images/gym.png',
    'assets/images/park.png',
    'assets/images/stad.png',
    'assets/images/driveSchool.png',
    'assets/images/kids.png',
  ];

  final List<Marker> _markers = <Marker>[];

  final List<LatLng> _latLen = <LatLng>[
    //كليات
    LatLng(26.350659189721537, 43.767918903374316), //sai
    LatLng(26.34900556147856, 43.76863773531845), //mang
    LatLng(26.34739841528648, 43.76734840839205), //sci
    LatLng(26.347226658485795, 43.76611019011761), //eng
    LatLng(26.348450278424348, 43.76498582490215), //reg
    LatLng(26.344544538114047, 43.764318015121574), //par
    LatLng(26.351248837837225, 43.76676367410213), //midic
    LatLng(26.349508385019707, 43.7651054235499), //lang
    LatLng(26.347049025390778, 43.7673376158313), //app
    LatLng(26.34884281321887, 43.768638347598056), //eco
    LatLng(26.351603204986336, 43.77241286312792), //phy
    LatLng(26.353133677155398, 43.773754058963085), //mid2
    LatLng(26.358446981055806, 43.765952228741504), //comp
    LatLng(26.358137824795612, 43.765587459167335), //bild
    LatLng(26.360365179576085, 43.765324195880375), //pyp
    LatLng(26.36075793332889, 43.76534503866934), //ap
    LatLng(26.362970238369446, 43.7484636116622), //plnf
    LatLng(26.352922094022734, 43.77393488788893), //midicf
    LatLng(26.36095082397776, 43.749291034015464), //compf
    LatLng(26.362782853570597, 43.74810475521704), //desf
    LatLng(26.36259680720437, 43.74760579861648), //regf
    LatLng(26.363789189457712, 43.74767434854764), //bildf
    LatLng(26.364055434368524, 43.74696230719967), //appf
    LatLng(26.36141591966223, 43.74625691972054), //scif
    LatLng(26.36059158075166, 43.74615810724614), //ecof
    //عمادة
    LatLng(26.346443145893083, 43.76382332887437),
    LatLng(26.344077401031996, 43.76491348148404),
    LatLng(26.35203566120996, 43.76545628839597),
    LatLng(26.352271340087285, 43.76503071418529),
    LatLng(26.35224515609609, 43.76471609162526),
    LatLng(26.352151566940304, 43.76449685632332),
    LatLng(26.352007030491325, 43.7660545707422),
    LatLng(26.352088148055838, 43.7662510425329),
    LatLng(26.358349264180077, 43.76568523245526),
    LatLng(26.360206770107386, 43.76525166881108),
    //بوابات
    LatLng(26.347260516283942, 43.774265909369554),
    LatLng(26.340722409193088, 43.76777004476463),
    LatLng(26.356960251993392, 43.77532702732607),
    LatLng(26.34515489312964, 43.74376633858247),
    LatLng(26.352298486585774, 43.74307801458005),
    LatLng(26.36123176583021, 43.742086660829486),
    LatLng(26.36381418346422, 43.742127942805475),
    LatLng(26.361366216044438, 43.75166223639429),
    LatLng(26.362985125367604, 43.749745190216345), //bus
    LatLng(26.36321513836393, 43.74558221307835),
    LatLng(26.36123150862995, 43.744917260962644),
    LatLng(26.359095670259887, 43.745665897722255),
    //cafes
    LatLng(26.34882323885558, 43.76529196343982), //c1
    LatLng(26.348892104022724, 43.765296502361345), //c2
    LatLng(26.347511005932034, 43.766514570932216), //c3
    LatLng(26.348852407480663, 43.76666375695636), //c4
    LatLng(26.349203295832567, 43.7669275368094), //c5
    LatLng(26.346384776151996, 43.76930093072032), //c6
    LatLng(26.355484282994045, 43.776023875354674), //c7
    LatLng(26.35351543628355, 43.76773744957642), //c8
    LatLng(26.358976771524944, 43.76550535821559), //c9
    LatLng(26.362326502932003, 43.747238874592284), //cf1
    LatLng(26.360902294743855, 43.74952716477048), //cf2
    //rest
    LatLng(26.347646751108847, 43.76704452817856), //r1
    LatLng(26.348813021220153, 43.76795484958039), //r2
    LatLng(26.362469746326756, 43.74852143480965), //rf1
    //bildings
    LatLng(26.343850394765813, 43.765026945011925), //b1
    LatLng(26.346614831348024, 43.76003020811748), //b2
    LatLng(26.34920310935825, 43.767975469692615), //b3
    LatLng(26.348409775863217, 43.76924072881003), //b4
    LatLng(26.355288803098745, 43.765217558112674), //b5
    LatLng(26.35289429337081, 43.76062879098441), //b6
    LatLng(26.349180825964382, 43.74977706873789), //b7
    LatLng(26.348296017573244, 43.74435877194481), //b8
    //laibrary
    LatLng(26.348843621185633, 43.76558638978577), //l1
    LatLng(26.345713407041035, 43.763189348715265), //l2
    LatLng(26.348524641166627, 43.76657187324112), //l3
    LatLng(26.34886896963504, 43.76636980017489), //l4
    LatLng(26.360606920779862, 43.76517484510339), //l5
    //--
    LatLng(26.35122103893483, 43.773941107676876), //h1
    LatLng(26.351831214423814, 43.77504330017547), //h2
    LatLng(26.355841600257694, 43.7761836924104), //h3
    LatLng(26.355683101685557, 43.77548701417721), //h4
    //specials
    LatLng(26.34864803558948, 43.76453342297615), //mos
    LatLng(26.349067084376696, 43.76659229200432), //rajhi
    LatLng(26.353272582144303, 43.76376657976202), //romstage
    LatLng(26.352032667852804, 43.762130035389205), //stad
    LatLng(26.349597020208535, 43.760061329147), //gym
    LatLng(26.348694270019365, 43.75576380102693), //park
    LatLng(26.346026856949493, 43.754930768348856), //stad
    LatLng(26.364269548755832, 43.75137170664656), //driv school
    LatLng(26.362452674525617, 43.747185900969534), //ner
  ];
  final List<String> markerTitles = [
    "sai".tr,
    "mang".tr,
    "sci".tr,
    "eng".tr,
    "reg".tr,
    "par".tr,
    "midic".tr,
    "lang".tr,
    "app".tr,
    "eco".tr,
    "phy".tr,
    "mid2".tr,
    "comp".tr,
    "bild".tr,
    "pyp".tr,
    "ap".tr,
    //female
    "plnf".tr,
    "midicf".tr,
    "compf".tr,
    "desf".tr,
    "regf".tr,
    "bildf".tr,
    "appf".tr,
    "scif".tr,
    "ecof".tr,
    //--
    "princ1".tr,
    "princ2".tr,
    "princ3".tr,
    "princ4".tr,
    "princ5".tr,
    "princ6".tr,
    "princ7".tr,
    "princ8".tr,
    "princ9".tr,
    "princ10".tr,
    //--
    "mainout".tr,
    "outr".tr,
    "out1".tr,
    "out2".tr,
    "out3".tr,
    "out4".tr,
    "out5".tr,
    "outf1".tr,
    "outf2".tr,
    "outf3".tr,
    "outf4".tr,
    "outf5".tr,
    //--
    "cafe1".tr,
    "cafe2".tr,
    "cafe3".tr,
    "cafe4".tr,
    "cafe5".tr,
    "cafe6".tr,
    "cafe7".tr,
    "cafe8".tr,
    "cafe9".tr,
    "cafef1".tr,
    "cafef2".tr,
    //--
    "rast1".tr,
    "rast2".tr,
    "rastf1".tr,
    //--
    "b1".tr,
    "b2".tr,
    "b3".tr,
    "b4".tr,
    "b5".tr,
    "b6".tr,
    "b7".tr,
    "b8".tr,
    //--
    "lai1".tr,
    "lai2".tr,
    "lai3".tr,
    "lai4".tr,
    "lai5".tr,
    //--
    "h1".tr,
    "h2".tr,
    "h3".tr,
    "h4".tr,
    //--
    "spe1".tr,
    "spe2".tr,
    "spe3".tr,
    "spe4".tr,
    "spe5".tr,
    "spe6".tr,
    "spe7".tr,
    "spe8".tr,
    "spe9".tr,
  ];

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  loadData() async {
    for (int i = 0; i < images.length; i++) {
      final Uint8List markIcons = await getImages(images[i], 100);
      // makers added according to index
      _markers.add(Marker(
        // given marker id
        markerId: MarkerId(i.toString()),
        // given marker icon
        icon: BitmapDescriptor.fromBytes(markIcons),
        // given position
        position: _latLen[i],
        infoWindow: InfoWindow(
          // given title for marker
          title: markerTitles[i], // Using markerTitles instead of Names
        ),
      ));
      setState(() {});
    }
  }

  late Set<Marker> buildings = Set.from(Qbuildings);
  late List<String> buildingNames =
      Qbuildings.map((marker) => marker.markerId.value.toString()).toList();
  late List<String> suggestions = [];

  var radiusValue = 3000.0;

  var tappedPoint;

  List allFavoritePlaces = [];

  String tokenKey = '';

  void _setMarker(point) {
    var counter = markerIdCounter++;

    final Marker marker = Marker(
      markerId: MarkerId('1'),
      position: point,
      infoWindow: InfoWindow(title: "dp"),
      onTap: () {},
    );

    setState(() {
      _markers.add(marker);
    });
  }

  Future<void> _onMarkerLongPressed(
      MarkerId markerId, MarkerId markerval) async {
    final String markerDocId = markerval.value.toString();

    final action = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("MO".tr),
          //احس ما لها داعي
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop('delete'),
              child: Text("DM".tr),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop('findRoute'),
              child: Text("FR".tr),
            ),
          ],
        );
      },
    );

    if (action == 'delete') {
      // Remove the marker from the map
      setState(() {
        _markers.removeWhere((marker) => marker.markerId == markerId);
      });

      // Delete the marker from Firestore
      await FirebaseFirestore.instance
          .collection('selected_places')
          .doc(markerDocId)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('MD'.tr),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } else if (action == 'findRoute') {
      final selectedMarker = _markers.firstWhere(
        (marker) => marker.markerId == markerId,
        orElse: () => Marker(
          markerId: MarkerId(""),
          position: LatLng(0, 0), // Default position if not found
        ),
      );

      if (currentPosition != null) {
        print(selectedMarker.position);
        // Draw polyline between current position and selected place
        onDestinationSelected(selectedMarker.position);
      }
    }
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnbled;
    PermissionStatus permissionGranted;

    serviceEnbled = await locationController.serviceEnabled();

    if (serviceEnbled) {
      serviceEnbled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });
        if (showNavigationMarkers) {
          updatePath(currentPosition!); // Update path when location changes
        }
        // Update camera position to follow user
      }
    });
  }

  LatLng ocation = LatLng(26.34847508549134, 43.767713423546866);

  Future<List<LatLng>> fetchPolylinePoints(
      LatLng origin, LatLng destination) async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey,
      PointLatLng(origin.latitude, origin.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: Color.fromARGB(255, 0, 16, 107),
      points: polylineCoordinates,
      width: 5,
    );
    updateCameraPosition(currentPosition!);

    setState(() {
      polylines[id] = polyline; // Update polylines state
    });
  }

  BitmapDescriptor customMarkerIcon(Color color) {
    return BitmapDescriptor.defaultMarkerWithHue(color != Colors.red
        ? BitmapDescriptor.hueGreen
        : BitmapDescriptor.hueRed);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    const LatLng _sourceLocation =
        LatLng(26.34847508549134, 43.767713423546866);

    return Scaffold(
      body: Column(
        children: [
          Flexible(
              child: Stack(
            children: [
              Container(
                height: screenHeight - 60,
                width: screenWidth,
                child: currentPosition == null
                    ? const Center(child: CircularProgressIndicator())
                    : GoogleMap(
                        onTap: (tapped) async {
                          setState(() {
                            tappedPoint = tapped;
                          });

                          _setMarker(tapped); // Add this line to set the marker
                        },
                        mapType: MapType.satellite,
                        markers: Set<Marker>.of(_markers)
                          ..addAll({
                            Marker(
                              markerId: const MarkerId('currentLocation'),
                              infoWindow: InfoWindow(title: "CL".tr),
                              icon: markerIcon_2,
                              position: currentPosition!,
                            ),
                          }),
                        polygons: _createPolygons(),
                        polylines: Set<Polyline>.of(polylines.values),
                        initialCameraPosition:
                            CameraPosition(target: _sourceLocation, zoom: 14.5),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 5.0),
                child: Column(
                  children: [
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(44, 0, 0, 0),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: Color.fromARGB(255, 255, 253, 253)),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 11.0),
                          border: InputBorder.none,
                          hintText: 'search'.tr,
                          hintStyle: GoogleFonts.getFont(
                            MyLocal.getFontFamily(Get.locale!.languageCode),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                searchController.text = '';
                                suggestions.clear();
                                polylines
                                    .clear(); // Clear suggestions when search text is cleared
                              });
                            },
                            icon: Icon(BoxIcons.bx_x),
                          ),
                        ),
                        onChanged: (query) {
                          setState(() {
                            suggestions = buildingNames
                                .where((option) => option
                                    .toLowerCase()
                                    .contains(query.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 80.0,
                left: 15.0,
                child: Container(
                  height: 200.0,
                  width: screenWidth - 30.0,
                  child: ListView.builder(
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      final suggestion = suggestions[index];
                      return Container(
                        decoration: BoxDecoration(
                          //  borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.7),
                        ),
                        child: ListTile(
                          title: Text(suggestion),
                          leading: const Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 0, 168, 171),
                          ),
                          onTap: () async {
                            searchController.text = suggestion;
                            final selectedMarker = Qbuildings.firstWhere(
                              (marker) =>
                                  marker.markerId.value.toString() ==
                                  suggestion,
                              orElse: () => const Marker(
                                markerId: MarkerId(""),
                                position: LatLng(
                                    0, 0), // Default position if not found
                              ),
                            );

                            // Move the camera to the selected marker's position
                            GoogleMapController controller =
                                await _controller.future;
                            controller.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: selectedMarker.position,
                                  zoom: 15,
                                ),
                              ),
                            );

                            // Draw polyline between current position and selected place
                            onDestinationSelected(selectedMarker.position);

                            closeSearchList();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(bottom: 15, left: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(53, 0, 0, 0),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () async {
                    if (currentPosition != null) {
                      GoogleMapController controller = await _controller.future;
                      controller.animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(
                            currentPosition!.latitude,
                            currentPosition!.longitude,
                          ),
                          zoom: 15,
                        ),
                      ));
                    }
                  },
                  icon: const Icon(
                    BoxIcons.bx_current_location,
                    color: Color.fromARGB(255, 0, 167, 171),
                  ),
                  splashColor: Color.fromARGB(255, 171, 0, 0),
                ),
              ),
              SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(53, 0, 0, 0),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () async {
                    final TextEditingController placeNameController =
                        TextEditingController();

                    await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("SP".tr),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('PN'.tr),
                              TextField(
                                controller: placeNameController,
                                decoration: InputDecoration(
                                  hintText: 'HN'.tr,
                                ),
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () async {
                                final String placeName =
                                    placeNameController.text.trim();
                                if (placeName.isNotEmpty) {
                                  await FirebaseFirestore.instance
                                      .collection('selected_places')
                                      .add({
                                    'latitude': tappedPoint.latitude,
                                    'longitude': tappedPoint.longitude,
                                    'placeName': placeName,
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Saved as: $placeName'.tr),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('plsN'.tr),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                                Navigator.of(context).pop();
                              },
                              child: Text('Save'.tr),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'.tr),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    BoxIcons.bxs_bookmark,
                    color: Color.fromARGB(255, 0, 167, 171),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void seearchBuilding(String query) {
    final suggestions = Qbuildings.where((build) {
      final buildingName = build.markerId.value.toString().toLowerCase();
      final input = query.toLowerCase();
      return buildingName.contains(input);
    }).toSet();

    setState(() => Qbuildings = suggestions);
  }
}
