import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

class aboutProgram extends StatefulWidget {
  const aboutProgram({super.key});

  @override
  State<aboutProgram> createState() => __aboutProgramState();
}

class __aboutProgramState extends State<aboutProgram> {
  final Map<String, dynamic> departmentInfo = {
    "البداية": """
        تأسس قسم علوم الحاسب في العام الدراسي 1419/1418هـ متزامناً مع إنشاء كلية العلوم بجامعة القصيم، لتلبية حاجة القطاعات المختلفة بالمملكة من هذا التخصص ولإعداد الكفاءات والخبرات المطلوبة. ويسعى القسم الى تأهيل الطالب ليكون بعد تخرجه متخصصا في مجال علوم الحاسب من حيث دراسة أنظمة الحاسب وتحليلها وأساليب بنائها بالإضافة إلى الأدوات البرمجية المساعدة مثل أنظمة التشغيل واللغات البرمجية المتنوعة وشبكات الحاسب. وقد أعدت المقررات الدراسية التي يتلقاها الطالب لتهيئته وتزويده بالمعرفة والمهارات الضرورية للاحتراف في هذا المجال. ويتم تأهيل الخريج ليكون قادراً على العمل في القطاع الحكومي والخاص مثل شركات تصميم البرمجيات والجامعات والمؤسسات التعليمية وشركات الاتصالات والانترنت ومختلف الشركات والمؤسسات المرتبطة بمجال التخصص. يتدرج الخريج في دراسة المواد التي تأهله إلى إنجاز هذه المهام وحل المشكلات (بإدخال أنظمة الحاسب إليها) على محورين: أكاديمياً في محاضرات علمية يلقيها متخصصون، وعملياً في الساعات المعملية ومشاريع التخرج وكذلك التدريب الميداني.
    """,
    "رئيس القسم": {
      "name": "د. محمد بن عبدالرحمن السحيباني",
      "office": "GR-210",
      "extension": "20394 - 12700",
      "email": "m.suhibani@qu.edu.sa"
    },
    "الرؤية":
        "يتطلع قسم علوم الحاسب لتحقيق الريادة في التعليم والبحث العلمي في جميع مجالات علوم الحاسب​.",
    "نظام الدراسة بالقسم": """
        طبقاً للخطة الدراسية، الطالب يدرس ثمانية فصول دراسية (4 سنوات) بعد السنة التحضيرية أو إتمام 145 وحده دراسية بعد السنة التحضيرية في أي برنامج من برامج أقسام الكلية لإكمال دراسته كالتالي:
        - متطلبات الجامعة (12 وحده دراسية)
        - متطلبات كلية الحاسب (65 وحده دراسية)
        - متطلبات قسم علوم الحاسب (68 وحده دراسية)، متضمنة 6 وحدات دراسية مُخصصة لمشروع التخرج. ينجزه الطالب تحت إشراف أحد أعضاء هيئة التدريس.
        - التدريب (من متطلبات التخرج)، لفترة لا تقل عن شهرين فى إحدى المؤسسات، بعد أن يكمل بنجاح 72 وحدة دراسية. ويهدف هذا التدرب إلى التقريب بين الدراسة في القسم، والعمل المهني في القطاعين العام والخاص. ويقوم القسم بتوزيع الطلبة على جهات التدرب بالاتفاق مع هذه الجهات، للقيام لتنفيذ التدرب خلال الإجازة الصيفية، ويتم التوزيع على أساس رغبة الطالب والفرص المتاحة.
    """,
    "الهيكل العام للخطة الدراسية لقسم علوم الحاسب": """
    · السنة التحضيرية: 34 ساعة معتمدة

    · مجموع الساعات المعتمدة: 128 ساعة معتمدة
    
    · أي ساعة نظرية معتمدة تساوي 50 دقيقة للمحاضرة
    
    · أي ساعة عملي معتمدة تساوي 100 دقيقة للمعمل
        """
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110.0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.primary,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(75, 0, 0, 0),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: AppBar(
            elevation: 0,
            toolbarHeight: 90,
            title: Text(
              "About program".tr,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                MyLocal.getFontFamily(Get.locale!.languageCode),
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: ColorManager.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: const [],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Text(
              "begining".tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(departmentInfo["البداية".tr]),
            const SizedBox(height: 20),
            Text("res".tr,
                style: GoogleFonts.getFont(
                    MyLocal.getFontFamily(Get.locale!.languageCode),
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Name:".tr + " ${departmentInfo["رئيس القسم"]["name"]}"),
            Text("off".tr + " ${departmentInfo["رئيس القسم"]["office"]}"),
            Text("tah".tr + " ${departmentInfo["رئيس القسم"]["extension"]}"),
            Text("Email:".tr + " ${departmentInfo["رئيس القسم"]["email"]}"),
            const SizedBox(height: 20),
            Text(
              "vig".tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(departmentInfo["الرؤية".tr]),
            const SizedBox(height: 20),
            Text(
              "sys".tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(departmentInfo["نظام الدراسة بالقسم".tr]),
            const SizedBox(height: 20),
            Text(
              "haykal".tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
                departmentInfo['الهيكل العام للخطة الدراسية لقسم علوم الحاسب']),
          ],
        ),
      ),
    );
  }
}
