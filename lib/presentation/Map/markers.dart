import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class marks extends StatefulWidget {
  const marks({super.key});

  static final Set<Marker> Qbuildings = {
    Marker(
      markerId: MarkerId("كلية الطب البشري - مبنى الطالبات B2 "),
      position: LatLng(26.352922094022734, 43.77393488788893),
      infoWindow: InfoWindow(title: "كلية الطب البشري - مبنى الطالبات"),
    ),
    Marker(
      markerId: MarkerId("كلية الصيدلة B4"),
      position: LatLng(26.350659189721537, 43.767918903374316),
      infoWindow: InfoWindow(title: "كلية الصيدلة"),
    ),
    Marker(
      markerId: MarkerId("مركز الدراسات الجامعية للبنات"),
      position: LatLng(26.348296017573244, 43.74435877194481),
      infoWindow: InfoWindow(title: "مركز الدراسات الجامعية للبنات"),
    ),
    Marker(
      markerId: MarkerId("الإدارة"),
      position: LatLng(26.34900556147856, 43.76863773531845),
      infoWindow: InfoWindow(title: "الإدارة"),
    ),
    const Marker(
      markerId: MarkerId("بوابة كلية الحاسب"),
      position: LatLng(26.361366216044438, 43.75166223639429),
      infoWindow: InfoWindow(title: "بوابة كلية الحاسب"),
    ),
    Marker(
      markerId: MarkerId("العلوم A4"),
      position: LatLng(26.34739841528648, 43.76734840839205),
      infoWindow: InfoWindow(title: "العلوم"),
    ),
    const Marker(
      markerId: MarkerId("كلية العلوم"),
      position: LatLng(26.348202999061032, 43.764412387680285),
      infoWindow: InfoWindow(title: "كلية العلوم"),
    ),
    const Marker(
      markerId: MarkerId(" F5 كلية الحاسب للبنات"),
      position: LatLng(26.36095082397776, 43.749291034015464),
      infoWindow: InfoWindow(title: "كلية الحاسب للبنات"),
    ),
    Marker(
      markerId: MarkerId("الهندسة A5"),
      position: LatLng(26.347226658485795, 43.76611019011761),
      infoWindow: InfoWindow(title: "الهندسة"),
    ),
    const Marker(
      markerId: MarkerId("بوابة الباصات التصاميم"),
      position: LatLng(26.362985125367604, 43.749745190216345),
      infoWindow: InfoWindow(title: "بوابة الباصات التصاميم"),
    ),
    Marker(
      markerId: MarkerId(" A6   كلية الشريعة والعربي"),
      position: LatLng(26.348450278424348, 43.76498582490215),
      infoWindow: InfoWindow(title: "كلية الشريعة والعربي"),
    ),
    const Marker(
      markerId: MarkerId("كلية التصاميم"),
      position: LatLng(26.362782853570597, 43.74810475521704),
      infoWindow: InfoWindow(title: "كلية التصاميم"),
    ),
    Marker(
      markerId: MarkerId("الجامع"),
      position: LatLng(26.34864803558948, 43.76453342297615),
      infoWindow: InfoWindow(title: "الجامع"),
    ),
    Marker(
      markerId: MarkerId("مركز تصوير"),
      position: LatLng(26.348843621185633, 43.76558638978577),
      infoWindow: InfoWindow(title: "مركز تصوير"),
    ),
    const Marker(
      markerId: MarkerId(" A2 كلية الزراعة والبيطري"),
      position: LatLng(26.362970238369446, 43.7484636116622),
      infoWindow: InfoWindow(title: "كلية الزراعة والبيطري"),
    ),
    Marker(
      markerId: MarkerId("كافيه غزلان"),
      position: LatLng(26.34882323885558, 43.76529196343982),
      infoWindow: InfoWindow(title: "كافيه غزلان"),
    ),
    Marker(
      markerId: MarkerId("فانز"),
      position: LatLng(26.348892104022724, 43.765296502361345),
      infoWindow: InfoWindow(title: "فانز"),
    ),
    Marker(
      markerId: MarkerId("ادارة الأمن الجامعي جامعة القصيم A16"),
      position: LatLng(26.346433260575168, 43.764021791756385),
      infoWindow: InfoWindow(title: "ادارة الأمن الجامعي جامعة القصيم"),
    ),
    Marker( 
      markerId: MarkerId("مبنى عمادة كلية الهندسة"),
      position: LatLng(26.346443145893083, 43.76382332887437),
      infoWindow: InfoWindow(title: "مبنى عمادة كلية الهندسة"),
    ),
    const Marker(
      markerId: MarkerId("المكتبة"),
      position: LatLng(26.34810256857138, 43.76428913722175),
      infoWindow: InfoWindow(title: "المكتبة"),
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
      markerId: MarkerId("الخدمات الطلابية"),
      position: LatLng(26.34854067437685, 43.76478991817432),
      infoWindow: InfoWindow(title: "الخدمات الطلابية"),
    ),
    Marker(
      markerId: MarkerId("قسم الهندسة الكهربائية"),
      position: LatLng(26.346640673578136, 43.7638223744236),
      infoWindow: InfoWindow(title: "قسم الهندسة الكهربائية"),
    ),
    Marker(
      markerId: MarkerId("مركز الوثائق والمحفوظات الجامعية"),
      position: LatLng(26.34692214807139, 43.76397215109317),
      infoWindow: InfoWindow(title: "مركز الوثائق والمحفوظات الجامعية"),
    ),
    Marker(
      markerId: MarkerId("كلية التربية A14"),
      position: LatLng(26.344544538114047, 43.764318015121574),
      infoWindow: InfoWindow(title: "كلية التربية"),
    ),
    Marker(
      markerId: MarkerId("عمادة الموارد البشرية A13"),
      position: LatLng(26.344077401031996, 43.76491348148404),
      infoWindow: InfoWindow(title: "عمادة الموارد البشرية"),
    ),
    const Marker(
      markerId: MarkerId("مركز التجميل"),
      position: LatLng(26.348086855853103, 43.76440430507314),
      infoWindow: InfoWindow(title: "مركز التجميل"),
    ),
    Marker(
      markerId: MarkerId("مركز تنمية القيادات والقدرات A13"),
      position: LatLng(26.343850394765813, 43.765026945011925),
      infoWindow: InfoWindow(title: "مركز تنمية القيادات والقدرات"),
    ),
    Marker(
      markerId: MarkerId("إدارة الإسكان A16"),
      position: LatLng(26.346614831348024, 43.76003020811748),
      infoWindow: InfoWindow(title: "إدارة الإسكان"),
    ),
    Marker(
      markerId: MarkerId("كلية اللغات والعلوم الإنسانية"),
      position: LatLng(26.349508385019707, 43.7651054235499),
      infoWindow: InfoWindow(title: "كلية اللغات والعلوم الإنسانية"),
    ),
    Marker(
      markerId: MarkerId("عمادة القبول والتسجيل"),
      position: LatLng(26.35203566120996, 43.76545628839597),
      infoWindow: InfoWindow(title: "عمادة القبول والتسجيل"),
    ),
    Marker(
      markerId: MarkerId("عمادة البحث العلمي"),
      position: LatLng(26.352271340087285, 43.76503071418529),
      infoWindow: InfoWindow(title: "عمادة البحث العلمي"),
    ),
    Marker(
      markerId: MarkerId("عمادة التطوير والجودة"),
      position: LatLng(26.35224515609609, 43.76471609162526),
      infoWindow: InfoWindow(title: "عمادة التطوير والجودة"),
    ),
    Marker(
      markerId: MarkerId("عمادة التعلم الإلكتروني والتعليم عن بعد"),
      position: LatLng(26.352151566940304, 43.76449685632332),
      infoWindow: InfoWindow(title: "عمادة التعلم الإلكتروني والتعليم عن بعد"),
    ),
    Marker(
      markerId: MarkerId("عمادة شؤون الطلاب"),
      position: LatLng(26.352007030491325, 43.7660545707422),
      infoWindow: InfoWindow(title: "عمادة شؤون الطلاب"),
    ),
    Marker(
      markerId: MarkerId("A7 عمادة الدراسات العليا"),
      position: LatLng(26.352088148055838, 43.7662510425329),
      infoWindow: InfoWindow(title: "عمادة الدراسات العليا"),
    ),
    Marker(
      markerId: MarkerId("كلية العلوم الطبية التطبيقية A4"),
      position: LatLng(26.347049025390778, 43.7673376158313),
      infoWindow: InfoWindow(title: "كلية العلوم الطبية التطبيقية"),
    ),
    Marker(
      markerId: MarkerId("ليون"),
      position: LatLng(26.347511005932034, 43.766514570932216),
      infoWindow: InfoWindow(title: "ليون"),
    ),
    Marker(
      markerId: MarkerId("شاورما عنتر"),
      position: LatLng(26.347646751108847, 43.76704452817856),
      infoWindow: InfoWindow(title: "شاورما عنتر"),
    ),
    Marker(
      markerId: MarkerId("كلية الاقتصاد والإدارة A3 "),
      position: LatLng(26.34884281321887, 43.768638347598056),
      infoWindow: InfoWindow(title: "كلية الاقتصاد والإدارة"),
    ),
    Marker(
      markerId: MarkerId("رغيف"),
      position: LatLng(26.348813021220153, 43.76795484958039),
      infoWindow: InfoWindow(title: "رغيف"),
    ),
    Marker(
      markerId: MarkerId("وحدة الدراسات العليا في كلية الأعمال والاقتصاد"),
      position: LatLng(26.34920310935825, 43.767975469692615),
      infoWindow:
          InfoWindow(title: "وحدة الدراسات العليا في كلية الأعمال والاقتصاد"),
    ),
    Marker(
      markerId: MarkerId("QU CODE LAB"),
      position: LatLng(26.348409775863217, 43.76924072881003),
      infoWindow: InfoWindow(title: "QU CODE LAB"),
    ),
    Marker(
      markerId: MarkerId("مكتبة الأمير د.فيصل بن مشعل آل سعود"),
      position: LatLng(26.348524641166627, 43.76657187324112),
      infoWindow: InfoWindow(title: "مكتبة الأمير د.فيصل بن مشعل آل سعود"),
    ),
    Marker(
      markerId: MarkerId("مكتبة دار الجامعة _ فرع جامعة القصيم"),
      position: LatLng(26.34886896963504, 43.76636980017489),
      infoWindow: InfoWindow(title: "مكتبة دار الجامعة _ فرع جامعة القصيم"),
    ),
    Marker(
      markerId: MarkerId("أوراق الشاي المغربي"),
      position: LatLng(26.348852407480663, 43.76666375695636),
      infoWindow: InfoWindow(title: "أوراق الشاي المغربي"),
    ),
    Marker(
      markerId: MarkerId("مصرف الراجحي"),
      position: LatLng(26.349067084376696, 43.76659229200432),
      infoWindow: InfoWindow(title: "مصرف الراجحي"),
    ),
    Marker(
      markerId: MarkerId("كول دونات"),
      position: LatLng(26.349203295832567, 43.7669275368094),
      infoWindow: InfoWindow(title: "كول دونات"),
    ),
    Marker(
      markerId: MarkerId("تورينو كافيه"),
      position: LatLng(26.346384776151996, 43.76930093072032),
      infoWindow: InfoWindow(title: "تورينو كافيه"),
    ),
    Marker(
      markerId: MarkerId("بوابة الجامعة الرئيسية"),
      position: LatLng(26.347260516283942, 43.774265909369554),
      infoWindow: InfoWindow(title: "بوابة الجامعة الرئيسية"),
    ),
    Marker(
      markerId: MarkerId("المستشفى الجامعي B1"),
      position: LatLng(26.35122103893483, 43.773941107676876),
      infoWindow: InfoWindow(title: "المستشفى الجامعي"),
    ),
    Marker(
      markerId: MarkerId("طوارئ المستشفى الجامعي"),
      position: LatLng(26.351831214423814, 43.77504330017547),
      infoWindow: InfoWindow(title: "طوارئ المستشفى الجامعي"),
    ),
    Marker(
      markerId: MarkerId("كلية علاج طبيعي - مبنى الطلاب"),
      position: LatLng(26.351603204986336, 43.77241286312792),
      infoWindow: InfoWindow(title: "كلية علاج طبيعي - مبنى الطلاب"),
    ),
    Marker(
      markerId: MarkerId("كلية الطب البشري - مبنى الطلاب"),
      position: LatLng(26.351362323166168, 43.77224142818727),
      infoWindow: InfoWindow(title: "كلية الطب البشري - مبنى الطلاب"),
    ),
    Marker(
      markerId: MarkerId("Qassim University Dental Dept."),
      position: LatLng(26.355841600257694, 43.7761836924104),
      infoWindow: InfoWindow(title: "Qassim University Dental Dept."),
    ),
    Marker(
      markerId: MarkerId("مستشفى طب الأسنان - المبنى الغربي"),
      position: LatLng(26.355683101685557, 43.77548701417721),
      infoWindow: InfoWindow(title: "مستشفى طب الأسنان - المبنى الغربي"),
    ),
    Marker(
      markerId: MarkerId("غزلان كافيه"),
      position: LatLng(26.355484282994045, 43.776023875354674),
      infoWindow: InfoWindow(title: "غزلان كافيه"),
    ),
    Marker(
      markerId: MarkerId("بوابة 8 المدينة الجامعية"),
      position: LatLng(26.356960251993392, 43.77532702732607),
      infoWindow: InfoWindow(title: "بوابة 8 المدينة الجامعية"),
    ),
    Marker(
      markerId: MarkerId("كليه التاهيل الطبي"),
      position: LatLng(26.353133677155398, 43.773754058963085),
      infoWindow: InfoWindow(title: "كليه التاهيل الطبي"),
    ),
    Marker(
      markerId: MarkerId(" مدرسة تعليم القيادة F12"),
      position: LatLng(26.364359349534993, 43.75154282236522),
      infoWindow: InfoWindow(title: "مدرسة تعليم القيادة"),
    ),
    Marker(
      markerId: MarkerId("كلية الطب البشري - المبنى الإداري"),
      position: LatLng(26.352568783229927, 43.77270776943413),
      infoWindow: InfoWindow(title: "كلية الطب البشري - المبنى الإداري"),
    ),
    Marker(
      markerId: MarkerId("كلية التأهيل الطبي المبنى الجديد"),
      position: LatLng(26.352054551497922, 43.77307489814505),
      infoWindow: InfoWindow(title: "كلية التأهيل الطبي المبنى الجديد"),
    ),
    Marker(
      markerId: MarkerId("قسم العلاج الطبيعي"),
      position: LatLng(26.352235225815434, 43.773217717121604),
      infoWindow: InfoWindow(title: "قسم العلاج الطبيعي"),
    ),
    Marker(
      markerId: MarkerId("بارنز"),
      position: LatLng(26.35351543628355, 43.76773744957642),
      infoWindow: InfoWindow(title: "بارنز"),
    ),
    Marker(
      markerId: MarkerId("مركز المؤتمرات"),
      position: LatLng(26.355288803098745, 43.765217558112674),
      infoWindow: InfoWindow(title: "مركز المؤتمرات"),
    ),
    Marker(
      markerId: MarkerId(" كلية الحاسب C1"),
      position: LatLng(26.358446981055806, 43.765952228741504),
      infoWindow: InfoWindow(title: "كلية الحاسب"),
    ),
    Marker(
      markerId: MarkerId("عمادة تقنية المعلومات"),
      position: LatLng(26.358349264180077, 43.76568523245526),
      infoWindow: InfoWindow(title: "عمادة تقنية المعلومات"),
    ),
    Marker(
      markerId: MarkerId("كلية العمارة والتخطيط C1"),
      position: LatLng(26.358137824795612, 43.765587459167335),
      infoWindow: InfoWindow(title: "كلية العمارة والتخطيط"),
    ),
    Marker(
      markerId: MarkerId("ليون"),
      position: LatLng(26.358976771524944, 43.76550535821559),
      infoWindow: InfoWindow(title: "ليون"),
    ),
    Marker(
      markerId: MarkerId("كلية السنة التحضيرية C2"),
      position: LatLng(26.360365179944257, 43.76262170656788),
      infoWindow: InfoWindow(title: "كلية السنة التحضيرية"),
    ),
    Marker(
      markerId: MarkerId("المطاعم الجامعية - فندق 1"),
      position: LatLng(26.356384120308926, 43.76163158832586),
      infoWindow: InfoWindow(title: "المطاعم الجامعية - فندق 1"),
    ),
    Marker(
      markerId: MarkerId("المطاعم الجامعية - فندق 2"),
      position: LatLng(26.355893318568557, 43.76194775526532),
      infoWindow: InfoWindow(title: "المطاعم الجامعية - فندق 2"),
    ),
    Marker(
      markerId: MarkerId("المطاعم الجامعية - فندق 3"),
      position: LatLng(26.35629904235071, 43.76230666422807),
      infoWindow: InfoWindow(title: "المطاعم الجامعية - فندق 3"),
    ),
    Marker(
      markerId: MarkerId("معمل 3 متقدم"),
      position: LatLng(26.35926023222726, 43.76478163049126),
      infoWindow: InfoWindow(title: "معمل 3 متقدم"),
    ),
    Marker(
      markerId: MarkerId("معمل 1 اساسي"),
      position: LatLng(26.359363263386805, 43.76473072915585),
      infoWindow: InfoWindow(title: "معمل 1 اساسي"),
    ),
    Marker(
      markerId: MarkerId("معمل 1 متقدم"),
      position: LatLng(26.359426344477323, 43.76465443724424),
      infoWindow: InfoWindow(title: "معمل 1 متقدم"),
    ),
    Marker(
      markerId: MarkerId("قاعة اجتماعات 2"),
      position: LatLng(26.359533405670406, 43.764588977963706),
      infoWindow: InfoWindow(title: "قاعة اجتماعات 2"),
    ),
    Marker(
      markerId: MarkerId("قاعة اجتماعات 1"),
      position: LatLng(26.359577108145194, 43.7644975640577),
      infoWindow: InfoWindow(title: "قاعة اجتماعات 1"),
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
    Marker(
      markerId: MarkerId("كلية الزراعة والبيطري"),
      position: LatLng(26.362970238369446, 43.7484636116622),
      infoWindow: InfoWindow(title: "كلية الزراعة والبيطري"),
    ),
    Marker(
      markerId: MarkerId("كلية الشريعة والدراسات الإسلامية للبنات F4"),
      position: LatLng(26.36259680720437, 43.74760579861648),
      infoWindow: InfoWindow(title: "كلية الشريعة والدراسات الإسلامية للبنات"),
    ),
    Marker(
      markerId: MarkerId("رغيف"),
      position: LatLng(26.362469746326756, 43.74852143480965),
      infoWindow: InfoWindow(title: "رغيف"),
    ),
    Marker(
      markerId: MarkerId("حضانة مكارم الطفل لرعاية الأطفال"),
      position: LatLng(26.362452674525617, 43.747185900969534),
      infoWindow: InfoWindow(title: "حضانة مكارم الطفل لرعاية الأطفال"),
    ),
    Marker(
      markerId: MarkerId("كول دونات"),
      position: LatLng(26.362326502932003, 43.747238874592284),
      infoWindow: InfoWindow(title: "كول دونات"),
    ),
    Marker(
      markerId: MarkerId("كلية العمارة والتخطيط للطالبات"),
      position: LatLng(26.363789189457712, 43.74767434854764),
      infoWindow: InfoWindow(title: "كلية العمارة والتخطيط للطالبات"),
    ),
    Marker(
      markerId: MarkerId("الكلية التطبيقية C2"),
      position: LatLng(26.364055434368524, 43.74696230719967),
      infoWindow: InfoWindow(title: "الكلية التطبيقية"),
    ),
    Marker(
      markerId: MarkerId("بوابة كلية التغذية والشريعة والتصاميم"),
      position: LatLng(26.36321513836393, 43.74558221307835),
      infoWindow: InfoWindow(title: "بوابة كلية التغذية والشريعة والتصاميم"),
    ),
    Marker(
      markerId: MarkerId(" F2 كلية العلوم للبنات"),
      position: LatLng(26.36141591966223, 43.74625691972054),
      infoWindow: InfoWindow(title: "كلية العلوم للبنات"),
    ),
    Marker(
      markerId: MarkerId("كلية الاقتصاد والإدارة للبنات F3"),
      position: LatLng(26.36059158075166, 43.74615810724614),
      infoWindow: InfoWindow(title: "كلية الاقتصاد والإدارة للبنات"),
    ),
    Marker(
      markerId: MarkerId("بوابة ؟؟"),
      position: LatLng(26.36123150862995, 43.744917260962644),
      infoWindow: InfoWindow(title: "بوابة ؟؟"),
    ),
    Marker(
      markerId: MarkerId("بوابة كلية الإقتصاد و الإدارة"),
      position: LatLng(26.359095670259887, 43.745665897722255),
      infoWindow: InfoWindow(title: "بوابة كلية الإقتصاد و الإدارة"),
    ),
    Marker(
      markerId: MarkerId("Lion cafe"),
      position: LatLng(26.360902294743855, 43.74952716477048),
      infoWindow: InfoWindow(title: "Lion cafe"),
    ),
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
