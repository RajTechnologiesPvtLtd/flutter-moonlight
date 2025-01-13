import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding_controller.dart';
import 'widgets/dot_indicator.dart';
import 'widgets/onboard_content.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              const Spacer(flex: 2),
              Expanded(
                flex: 14,
                child: PageView.builder(
                  itemCount: controller.records.length,
                  onPageChanged: controller.changePage,
                  itemBuilder: (context, index) => OnboardContent(
                    title: controller.records[index].title,
                    text: controller.records[index].text,
                    image: controller.records[index].image,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.records.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child:
                        DotIndicator(isActive: index == controller.currentPage),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Obx(() => controller.currentPage == controller.records.length - 1
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () => controller.getStarted(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Get.theme.primaryColor,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text("get_started".tr.toUpperCase()),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink()),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
