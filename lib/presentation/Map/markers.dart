import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gpa/presentation/Map/map.dart';
import 'package:gpa/presentation/home/home_screen.dart';

ImageConfiguration images = ImageConfiguration();

class marks extends ConsumerStatefulWidget {
  marks({Key? key}) : super(key: key);

  static final Set<Marker> Qbuildings = {
    Marker(
      markerId: MarkerId("كلية الطب البشري - مبنى الطالبات B2 "),
      position: LatLng(26.352922094022734, 43.77393488788893),
      infoWindow: InfoWindow(title: "كلية الطب البشري - مبنى الطالبات"),
    ),
    const Marker(
      markerId: MarkerId("Qassim University Grand Mosque"),
      position: LatLng(26.34864615733482, 43.764528904833334),
      infoWindow: InfoWindow(title: "Qassim University Grand Mosque"),
      icon: BitmapDescriptor.defaultMarker,
    ),
    const Marker(
      markerId: MarkerId("College of Languages & Humanities"),
      position: LatLng(26.349387167211944, 43.765018229733535),
      infoWindow: InfoWindow(title: "College of Languages & Humanities"),
    ),
    const Marker(
      markerId: MarkerId("كلية الصيدلة"),
      position: LatLng(26.350659189721537, 43.767918903374316),
      infoWindow: InfoWindow(title: "كلية الصيدلة"),
    ),
    const Marker(
      markerId: MarkerId("مركز الدراسات الجامعية للبنات"),
      position: LatLng(26.348296017573244, 43.74435877194481),
      infoWindow: InfoWindow(title: "مركز الدراسات الجامعية للبنات"),
    ),
    const Marker(
      markerId: MarkerId("الإدارة"),
      position: LatLng(26.34900556147856, 43.76863773531845),
      infoWindow: InfoWindow(title: "الإدارة"),
    ),
    const Marker(
      markerId: MarkerId("بوابة كلية الحاسب"),
      position: LatLng(26.361366216044438, 43.75166223639429),
      infoWindow: InfoWindow(title: "بوابة كلية الحاسب"),
    ),
    const Marker(
      markerId: MarkerId("العلوم"),
      position: LatLng(26.34739841528648, 43.76734840839205),
      infoWindow: InfoWindow(title: "العلوم"),
    ),
    const Marker(
      markerId: MarkerId("كلية الحاسب للبنات"),
      position: LatLng(26.36095082397776, 43.749291034015464),
      infoWindow: InfoWindow(title: "كلية الحاسب للبنات"),
    ),
    const Marker(
      markerId: MarkerId("الهندسة"),
      position: LatLng(26.347226658485795, 43.76611019011761),
      infoWindow: InfoWindow(title: "الهندسة"),
    ),
    const Marker(
      markerId: MarkerId("بوابة الباصات التصاميم"),
      position: LatLng(26.362985125367604, 43.749745190216345),
      infoWindow: InfoWindow(title: "بوابة الباصات التصاميم"),
    ),
    const Marker(
      markerId: MarkerId("كلية الشريعة"),
      position: LatLng(26.348450278424348, 43.76498582490215),
      infoWindow: InfoWindow(title: "كلية الشريعة"),
    ),
    const Marker(
      markerId: MarkerId("كلية التصاميم"),
      position: LatLng(26.362782853570597, 43.74810475521704),
      infoWindow: InfoWindow(title: "كلية التصاميم"),
    ),
    const Marker(
      markerId: MarkerId("الجامع"),
      position: LatLng(26.34864803558948, 43.76453342297615),
      infoWindow: InfoWindow(title: "الجامع"),
    ),
    const Marker(
      markerId: MarkerId("كلية الزراعة والبيطري"),
      position: LatLng(26.362970238369446, 43.7484636116622),
      infoWindow: InfoWindow(title: "كلية الزراعة والبيطري"),
    ),
    const Marker(
      markerId: MarkerId("مركز تصوير"),
      position: LatLng(26.348843621185633, 43.76558638978577),
      infoWindow: InfoWindow(title: "مركز تصوير"),
    ),
    const Marker(
      markerId: MarkerId("كافيه غزلان"),
      position: LatLng(26.34882323885558, 43.76529196343982),
      infoWindow: InfoWindow(title: "كافيه غزلان"),
    ),
    const Marker(
      markerId: MarkerId("فانز"),
      position: LatLng(26.348892104022724, 43.765296502361345),
      infoWindow: InfoWindow(title: "فانز"),
    ),
    const Marker(
      markerId: MarkerId("ادارة الأمن الجامعي جامعة القصيم"),
      position: LatLng(26.346433260575168, 43.764021791756385),
      infoWindow: InfoWindow(title: "ادارة الأمن الجامعي جامعة القصيم"),
    ),
    const Marker(
      markerId: MarkerId("مبنى عمادة كلية الهندسة"),
      position: LatLng(26.346443145893083, 43.76382332887437),
      infoWindow: InfoWindow(title: "مبنى عمادة كلية الهندسة"),
    ),
    const Marker(
      markerId: MarkerId("قسم الهندسة الكهربائية"),
      position: LatLng(26.346640673578136, 43.7638223744236),
      infoWindow: InfoWindow(title: "قسم الهندسة الكهربائية"),
    ),
    const Marker(
      markerId: MarkerId("مركز الوثائق والمحفوظات الجامعية"),
      position: LatLng(26.34692214807139, 43.76397215109317),
      infoWindow: InfoWindow(title: "مركز الوثائق والمحفوظات الجامعية"),
    ),
    const Marker(
      markerId: MarkerId("كلية الهندسة"),
      position: LatLng(26.3469723809983, 43.7639916757364),
      infoWindow: InfoWindow(title: "كلية الهندسة"),
    ),
    const Marker(
      markerId: MarkerId("المختبر الهندسي"),
      position: LatLng(26.347055029234144, 43.76399652770178),
      infoWindow: InfoWindow(title: "المختبر الهندسي"),
    ),
    const Marker(
      markerId: MarkerId("قسم الهندسة المدنية"),
      position: LatLng(26.34718031299491, 43.76399938877381),
      infoWindow: InfoWindow(title: "قسم الهندسة المدنية"),
    ),
    const Marker(
      markerId: MarkerId("مبنى مكتبة الجامعة"),
      position: LatLng(26.348099125402396, 43.76428726704646),
      infoWindow: InfoWindow(title: "مبنى مكتبة الجامعة"),
    ),
    const Marker(
      markerId: MarkerId("المكتبة"),
      position: LatLng(26.34810256857138, 43.76428913722175),
      infoWindow: InfoWindow(title: "المكتبة"),
    ),
    const Marker(
      markerId: MarkerId("كلية العلوم"),
      position: LatLng(26.348202999061032, 43.764412387680285),
      infoWindow: InfoWindow(title: "كلية العلوم"),
    ),
    const Marker(
      markerId: MarkerId("مركز التجميل"),
      position: LatLng(26.348086855853103, 43.76440430507314),
      infoWindow: InfoWindow(title: "مركز التجميل"),
    ),
    const Marker(
      markerId: MarkerId("كلية التمريض"),
      position: LatLng(26.348368754299293, 43.76454394382294),
      infoWindow: InfoWindow(title: "كلية التمريض"),
    ),
    const Marker(
      markerId: MarkerId("الخدمات الطلابية"),
      position: LatLng(26.34854067437685, 43.76478991817432),
      infoWindow: InfoWindow(title: "الخدمات الطلابية"),
    ),
    const Marker(
      markerId: MarkerId("مركز الإرشاد الأكاديمي"),
      position: LatLng(26.348689037611583, 43.76515279321954),
      infoWindow: InfoWindow(title: "مركز الإرشاد الأكاديمي"),
    ),
    const Marker(
      markerId: MarkerId("مدخل البوابة الرئيسية"),
      position: LatLng(26.34901059372577, 43.767438759142056),
      infoWindow: InfoWindow(title: "مدخل البوابة الرئيسية"),
    ),
    const Marker(
      markerId: MarkerId("مواقف الدراجات"),
      position: LatLng(26.346666267248636, 43.76846277664168),
      infoWindow: InfoWindow(title: "مواقف الدراجات"),
    ),
    const Marker(
      markerId: MarkerId("مبنى الصيدلة"),
      position: LatLng(26.34967671377754, 43.76863253048418),
      infoWindow: InfoWindow(title: "مبنى الصيدلة"),
    ),
    const Marker(
      markerId: MarkerId("كلية العلوم التطبيقية"),
      position: LatLng(26.350071401508017, 43.76963578115578),
      infoWindow: InfoWindow(title: "كلية العلوم التطبيقية"),
    ),
    const Marker(
      markerId: MarkerId("مكتبة الجامعة"),
      position: LatLng(26.349454222788997, 43.767813192621906),
      infoWindow: InfoWindow(title: "مكتبة الجامعة"),
    ),
    const Marker(
      markerId: MarkerId("مبنى الخدمات الطلابية"),
      position: LatLng(26.348570940433758, 43.76479165516661),
      infoWindow: InfoWindow(title: "مبنى الخدمات الطلابية"),
    ),
  };

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
