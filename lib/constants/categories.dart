import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/models/categories.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Categories> categoryList = [
  Categories(
    id: 1,
    description: "Cartão de crédito",
    icon: SvgPicture.asset(
      sCards,
      color: cBlueGrey,
    ),
  ),
  Categories(
    id: 2,
    description: "Cultura",
    icon: SvgPicture.asset(
      sCulture,
      color: cGreen,
    ),
  ),
  Categories(
    id: 3,
    description: "Alimentação",
    icon: SvgPicture.asset(
      sDinner,
      color: cRed,
    ),
  ),
  Categories(
    id: 4,
    description: "Família e filhos",
    icon: SvgPicture.asset(
      sFamily,
      color: cBlue,
    ),
  ),
  Categories(
    id: 5,
    description: "Educação",
    icon: SvgPicture.asset(
      sEducation,
      color: cPurple,
    ),
  ),
  Categories(
    id: 6,
    description: "Energia clétrica",
    icon: SvgPicture.asset(
      sElectricity,
      color: cAmber,
    ),
  ),
  Categories(
    id: 7,
    description: "Atividades físicas",
    icon: SvgPicture.asset(
      sExercise,
      color: cOrange,
    ),
  ),
  Categories(
    id: 8,
    description: "Presentes e doações",
    icon: SvgPicture.asset(
      sGift,
      color: cPink,
    ),
  ),
  Categories(
    id: 9,
    description: "Saúde",
    icon: SvgPicture.asset(
      sHealth,
      color: cBrown,
    ),
  ),
  Categories(
    id: 10,
    description: "Casa",
    icon: SvgPicture.asset(
      sHouse,
      color: cCyan,
    ),
  ),
  Categories(
    id: 11,
    description: "Lazer e hobbies",
    icon: SvgPicture.asset(
      sLeisure,
      color: cIndigo,
    ),
  ),
  Categories(
    id: 12,
    description: "Dívidas e empréstimos",
    icon: SvgPicture.asset(
      sLoans,
      color: cLime,
    ),
  ),
  Categories(
    id: 13,
    description: "Telefonia",
    icon: SvgPicture.asset(
      sMobile,
      color: cTeal,
    ),
  ),
  Categories(
    id: 14,
    description: "Outros",
    icon: SvgPicture.asset(
      sOther,
      color: cGrey,
    ),
  ),
  Categories(
    id: 15,
    description: "Animais de estimação",
    icon: SvgPicture.asset(
      sPet,
      color: cDeepPurple,
    ),
  ),
  Categories(
    id: 16,
    description: "Mercado",
    icon: SvgPicture.asset(
      sShoppingCart,
      color: cDeepOrange,
    ),
  ),
  Categories(
    id: 17,
    description: "Serviços de streaming",
    icon: SvgPicture.asset(
      sStreaming,
      color: cRedAccent,
    ),
  ),
  Categories(
    id: 18,
    description: "Transporte",
    icon: SvgPicture.asset(
      sTransport,
      color: cIndigoAccent,
    ),
  ),
  Categories(
    id: 19,
    description: "Viagens",
    icon: SvgPicture.asset(
      sTravel,
      color: cLightBlue,
    ),
  ),
  Categories(
    id: 20,
    description: "Internet",
    icon: SvgPicture.asset(
      sWifi,
      color: cLightGreen,
    ),
  ),
  Categories(
    id: 21,
    description: "Bares e restaurantes",
    icon: SvgPicture.asset(
      sCoffee,
      color: cGreenAccent,
    ),
  ),
  Categories(
    id: 22,
    description: "Cuidados pessoais",
    icon: SvgPicture.asset(
      sSelfCare,
      color: cYellow,
    ),
  ),
  Categories(
    id: 23,
    description: "Compras",
    icon: SvgPicture.asset(
      sShopping,
      color: cAmberAccent,
    ),
  ),
  Categories(
    id: 24,
    description: "Impostos e taxas",
    icon: SvgPicture.asset(
      sBank,
      color: cBlueAccent,
    ),
  ),
  Categories(
    id: 25,
    description: "Trabalho",
    icon: SvgPicture.asset(
      sWork,
      color: cPinkAccent,
    ),
  ),
];
