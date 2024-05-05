import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

ImageConfiguration images = const ImageConfiguration();

class marks extends ConsumerStatefulWidget {
  marks({Key? key}) : super(key: key);

  static final Set<Marker> Qbuildings = {
    Marker(
      markerId: MarkerId("sai".tr),
      position: const LatLng(26.350659189721537, 43.767918903374316),
      infoWindow: InfoWindow(title: "sai".tr),
    ),
    Marker(
      markerId: MarkerId("mang".tr),
      position: const LatLng(26.34900556147856, 43.76863773531845),
      infoWindow: InfoWindow(title: "mang".tr),
    ),
    Marker(
      markerId: MarkerId("sci".tr),
      position: const LatLng(26.34739841528648, 43.76734840839205),
      infoWindow: InfoWindow(title: "sci".tr),
    ),
    Marker(
      markerId: MarkerId("eng".tr),
      position: const LatLng(26.347226658485795, 43.76611019011761),
      infoWindow: InfoWindow(title: "eng".tr),
    ),
    Marker(
      markerId: MarkerId("reg".tr),
      position: const LatLng(26.348450278424348, 43.76498582490215),
      infoWindow: InfoWindow(title: "reg".tr),
    ),
    Marker(
      markerId: MarkerId("par".tr),
      position: const LatLng(26.344544538114047, 43.764318015121574),
      infoWindow: InfoWindow(title: "par".tr),
    ),
    Marker(
      markerId: MarkerId("midic".tr),
      position: const LatLng(26.351248837837225, 43.76676367410213),
      infoWindow: InfoWindow(title: "midic".tr),
    ),
    Marker(
      markerId: MarkerId("lang".tr),
      position: const LatLng(26.349508385019707, 43.7651054235499),
      infoWindow: InfoWindow(title: "lang".tr),
    ),
    Marker(
      markerId: MarkerId("app".tr),
      position: const LatLng(26.347049025390778, 43.7673376158313),
      infoWindow: InfoWindow(title: "app".tr),
    ),
    Marker(
      markerId: MarkerId("eco".tr),
      position: const LatLng(26.34884281321887, 43.768638347598056),
      infoWindow: InfoWindow(title: "eco".tr),
    ),
    Marker(
      markerId: MarkerId("phy".tr),
      position: const LatLng(26.351603204986336, 43.77241286312792),
      infoWindow: InfoWindow(title: "phy".tr),
    ),
    Marker(
      markerId: MarkerId("mid2".tr),
      position: const LatLng(26.353133677155398, 43.773754058963085),
      infoWindow: InfoWindow(title: "mid2".tr),
    ),
    Marker(
      markerId: MarkerId("comp".tr),
      position: const LatLng(26.358446981055806, 43.765952228741504),
      infoWindow: InfoWindow(title: "comp".tr),
    ),
    Marker(
      markerId: MarkerId("bild".tr),
      position: const LatLng(26.358137824795612, 43.765587459167335),
      infoWindow: InfoWindow(title: "bild".tr),
    ),
    Marker(
      markerId: MarkerId("pyp".tr),
      position: const LatLng(26.360365179576085, 43.765324195880375),
      infoWindow: InfoWindow(title: "pyp".tr),
    ),
    Marker(
      markerId: MarkerId("ap".tr),
      position: const LatLng(26.36075793332889, 43.76534503866934),
      infoWindow: InfoWindow(title: "ap".tr),
    ),
    Marker(
      markerId: MarkerId("plnf".tr),
      position: const LatLng(26.362970238369446, 43.7484636116622),
      infoWindow: InfoWindow(title: "plnf".tr),
    ),
    Marker(
      markerId: MarkerId("midicf".tr),
      position: const LatLng(26.352922094022734, 43.77393488788893),
      infoWindow: InfoWindow(title: "midicf".tr),
    ),
    Marker(
      markerId: MarkerId("compf".tr),
      position: const LatLng(26.36095082397776, 43.749291034015464),
      infoWindow: InfoWindow(title: "compf".tr),
    ),
    Marker(
      markerId: MarkerId("desf".tr),
      position: const LatLng(26.362782853570597, 43.74810475521704),
      infoWindow: InfoWindow(title: "desf".tr),
    ),
    Marker(
      markerId: MarkerId("regf".tr),
      position: const LatLng(26.36259680720437, 43.74760579861648),
      infoWindow: InfoWindow(title: "regf".tr),
    ),
    Marker(
      markerId: MarkerId("bildf".tr),
      position: const LatLng(26.363789189457712, 43.74767434854764),
      infoWindow: InfoWindow(title: "bildf".tr),
    ),
    Marker(
      markerId: MarkerId("appf".tr),
      position: const LatLng(26.364055434368524, 43.74696230719967),
      infoWindow: InfoWindow(title: "appf".tr),
    ),
    Marker(
      markerId: MarkerId("scif".tr),
      position: const LatLng(26.36141591966223, 43.74625691972054),
      infoWindow: InfoWindow(title: "scif".tr),
    ),
    Marker(
      markerId: MarkerId("ecof".tr),
      position: const LatLng(26.36059158075166, 43.74615810724614),
      infoWindow: InfoWindow(title: "ecof".tr),
    ),
    Marker(
      markerId: MarkerId("princ1".tr),
      position: const LatLng(26.362970238369446, 43.7484636116622),
      infoWindow: InfoWindow(title: "princ1".tr),
    ),
    Marker(
      markerId: MarkerId("princ2".tr),
      position: const LatLng(26.35122103893483, 43.773941107676876),
      infoWindow: InfoWindow(title: "princ2".tr),
    ),
    Marker(
      markerId: MarkerId("princ3".tr),
      position: const LatLng(26.351831214423814, 43.77504330017547),
      infoWindow: InfoWindow(title: "princ3".tr),
    ),
    Marker(
      markerId: MarkerId("princ4".tr),
      position: const LatLng(26.355841600257694, 43.7761836924104),
      infoWindow: InfoWindow(title: "princ4".tr),
    ),
    Marker(
      markerId: MarkerId("mainout".tr),
      position: const LatLng(26.34864803558948, 43.76453342297615),
      infoWindow: InfoWindow(title: "mainout".tr),
    ),
    Marker(
      markerId: MarkerId("outr".tr),
      position: const LatLng(26.349067084376696, 43.76659229200432),
      infoWindow: InfoWindow(title: "outr".tr),
    ),
    Marker(
      markerId: MarkerId("out1".tr),
      position: const LatLng(26.353272582144303, 43.76376657976202),
      infoWindow: InfoWindow(title: "out1".tr),
    ),
    Marker(
      markerId: MarkerId("out2".tr),
      position: const LatLng(26.352032667852804, 43.762130035389205),
      infoWindow: InfoWindow(title: "out2".tr),
    ),
    Marker(
      markerId: MarkerId("out3".tr),
      position: const LatLng(26.349597020208535, 43.760061329147),
      infoWindow: InfoWindow(title: "out3".tr),
    ),
    Marker(
      markerId: MarkerId("out4".tr),
      position: const LatLng(26.348694270019365, 43.75576380102693),
      infoWindow: InfoWindow(title: "out4".tr),
    ),
    Marker(
      markerId: MarkerId("out5".tr),
      position: const LatLng(26.346026856949493, 43.754930768348856),
      infoWindow: InfoWindow(title: "out5".tr),
    ),
    Marker(
      markerId: MarkerId("cafe1".tr),
      position: const LatLng(26.34882323885558, 43.76529196343982),
      infoWindow: InfoWindow(title: "cafe1".tr),
    ),
    Marker(
      markerId: MarkerId("cafe2".tr),
      position: const LatLng(26.348892104022724, 43.765296502361345),
      infoWindow: InfoWindow(title: "cafe2".tr),
    ),
    Marker(
      markerId: MarkerId("cafe3".tr),
      position: const LatLng(26.347511005932034, 43.766514570932216),
      infoWindow: InfoWindow(title: "cafe3".tr),
    ),
    Marker(
      markerId: MarkerId("cafe4".tr),
      position: const LatLng(26.348852407480663, 43.76666375695636),
      infoWindow: InfoWindow(title: "cafe4".tr),
    ),
    Marker(
      markerId: MarkerId("cafe5".tr),
      position: const LatLng(26.349203295832567, 43.7669275368094),
      infoWindow: InfoWindow(title: "cafe5".tr),
    ),
    Marker(
      markerId: MarkerId("cafe6".tr),
      position: const LatLng(26.346384776151996, 43.76930093072032),
      infoWindow: InfoWindow(title: "cafe6".tr),
    ),
    Marker(
      markerId: MarkerId("cafe7".tr),
      position: const LatLng(26.355484282994045, 43.776023875354674),
      infoWindow: InfoWindow(title: "cafe7".tr),
    ),
    Marker(
      markerId: MarkerId("cafe8".tr),
      position: const LatLng(26.35351543628355, 43.76773744957642),
      infoWindow: InfoWindow(title: "cafe8".tr),
    ),
    Marker(
      markerId: MarkerId("cafe9".tr),
      position: const LatLng(26.358976771524944, 43.76550535821559),
      infoWindow: InfoWindow(title: "cafe9".tr),
    ),
    Marker(
      markerId: MarkerId("cafef1".tr),
      position: const LatLng(26.362326502932003, 43.747238874592284),
      infoWindow: InfoWindow(title: "cafef1".tr),
    ),
    Marker(
      markerId: MarkerId("cafef2".tr),
      position: const LatLng(26.360902294743855, 43.74952716477048),
      infoWindow: InfoWindow(title: "cafef2".tr),
    ),
    Marker(
      markerId: MarkerId("rast1".tr),
      position: const LatLng(26.347646751108847, 43.76704452817856),
      infoWindow: InfoWindow(title: "rast1".tr),
    ),
    Marker(
      markerId: MarkerId("rast2".tr),
      position: const LatLng(26.348813021220153, 43.76795484958039),
      infoWindow: InfoWindow(title: "rast2".tr),
    ),
    Marker(
      markerId: MarkerId("rastf1".tr),
      position: const LatLng(26.362469746326756, 43.74852143480965),
      infoWindow: InfoWindow(title: "rastf1".tr),
    ),
    Marker(
      markerId: MarkerId("b1".tr),
      position: const LatLng(26.343850394765813, 43.765026945011925),
      infoWindow: InfoWindow(title: "b1".tr),
    ),
    Marker(
      markerId: MarkerId("b2".tr),
      position: const LatLng(26.346614831348024, 43.76003020811748),
      infoWindow: InfoWindow(title: "b2".tr),
    ),
    Marker(
      markerId: MarkerId("b3".tr),
      position: const LatLng(26.34920310935825, 43.767975469692615),
      infoWindow: InfoWindow(title: "b3".tr),
    ),
    Marker(
      markerId: MarkerId("b4".tr),
      position: const LatLng(26.348409775863217, 43.76924072881003),
      infoWindow: InfoWindow(title: "b4".tr),
    ),
    Marker(
      markerId: MarkerId("b5".tr),
      position: const LatLng(26.355288803098745, 43.765217558112674),
      infoWindow: InfoWindow(title: "b5".tr),
    ),
    Marker(
      markerId: MarkerId("b6".tr),
      position: const LatLng(26.35289429337081, 43.76062879098441),
      infoWindow: InfoWindow(title: "b6".tr),
    ),
    Marker(
      markerId: MarkerId("b7".tr),
      position: const LatLng(26.349180825964382, 43.74977706873789),
      infoWindow: InfoWindow(title: "b7".tr),
    ),
    Marker(
      markerId: MarkerId("b8".tr),
      position: const LatLng(26.348296017573244, 43.74435877194481),
      infoWindow: InfoWindow(title: "b8".tr),
    ),
    Marker(
      markerId: MarkerId("lai1".tr),
      position: const LatLng(26.348843621185633, 43.76558638978577),
      infoWindow: InfoWindow(title: "lai1".tr),
    ),
    Marker(
      markerId: MarkerId("lai2".tr),
      position: const LatLng(26.345713407041035, 43.763189348715265),
      infoWindow: InfoWindow(title: "lai2".tr),
    ),
    Marker(
      markerId: MarkerId("lai3".tr),
      position: const LatLng(26.348524641166627, 43.76657187324112),
      infoWindow: InfoWindow(title: "lai3".tr),
    ),
    Marker(
      markerId: MarkerId("lai4".tr),
      position: const LatLng(26.34886896963504, 43.76636980017489),
      infoWindow: InfoWindow(title: "lai4".tr),
    ),
    Marker(
      markerId: MarkerId("lai5".tr),
      position: const LatLng(26.360606920779862, 43.76517484510339),
      infoWindow: InfoWindow(title: "lai5".tr),
    ),
    Marker(
      markerId: MarkerId("h1".tr),
      position: const LatLng(26.35122103893483, 43.773941107676876),
      infoWindow: InfoWindow(title: "h1".tr),
    ),
    Marker(
      markerId: MarkerId("h2".tr),
      position: const LatLng(26.351831214423814, 43.77504330017547),
      infoWindow: InfoWindow(title: "h2".tr),
    ),
    Marker(
      markerId: MarkerId("h3".tr),
      position: const LatLng(26.355841600257694, 43.7761836924104),
      infoWindow: InfoWindow(title: "h3".tr),
    ),
    Marker(
      markerId: MarkerId("h4".tr),
      position: const LatLng(26.355683101685557, 43.77548701417721),
      infoWindow: InfoWindow(title: "h4".tr),
    ),
    Marker(
      markerId: MarkerId("spe1".tr),
      position: const LatLng(26.34864803558948, 43.76453342297615),
      infoWindow: InfoWindow(title: "spe1".tr),
    ),
    Marker(
      markerId: MarkerId("spe2".tr),
      position: const LatLng(26.349067084376696, 43.76659229200432),
      infoWindow: InfoWindow(title: "spe2".tr),
    ),
    Marker(
      markerId: MarkerId("spe3".tr),
      position: const LatLng(26.353272582144303, 43.76376657976202),
      infoWindow: InfoWindow(title: "spe3".tr),
    ),
    Marker(
      markerId: MarkerId("spe4".tr),
      position: const LatLng(26.352032667852804, 43.762130035389205),
      infoWindow: InfoWindow(title: "spe4".tr),
    ),
    Marker(
      markerId: MarkerId("spe5".tr),
      position: const LatLng(26.349597020208535, 43.760061329147),
      infoWindow: InfoWindow(title: "spe5".tr),
    ),
    Marker(
      markerId: MarkerId("spe6".tr),
      position: const LatLng(26.348694270019365, 43.75576380102693),
      infoWindow: InfoWindow(title: "spe6".tr),
    ),
    Marker(
      markerId: MarkerId("spe7".tr),
      position: const LatLng(26.346026856949493, 43.754930768348856),
      infoWindow: InfoWindow(title: "spe7".tr),
    ),
    Marker(
      markerId: MarkerId("spe8".tr),
      position: const LatLng(26.364269548755832, 43.75137170664656),
      infoWindow: InfoWindow(title: "spe8".tr),
    ),
    Marker(
      markerId: MarkerId("spe9".tr),
      position: const LatLng(26.362452674525617, 43.747185900969534),
      infoWindow: InfoWindow(title: "spe9".tr),
    ),
  };

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
