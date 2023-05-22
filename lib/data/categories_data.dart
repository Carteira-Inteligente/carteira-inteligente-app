import 'dart:ui';

import '../constants/colors.dart';
import '../constants/svgs.dart';
import '../models/category.dart';
import '../widgets/Containers/rounded_icon_container.dart';

List<Category> categoryList = [
  Category(
    id: 1,
    description: "Cartão de crédito",
    icon: RoundedIconContainer(
      svgPicture: sCards,
      svgColor: cBlueGrey.shade700,
      backgroundColor: cBlueGrey.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 2,
    description: "Cultura",
    icon: RoundedIconContainer(
      svgPicture: sCulture,
      svgColor: cGreen.shade700,
      backgroundColor: cGreen.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 3,
    description: "Alimentação",
    icon: RoundedIconContainer(
      svgPicture: sDinner,
      svgColor: cRed.shade700,
      backgroundColor: cRed.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 4,
    description: "Família e filhos",
    icon: RoundedIconContainer(
      svgPicture: sFamily,
      svgColor: cBlue.shade700,
      backgroundColor: cBlue.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 5,
    description: "Educação",
    icon: RoundedIconContainer(
      svgPicture: sEducation,
      svgColor: cPurple.shade700,
      backgroundColor: cPurple.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 6,
    description: "Energia elétrica",
    icon: RoundedIconContainer(
      svgPicture: sElectricity,
      svgColor: cAmber.shade700,
      backgroundColor: cAmber.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 7,
    description: "Atividades físicas",
    icon: RoundedIconContainer(
      svgPicture: sExercise,
      svgColor: cOrange.shade700,
      backgroundColor: cOrange.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 8,
    description: "Presentes e doações",
    icon: RoundedIconContainer(
      svgPicture: sGift,
      svgColor: cPink.shade700,
      backgroundColor: cPink.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 9,
    description: "Saúde",
    icon: RoundedIconContainer(
      svgPicture: sHealth,
      svgColor: cBrown.shade700,
      backgroundColor: cBrown.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 10,
    description: "Casa",
    icon: RoundedIconContainer(
      svgPicture: sHouse,
      svgColor: cCyan.shade700,
      backgroundColor: cCyan.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 11,
    description: "Lazer e hobbies",
    icon: RoundedIconContainer(
      svgPicture: sLeisure,
      svgColor: cIndigo.shade700,
      backgroundColor: cIndigo.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 12,
    description: "Dívidas e empréstimos",
    icon: RoundedIconContainer(
      svgPicture: sLoans,
      svgColor: cLime.shade700,
      backgroundColor: cLime.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 13,
    description: "Telefonia",
    icon: RoundedIconContainer(
      svgPicture: sMobile,
      svgColor: cTeal.shade700,
      backgroundColor: cTeal.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 14,
    description: "Outros",
    icon: RoundedIconContainer(
      svgPicture: sOther,
      svgColor: cGrey.shade700,
      backgroundColor: cGrey.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 15,
    description: "Animais de estimação",
    icon: RoundedIconContainer(
      svgPicture: sPet,
      svgColor: cDeepPurple.shade700,
      backgroundColor: cDeepPurple.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 16,
    description: "Mercado",
    icon: RoundedIconContainer(
      svgPicture: sShoppingCart,
      svgColor: cDeepOrange.shade700,
      backgroundColor: cDeepOrange.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 17,
    description: "Serviços de streaming",
    icon: RoundedIconContainer(
      svgPicture: sStreaming,
      svgColor: cRedAccent.shade700,
      backgroundColor: cRedAccent.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 18,
    description: "Transporte",
    icon: RoundedIconContainer(
      svgPicture: sTransport,
      svgColor: cIndigoAccent.shade700,
      backgroundColor: cIndigoAccent.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 19,
    description: "Viagens",
    icon: RoundedIconContainer(
      svgPicture: sTravel,
      svgColor: cLightBlue.shade700,
      backgroundColor: cLightBlue.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 20,
    description: "Internet",
    icon: RoundedIconContainer(
      svgPicture: sWifi,
      svgColor: cLightGreen.shade700,
      backgroundColor: cLightGreen.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 21,
    description: "Bares e restaurantes",
    icon: RoundedIconContainer(
      svgPicture: sCoffee,
      svgColor: cGreenAccent.shade700,
      backgroundColor: cGreenAccent.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 22,
    description: "Cuidados pessoais",
    icon: RoundedIconContainer(
      svgPicture: sSelfCare,
      svgColor: cYellow.shade700,
      backgroundColor: cYellow.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 23,
    description: "Compras",
    icon: RoundedIconContainer(
      svgPicture: sShopping,
      svgColor: cAmberAccent.shade700,
      backgroundColor: cAmberAccent.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 24,
    description: "Impostos e taxas",
    icon: RoundedIconContainer(
      svgPicture: sBank,
      svgColor: cBlueAccent.shade700,
      backgroundColor: cBlueAccent.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 25,
    description: "Trabalho",
    icon: RoundedIconContainer(
      svgPicture: sWork,
      svgColor: cPinkAccent.shade700,
      backgroundColor: cPinkAccent.shade100,
      radius: 30,
    ),
  ),
  Category(
    id: 26,
    description: "Personalizada",
    icon: const RoundedIconContainer(
      svgPicture: sCategory,
      svgColor: Color(0xFF1F70A2),
      backgroundColor: Color(0xFFBED3E7),
      radius: 30,
    ),
  ),
];
