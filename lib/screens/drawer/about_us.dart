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
          const Divider(endIndent: 10, indent: 10),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "لم تعد المكتبة المدرسية مجرد مكان يحتوي على مجموعة من المقتنيات ومساحة لتدريس منهج التربية المكتبية، فمع ظهور الجيل الثاني للويب )Web 2.0( بدأت المكتبات المدرسية حول العالم تتخذ من تطبيقات هذا الجيل وسيلة لتفعيل دورها وتقديم خدمات المكتبة بطرق وأشكال مختلفة، فبعد أن كانت المكتبة تتاح للطلاب وقت الدوام المدرسي وفي برامج الأنشطة الصيفية فقط أصبحت تتيح العديد من خدما-ا للطالب على مدار الساعة. ولم تتوقف التطبيقات الإلكترونية عند تقديم الخدمات المكتبية وإتاحة مصادر المعلومات فقط، بل أصبحت تطبيقات تتيح للطلاب التواصل مع بعضهم البعض أو مع أخصائي المكتبة من خلال وسائل التواصل الاجتماعي مثل Facebook، Instagram أو من خلال الشبكات الاجتماعية الداخلية التي تجمع بين التواصل الاجتماعي والتعليم الافتراضي مثل: Schoology، ClassDojo ، Google Classroom أو من خلال تطبيقات خاصة بالمكتبة مثل Destiny Quest . ومع التطور التكنولوجي وانتشار الهواتف الذكية والأجهزة اللوحية والتي تحظى 0وس الطلاب والناشئة كان على المكتبات المدرسية توظيف خدما@ا من خلال تطبيقات الويب حتى تناسب العصر الحالي وتلبي احتياجات الطالب بالطريقة التي يميل إليها. ونظرا لمميزات الويب 2.0 الذي تتيح للمستخدم التفاعل معها، وفتح قنوات تواصل بينه وبين زملائه من ناحية، وبينه وبين مسؤولي المكتبة من جهة أخرى فإن تطبيقات الويب 2.0 لا غنى عنها في المكتبة وخاصة إذا ما أرادت المكتبة أن يكون لها دور فاعل في العملية التربوية أو المؤسسة التي تنتمي إليها. وIدف هذه الدراسة إلى التعرف على مدى استعداد المكتبات المدرسية لاستخدام تطبيقات الجيل الثاني للويب وما إن كانت هناك مكتبات تستخدمها بالفعل، وأيضا مدى احتياج المكتبات المدرسية إلى التغيير والتحول إلى المكتبات المدرسية 2.0. Abstract: Impediments to use Applications of Web 2.0 in School Libraries ---------- School libraries are no longer just a place to collect books, access information and teach library lessons. Since the emergence Apps of Web 2.0 school libraries around the world have started to use the apps to activate their role and provide library services in different ways. It is available to students during school hours and in summer programs only. Many of its services are available to the students 24 hours a day. The Web applications not only for provide the library services and information resources, but also to enable students to communicate with each other or with the librarian through social media such as Facebook, Instagram or social networks that combine social media and educational networks such as Schoology, ClassDojo, Google Classroom, or library applications as Destiny Quest. Web 2.0 allows users to interact with them and open the communication between them and their colleagues. Students can also contact the library administrators. As Web 2.0 applications are indispensable in the library, especially if it wants to have an active role in the educational process or institution. This study aims to identify the readiness of school libraries to use the Web 2.0 applications and whether there are libraries that are already using it as well as the extent to which school libraries need to change to school library 2.0",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
