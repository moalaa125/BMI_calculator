import 'package:flutter/material.dart';
import 'constant.dart';
Color fristCard = kButtonCard ;
Color secoundCard = kButtonCard ;
Color thirdCard = kButtonCard ;
Color fourthCard = kButtonCard ;
Color fifthCard = kButtonCard ;
enum CardTyepe {male , female}

class UpdateColor {
  updateColor(CardTyepe type) {
    if (type == CardTyepe.male) {
      fristCard = kButtonCardPressed;
      secoundCard = kButtonCard;
    } else if (type == CardTyepe.female) {
      secoundCard = kButtonCardPressed;
      fristCard = kButtonCard;
    }
  }
}