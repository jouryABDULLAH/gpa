import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "profiletitle": "حسابي",
          "empty": "لا يجب ان يكون الحقل فارغ",
          "home": "الرئيسية",
          "Services": "الخدمات",
          "namik": "نامق",
          "map": "الخريطة",
          "account": "حسابي",
          "GPA": "حاسبة المعدل",
          "GPA_1": "فصلي",
          "GPA_2": "تراكمي",
          "GPA_11": "حساب المعدل الفصلي",
          "GPA_22": "حساب المعدل التراكمي",
          "ph": "الساعات السابقة",
          "vi": "ادخل/ـي رقمًا",
          "pg": "المعدل السابق",
          "pa": "الرجاء إدخال مادة",
          "LN": " اسم المادة",
          "points": "المعدل",
          "rules": "دليل الطالب",
          "rules_2": "خدمات و قوانين الجامعة",
          "serv": "خدمات الجامعة",
          "serv_2": " الخدمات المعروضة هي خدمات مقررة من الجامعة",
          "serv_steps": "خطوات تنفيذ الخدمة:",
          "List": "قائمة",
          "Plan progress": "الخطة\n(بالساعات)",
          "Calendar": "تقويم",
          "Acadmic": "التقويم الأكاديمي",
          "more": "المزيد",
          "Name": "الاسم",
          "UID": "الرقم الجامعي",
          "University ID": "الرقم الجامعي",
          "info": "معلوماتي",
          "back": "العودة للخلف",
          "pass": "تغيير كلمة المرور",
          "new pass": "كلمة المرور الجديدة",
          "curr pass": "كلمة المرور الحالية",
          "ch pass": "تم تغيير كلمة المرور بنجاح",
          "ent pass": "يجب ان تكون كلمة المرور المدخلة متماثله ",
          "who": "عن جامعة القصيم",
          "out": "تسجيل الخروج",
          "fill": "يجب تعبئة هذا الحقل",
          "change e": "تغيير البريد",
          "change n": "تغيير الاسم",
          "most": " @qu.edu.saيجب ان يكون البريد الخاص بك منتهي بـ",
          "Save": "حفظ",
          "qmap": "خريطة جامعة القصيم",
          "forget": "؟نسيت كلمة المرور",
          "sign up": "تسجيل",
          "error": "حدث خطأ ما",
          "too weak": "كلمة مرور ضعيفة",
          "no user": "لا يوجد مستخدم مطابق لهذا البريد",
          "no pass": "كلمة المرور لا تطابق المستخدم",
          "Nice": "أهلًا بك !",
          "Login": "تسجيل الدخول",
          "forge": "نسيت",
          "forgpage": "نسيان كلمة المرور",
          "forgpage1":
              "أدخل بريدك الإلكتروني لعملية التحقق، \nسنرسل  رمزًا مكونًا من أربعة أرقام الى بريدك الإلكتروني",
          "welcome": "مرحبًا بعودتك!",
          "wrong": "البريد لا يطابق",
          "less": " يجب ان تكون كلمة المرور على الاقل 8 خانات",
          "lessi": " يجب ان يكون الرقم الجامعي على الاقل 9 ارقام",
          "conf": "تأكيد كلمة المرور",
          "account updated": "تم تحديث الحساب بنجاح",
          "Dacc": "ليس لديك حساب؟",
          "Lang": "اللغة",
          "ab":
              " \nتبرز جامعة القصيم كمؤسسة تعليمية رائدة في المملكة العربية السعودية، مشهورة بالتزامها بالتميز الأكاديمي والبحث المبتكر والمشاركة الفعّالة في المجتمع. تحتل مكانة بين أفضل الجامعات في البلاد، حيث تقدم مجموعة واسعة من البرامج الجامعية والدراسات العليا والمهنية التي تهدف إلى تزويد الطلاب بالمهارات اللازمة لمسارات مهنية ناجحة. \n\nتزرع الجامعة بيئة بحثية ديناميكية، حيث يشارك الهيئة التدريسية والطلاب في مشاريع رائدة تمتد عبر مجموعة من المجالات. من خلال تعزيز الشراكات والمشاركة في مبادرات التواصل مع المجتمع، تعمل جامعة القصيم على معالجة القضايا الاجتماعية الملحة والمساهمة بشكل كبير في التقدم الاجتماعي.\n\nوعلاوة على ذلك، يُعزز الأثر العالمي لجامعة القصيم من خلال تعاونها الدولي، بينما تبرز الجوائز والتكريمات العديدة جهودها الدؤوبة نحو التميز وتأثيرها الإيجابي على المجتمع. في جوهرها، تظل جامعة القصيم متمسكة بسعيها نحو التميز الأكاديمي والابتكار وخدمة المجتمع، مما يعكس التزامها الدائم بالتعليم العالي والتقدم الاجتماعي.\n\n",
          "search": "إبحث",
          "hou": "الساعات",
          "WN": "مرحبًا، نامق في خدمتك!",
          "send": "إرسال",
          "h": "الساعات",
          "g": "الدرجة",
          "Email": "البريد الالكتروني",
          "email": "البريد الالكتروني",
          "Password": "رمز الدخول",
          "wroname": "يجب ان يكون الاسم باللغة العربية",
          "password": "رمز الدخول",
          "notNum": "الرقم المدخل يجب ان يتكون من ارقام فقط",
          "ConfPassword": "تأكيد كلمة المرور",
          "Confpassword": "تأكيد كلمة المرور",
          "equals": "كلمة المرور المدخلة غير متطابقة",
          "Name:": "الاسم:",
          "Email:": "البريد الالكتروني:",
          "servpage": "الخدمات الاكاديمية",
          "Course Name": "اسم المادة",
          "Enter The Previous GPA": "ادخل المعدل السابق",
          "Arabic": "العربية",
          "English": "الانجليزية",
          "student plan": "خطة الطالب",
          "About program": "عن البرنامج",
          "Academic advisor": "المرشد الاكاديمي",
          "plan completion": "اكتمال الخطة",
          "Taken and Completed": "تم اجتيازها واكتمالها",
          "collegehours": "اختياري كلية",
          "CShours": "اختياري تخصص",
          "free hours": "الحرة",
          "plan details": "تفاصيل الخطة",
          "Level": "المستوى",
          "sai": "كلية الصيدلة",
          "mang": "كلية الادارة",
          "sci": "كلية العلوم",
          "eng": "كلية الهندسة",
          "reg": "كلية الشريعة",
          "par": "كلية التربية",
          "midic": "كلية الطب البشري",
          "lang": "كلية اللغات والعلوم الانسانية",
          "app": "كلية العلوم التطبيقية",
          "eco": "كلية الاقتصاد والادارة",
          "phy": "كلية العلاج الطبيعي",
          "mid2": "كلية التأهيل الطبي",
          "comp": "كلية الحاسب",
          "bild": "كلية العمارة والتخطيط",
          "pyp": "كلية السنة التحضيرية",
          "ap": "الكلية التطبيقية",
          "plnf": "كلية التغذية | طالبات",
          "midicf": "كلية الطب البشري | طالبات",
          "compf": "كلية الحاسب | طالبات",
          "desf": "كلية التصاميم | طالبات",
          "regf": "كلية الشريعة | طالبات",
          "bildf": "كلية العمارة والتخطيط | طالبات",
          "appf": "الكلية التطبيقية | طالبات",
          "scif": "كلية العلوم | طالبات ",
          "ecof": "كلية الاقتصاد والادارة | طالبات",
          "parf": "كلية التربية | بنات",
          "princ1": "عمادة كلية الهندسة",
          "princ2": "عمادة الموارد البشرية",
          "princ3": "عمادة القبول والتسجيل",
          "princ4": "عمادة البحث العلمي",
          "princ5": "عمادة التطوير والجودة",
          "princ6": "عمادة التعلم الإلكتروني والتعليم عن بعد",
          "princ7": "عمادة شؤون الطلاب",
          "princ8": "عمادة الدراسات العليا",
          "princ9": "عمادة تقنية المعلومات",
          "princ10": "عمادة السنة التحضيرية",
          "mainout": "بوابة الجامعة الرئيسية",
          "outr": "بوابة أرامكو",
          "out1": "بوابة 8",
          "out2": "بوابة 4",
          "out3": "بوابة 5",
          "out4": "بوابة 6",
          "out5": "بوابة 7",
          "outf1": "بوابة كلية الحاسب",
          "outf2": "بوابة الباصات التصاميم",
          "outf3": "بوابة كلية التغذية والشريعة والتصاميم",
          "outf4": "بوابة كلية العلوم",
          "outf5": "بوابة كلية الإقتصاد و الإدارة",
          "cafe1": "غزلان | كلية الشريعة",
          "cafe2": "فانز | كلية الشريعة",
          "cafe3": "ليون | كلية العلوم والهندسة",
          "cafe4": "اوراق الشاي المغربي | الرئيسي",
          "cafe5": "كول دونات | الرئيسي",
          "cafe6": "تورينو | الرئيسي",
          "cafe7": "غزلان | عيادة الاسنان",
          "cafe8": "بارنز",
          "cafe9": "ليون | كلية الحاسب",
          "rast1": "شاورما عنتر | كلية العلوم والهندسة",
          "rest2": "رغيف",
          "restf1": "رغيف | فرع الطالبات",
          "cafef1": "كول دونات | فرع الطالبات",
          "cafef2": "ليون | فرع الطالبات",
          "b1": "مركز تنمية القيادات والقدرات",
          "b2": "إدارة الإسكان",
          "b3": "وحدة الدراسات العليا|الأعمال والاقتصاد",
          "b4": "QU CODE LAB",
          "b5": "مركز المؤتمرات",
          "b6": "سكن أعضاء هيئة تدريس جامعة القصيم",
          "b7": "الإدارة العامة للمشاريع والصيانة والسلامة",
          "b8": "مركز الدراسات الجامعية | طالبات",
          "lai1": "مركز تصوير",
          "lai2": "مركز الوثائق والمحفوظات",
          "lai3": "مكتبة الأمير د.فيصل بن مشعل آل سعود",
          "lai4": "مكتبة دار الجامعة",
          "lai5": "مكتبة يوسف",
          "h1": "المستشفى الجامعي",
          "h2": "طوارئ المستشفى الجامعي",
          "h3": "عيادات جامعة القصيم",
          "h4": "مستشفى طب الاسنان",
          "spe1": "الجامع",
          "spe2": "مصرف الراجحي",
          "spe3": "المسرح الروماني",
          "spe4": "ملعب جامعة القصيم",
          "spe5": "نادي جامعة القصيم",
          "spe6": "حديقة جامعة القصيم",
          "spe7": "استاد الملعب الدولي",
          "spe8": "مدرسة جامعة القصيم لتعليم القيادة",
          "spe9": "حضانة مكارم الطفل لرعاية الأطفال",
          "CL": "موقعك",
          "MO": "خيارات الدبوس",
          "FR": "البحث عن الطريق",
          "DM": "ازالة الدبوس!",
          "MS": "حفظ الدبوس",
          "MD": "تم حذف الدبوس!",
          "SP": "حفظ الموقع",
          "HN": "اسم الموقع",
          "SA": "حفظ المكان ك؟",
          "plsN": "من فضلك ادخل اسم الموقع",
          "Cancel": "الغاء",
          "totalhours": "الساعات المكتملة",
          "enter your email": "الايميل الخاص بك",
          "mess":
              "تم إرسال رسالة تأكيد إلى بريدك الإلكتروني. يرجى التحقق من بريدك الإلكتروني للمتابعة",
          "erroroccured": "حدث خطأ!",
          "erroroccured2": "حدث خطأ أثناء إرسال الرسالة إلى",
          "TA": "حاول مرة اخرى",
          "lets": "!دعنا نتحدث",
          "hereforU":
              "هنا لمساعدتك على إيجاد إجابات لتساؤلاتك حول الخدمات الأكاديمية وما يخص الجامعة",
          "haykal": "الهيكل العام للخطة الدراسية لقسم علوم الحاسب",
        },
        "en": {
          "haykal":
              "The general structure of the study plan for the Department of Computer Science",
          "erroroccured": "an error occurred!",
          "erroroccured2": "An error occurred while sending a message to",
          "TA": "please try again",
          "lets": "let's talk!",
          "hereforU":
              "Here to help you find answers to your questions about academic services and what is related to the university",
          "mess":
              "A confirmation message has been sent to your email. Please check your email to proceed",
          "Arabic": "Arabic",
          "English": "English",
          "WN": "Hello, Namik is at your service",
          "Enter The Previous GPA": "Enter The Previous GPA",
          "Email:": "Email:",
          "empty": "empty field! you have to fill in all the fields",
          "wroname": "name must be in Arabic",
          "home": "home",
          "Services": "services",
          "namik": "namik",
          "Map": "map",
          "account": "profile",
          "profiletitle": "Profile",
          "GPA": "GPA Calculator",
          "GPA_1": "Semester",
          "GPA_2": "cumulative",
          "GPA_11": "Semester GPA Calculator",
          "GPA_22": "Cumulative GPA Calculator",
          "ph": "pre hours",
          "vi": "Enter a valid number.",
          "pg": "pre GPA",
          "pa": "Please add Course.",
          "Course Name": "Course name",
          "LN": "Course name",
          "h": "Hours",
          "g": "Grade",
          "points": "Points",
          "rules": "Student's Guide",
          "rules_2": "University rules and services",
          "serv": "University services",
          "serv_2": "The offered services are mandated university services",
          "List": "List",
          "Calendar": "Calendar",
          "Acadmic": "Academic Calendar",
          "more": "see more",
          "Name": "Name",
          "name": "name",
          "UID": "university ID",
          "info": "My info",
          "back": "Go back",
          "pass": "Change password",
          "new pass": "New password",
          "curr pass": "Current password",
          "ch pass": "password changed successfully",
          "ent pass": "The entered password must be equal",
          "who": "About QU",
          "out": "Log out",
          "fill": "you should fill this field.",
          "change e": "Change email",
          "change n": "Change name",
          "most": "Email must be @qu.edu.sa",
          "Save": "Save",
          "Plan progress": "Plan progress\n(in Hours)",
          "collegehours": "college elective hours",
          "totalhours": "completed hours",
          "Taken and Completed": "Taken and Completed",
          "Level": "Level",
          "CShours": "CS elective hours",
          "free hours": "free hours",
          "qmap": "Qassim University Map",
          "forget": "forget password?",
          "forgpage": "Forget Password",
          "enter your email": "enter your email",
          "forgpage1":
              "Enter your email for the verification process, \nwe will send 4 digits code to your email.",
          "sign up": "sign up",
          "error": "error occurred",
          "too weak": "the password provided is too weak.",
          "no user": "no user found for that email.",
          "no pass": "wrong password provided for that user.",
          "Nice": "Nice to meet you!",
          "Login": "Login",
          "forge": "forget",
          "welcome": "Welcome Back!",
          "wrong": "wrong email!",
          "less": "passowrd must be at least 8 characters",
          "lessi": "ID must be at least 9 numbers",
          "conf": "Confirm Password",
          "account updated": "account updated successfully",
          "Dacc": "Don 't Have Account?",
          "Lang": "Language",
          "ab":
              "Qassim University stands out as a leading institution of higher education within Saudi Arabia, celebrated for its commitment to academic excellence, pioneering research, and active community involvement. Positioned among the nation's top universities, it offers an extensive array of undergraduate, graduate, and professional programs designed to equip students with the skills needed for prosperous careers.\n\nThe university cultivates a dynamic research environment, with both faculty and students involved in groundbreaking initiatives spanning various fields. By fostering partnerships and engaging in community outreach initiatives, Qassim University tackles pressing societal issues and contributes significantly to social progress.\n\nFurthermore, Qassim University's global impact is bolstered by its international collaborations, while its numerous accolades and honors underscore its unwavering dedication to excellence and its positive influence on society. In essence, Qassim University remains steadfast in its pursuit of academic distinction, innovation, and service to society, reflecting its enduring commitment to higher education and societal advancement.",
          "search": "Search",
          "hou": "hours",
          "send": "send",
          "University ID": "University ID",
          "Email": "Email",
          "email": "email",
          "Password": "Password",
          "password": "password",
          "notNum": "ID should be decimal numbers.",
          "Confpassword": "confirm password",
          "equals": "The entered passwords aren't the same",
          "Name:": "Name:",
          "servpage": "Academic Services",
          "CL": "your location",
          "MO": "Marker Options",
          "FR": "Find Route",
          "DM": "Delete Marker!",
          "MS": "Marker saved!",
          "MD": "Marker deleted!",
          "SP": "Save Place",
          "HN": "place Name",
          "SA": "Place saved as",
          "plsN": "Please enter a name for the place",
          "Cancel": "Cancel",
          "student plan": "Student plan",
          "About program": "About the program",
          "Academic advisor": "Academic Advisor",
          "plan completion": "plan completion",
          "plan details": "plan details",
          "serv_steps": "steps to implement this service",
          "sai": "College of Pharmacy",
          "mang": "College of Bussiness",
          "sci": "College of Science",
          "eng": "Collerge of Engineering",
          "reg": "College of Sharia & Islamic Studies",
          "par": "College of Education",
          "midic": "College of Medicine",
          "lang": "College of Language & Humainities",
          "app": "College of Applied Medical Science",
          "eco": "College of Business & Economics",
          "phy": "كلية العلاج الطبيعي",
          "mid2": "College of Medical Rehabilition",
          "comp": "College of Computer",
          "bild": "College of Architecture and Planing",
          "pyp": "PYP building",
          "ap": "Applied College",
          "plnf": "College of Nutrition | Female Students",
          "midicf": "College of Medicine | Female Students",
          "compf": "College of Computing | Female Students",
          "desf": "College of Design | Female Students",
          "regf": "College of Sharia | Female Students",
          "bildf": "College of Architecture and Planning | Female Students",
          "appf": "Applied College | Female Students",
          "scif": "College of Science | Female Students",
          "ecof": "College of Economics and Management | Female Students",
          "parf": "College of Education | Female",
          "princ1": "Dean's Office, College of Engineering",
          "princ2": "Dean's Office, Human Resources",
          "princ3": "Dean's Office, Admission and Registration",
          "princ4": "Dean's Office, Scientific Research",
          "princ5": "Dean's Office, Development and Quality",
          "princ6": "Dean's Office, E-Learning and Distance Education",
          "princ7": "Dean's Office, Student Affairs",
          "princ8": "Dean's Office, Graduate Studies",
          "princ9": "Dean's Office, Information Technology",
          "princ10": "Dean's Office, Preparatory Year",
          "mainout": "University Main Gateway",
          "outr": "Aramco Gateway",
          "out1": "Gate 8",
          "out2": "Gate 4",
          "out3": "Gate 5",
          "out4": "Gate 6",
          "out5": "Gate 7",
          "outf1": "College of Computer | Gate",
          "outf2": "College of Design | Gate",
          "outf3": "College of Sharia | Gate",
          "outf4": "College of Science | Gate",
          "outf5": "College of Bussiness | Gate",
          "cafe1": "Ghazlan | College of Sharia",
          "cafe2": "Fans | College of Sharia",
          "cafe3": "Lion | College of Science and Engineering",
          "cafe4": "Moroccan Tea Leaves | Main",
          "cafe5": "Cool Donuts | Main",
          "cafe6": "Turino | Main",
          "cafe7": "Ghazlan | Dental Clinic",
          "cafe8": "Barn's",
          "cafe9": "Lion | College of Computing",
          "rast1": "Antar Shawarma | College of Science and Engineering",
          "rest2": "Loaf",
          "restf1": "Loaf | Female Branch",
          "cafef1": "Cool Donuts | Female Branch",
          "cafef2": "Lion | Female Branch",
          "b1": "Leadership and Capacity Development Center",
          "b2": "Housing Management",
          "b3": "Graduate Studies Unit | Business and Economics",
          "b4": "QU CODE LAB",
          "b5": "Conference Center",
          "b6": "University of Qassim Faculty Housing",
          "b7": "General Directorate of Projects, Maintenance, and Safety",
          "b8": "University Studies Center | Female Students",
          "lai1": "Photography Center",
          "lai2": "Documentation and Archives Center",
          "lai3": "Prince Dr. Faisal bin Mishal Al Saud Library",
          "lai4": "University House Library",
          "lai5": "Yousef Library",
          "h1": "University Hospital",
          "h2": "University Hospital Emergency",
          "h3": "University Clinics",
          "h4": "Dental Hospital",
          "spe1": "The Mosque",
          "spe2": "Al Rajhi Bank",
          "spe3": "Roman Theater",
          "spe4": "University of Qassim Stadium",
          "spe5": "University of Qassim Club",
          "spe6": "University of Qassim Park",
          "spe7": "International Stadium",
          "spe8": "University of Qassim Driving School",
          "spe9": "Makarem Al-Tifl Nursery for Childcare"
        }
      };
  static String getFontFamily(String languageCode) {
    return languageCode == 'ar' ? 'Tajawal' : 'Poppins';
  }
}
