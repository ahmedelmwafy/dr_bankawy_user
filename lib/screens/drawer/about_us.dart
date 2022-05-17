import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'عن التطبيق',
              style: TextStyle(
                // color: kMainColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(
            endIndent: 10,
            indent: 10,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Dr bankawy.. ◦	يعمل dr bankawy عبر تطبيقه الذكي على تقديم خدمات للتمويل على مدار الساعه للافراد في جميع أنحاء مدن وقرىٰ جمهورية مصر العربية. ◦	يدعم دكتور بنكاوي المشروعات الصغيره والمتوسطه والكبيره بفائده بسيطه على مدار الشهور او السنين. ◦	فترة السداد للتمويلات الفوريه الصغيره التي تتراوح من 1000 الى 15000 تترواح من شهر الى 6 أشهر ◦	يوجد طرق سداد مريحة على المدىٰ الطويل من سنه الى 15 سنه . ✓	تطبيق dr bankawy هو تطبيق يعمل تحت اشراف البنك المركزي المصري بسجل تجاري رقم 7578587 . ◦	رقم خدمة العملاء 12575 . ◦	الموقع الالكتروني www.Dr bankawy.com ◦	حمل التطبيق الآن.",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
