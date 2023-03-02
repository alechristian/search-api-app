import 'package:app_busca/app/pages/home/home_controller.dart';
import 'package:app_busca/const/colors.dart';
import 'package:app_busca/utils/enums/model_state.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var heightTela = MediaQuery.of(context).size.height;
    // var widthTela = MediaQuery.of(context).size.width;
    String? url;

    final controller = HomeController();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(heightTela * 0.15),
          child: AppBar(backgroundColor: AppColors.primaryBlue),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: heightTela * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Column(
                children: const [
                  Text(
                    "Faça aqui",
                    style: TextStyle(
                        color: AppColors.secondaryBlack,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w600,
                        fontSize: 31),
                  ),
                  Text("  sua busca!",
                      style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w600,
                          fontSize: 31)),
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 65,
                    width: 330,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) => TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Escreva aqui.',
                          ),
                          controller: controller.buscar,
                          onChanged: (value) {
                            controller.setValidaCampo(value);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 55,
                      width: 330,
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) => TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.tertiaryWhite,
                            backgroundColor: controller.validadeButton ==
                                    stateButton.enabladed
                                ? AppColors.primaryBlue
                                : AppColors.grey,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            controller.validadeButton == stateButton.enabladed
                                ? await controller.busca()
                                : null;
                          },
                          child: const Text('Buscar'),
                        ),
                      )),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Center(
                  child: controller.state == modelState.loading
                      ? const CircularProgressIndicator()
                      : Container(
                          constraints: BoxConstraints(
                              maxHeight: heightTela * 0.4,
                              minHeight: heightTela * 0.2),
                          child: Column(
                            children: [
                              controller.searchReturn?.data == null
                                  ? const Text(" ")
                                  : Expanded(
                                      child: ListView.builder(
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: controller
                                            .searchReturn?.data!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            title: Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.grey,
                                                border: Border.all(
                                                  width: 1,
                                                  color:
                                                      AppColors.secondaryBlack,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "titulo: ${controller.searchReturn!.data!.elementAt(index).title.toString()} "),
                                                    TextButton(
                                                      onPressed: () async {
                                                        String? url = controller
                                                            .searchReturn!.data!
                                                            .elementAt(index)
                                                            .link
                                                            .toString();
                                                        launchUrl(
                                                            Uri.parse(url),
                                                            mode: LaunchMode
                                                                .inAppWebView);
                                                      },
                                                      child: const Text(
                                                        "link",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .primaryBlue),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        )),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ));
  }
}
