class Onboarding {
  final String title;
  final String? text;
  final String? image;

  Onboarding({
    required this.title,
    this.text,
    this.image,
  });
}

class OnboardingModel extends Onboarding {
  OnboardingModel({
    required super.title,
    super.text,
    super.image,
  });

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      title: json['title'],
      text: json['text'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'text': text,
      'image': image,
    };
  }
}
