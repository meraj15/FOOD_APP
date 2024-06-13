import 'package:food_app/model/cooking_step.dart';

class Restaurant {
  final int id;
  final String image;
  final String title;
  final int readyInMinutes;
  final List<CookingStep> steps;

  Restaurant({
    required this.id,
    required this.image,
    required this.title,
    required this.readyInMinutes,
    required this.steps,
  });

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    List<CookingStep> steps = [];
    if (map['analyzedInstructions'] != null && map['analyzedInstructions'].isNotEmpty) {
      steps = (map['analyzedInstructions'][0]['steps'] as List)
          .map((stepMap) => CookingStep.fromMap(stepMap as Map<String, dynamic>))
          .toList();
    }

    return Restaurant(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      readyInMinutes: map['readyInMinutes'] ?? 0,
      steps: steps,
    );
  }
}