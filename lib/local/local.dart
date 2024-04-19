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
          "serv_st": "خطوات تنفيذ الخدمة:",
          "List": "قائمة",
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
          "send": "إرسال",
          "h": "الساعات",
          "g": "الدرجة",
          "Name": "الاسم",
          "Email": "البريد الالكتروني",
          "back": "العودة للخلف",
          "Password": "رمز الدخول",
          "wroname": "يجب ان يكون الاسم باللغة العربية",
          "password": "رمز الدخول",
          "Name:": "الاسم:",
          "Email:": "البريد الالكتروني:",
          "servpage": "الخدمات الاكاديمية",
          "Course Name": "اسم المادة",
          "Enter The Previous GPA": "ادخل المعدل السابق",
          "Arabic": "العربية",
          "English": "الانجليزية",
          "serv_st": "كيفية الحصول على الخدمة:",
        },
        "en": {
          "Arabic": "Arabic",
          "English": "English",
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
          "qmap": "Qassim University Map",
          "forget": "forget password?",
          "forgpage": "Forget Password",
          "forgpage1":
              "Enter your email for the verification process, \\we will send 4 digits code to your email.",
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
          "servpage": "Academic Services",
          "University ID": "University ID",
          "Email": "Email",
          "Password": "Password",
          "password": "password",
          "Name:": "Name:"
        },
      };
  static String getFontFamily(String languageCode) {
    return languageCode == 'ar' ? 'Tajawal' : 'Poppins';
  }
}
