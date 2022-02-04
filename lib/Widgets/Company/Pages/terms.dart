import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pujapurohit/Pages/PanditSection/Widgets/responsive.dart';
import 'package:pujapurohit/Widgets/Company/foryou.dart';
import 'package:pujapurohit/Widgets/Company/widget.dart';
import 'package:pujapurohit/Widgets/drawer.dart';



class TextWidget extends StatelessWidget {
  late String text;
  final page;
  TextWidget(this.text, this.page);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) =>
          InkWell(
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return (page);
              }))
            },
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54),
            ),
          ),
    );
  }
}

// Widget buildPolicies() => Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const SizedBox(
//         height: 10,
//       ),
//       TextWidget("Guidelines and Policies", const GuidelinesPolicies()),
//       const SizedBox(
//         height: 10,
//       ),
//       TextWidget("PrivacyPolicy", const PrivacyPage()),
//       const SizedBox(
//         height: 10,
//       ),
//       TextWidget("Terms of Service", const TermsPage()),
//       const SizedBox(
//         height: 10,
//       ),
//       TextWidget("API Policy",const ApiPage()),
//       const SizedBox(
//         height: 10,
//       ),
//       TextWidget("CSR", const CsrPage()),
//       const SizedBox(
//         height: 10,
//       ),
//       TextWidget(
//           "License and Registration", const LicenseRegistrationPage()),
//       const SizedBox(
//         height: 10,
//       ),
//       TextWidget("Security", const SecurityPage()),
//     ]);



// Widget headerText(String text) => Text(
//   text,
//   style: const TextStyle(
//       height: 1,
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//       color: Colors.black54),
// );



Widget headerDrawer() =>Container(
  child: Drawer(child:
  Column(crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      headerText("General"),
      headerText("Online Ordering"),
      headerText("Zomato Pay"),
    ],),),
);


class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body:ResponsiveWidget.isSmallScreen(context)?MobileViewTermsPage():WideScreenTermsPage()
  );
}


class MobileViewTermsPage extends StatelessWidget {
  const MobileViewTermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:IconButton(onPressed: (){
         Get.to(NavDrawer());
        }, icon:  Icon(
              Icons.dehaze,
              size: 30,
              color: Colors.black,
            ),)
      ),
        body:        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: sections.length,
                itemBuilder: (BuildContext context, int index) {
                  final section = sections[index];

                  return SectionWidget(
                    key: section.key,
                    section: section,
                  );
                },
              ),
            ),
          ],
        ),





        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            child: const Icon(
              Icons.dehaze,
              size: 20,
              color: Colors.black,
            ),
            backgroundColor: Colors.grey,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Drawer(
                    child: Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: buildPolicies(),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}

class WideScreenTermsPage extends StatelessWidget {
  const WideScreenTermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              headerText("General"),
              const SizedBox(
                width: 30,
              ),
              headerText("Online Ordering"),
              const SizedBox(width: 30),
              headerText(
                "Zomato Pay",
              ),
              const SizedBox(
                width: 30,
              ),
              // SizedBox(width: 20 ,),
            ],
          )),
      body: Row(children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildPolicies(),
          ),
        ),
        const VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),
        Expanded(
          flex: 7,
          //  child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                itemCount: sections.length,
                itemBuilder: (BuildContext context, int index) {
                  final section = sections[index];

                  return SectionWidget(
                    key: section.key, section: section,

                    //section: section,
                  );
                },
                // ),),
              )),
              // const BuildButtons(),
            ],
          ),
        ),
        const VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),
        Expanded(
          flex: 2,
          child: TableOfContents(
            sections: sections,
            onItemTap: (section) {
              final targetContext = section.key.currentContext;
              if (targetContext != null) {
                Scrollable.ensureVisible(
                  targetContext,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
      ]),
    );
  }
}
