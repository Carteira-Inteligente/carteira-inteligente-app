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
      backgroundColor: cBlueGrey.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 2,
    description: "Cultura",
    icon: RoundedIconContainer(
      svgPicture: sCulture,
      backgroundColor: cGreen.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 3,
    description: "Alimentação",
    icon: RoundedIconContainer(
      svgPicture: sDinner,
      backgroundColor: cRed.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 4,
    description: "Família e filhos",
    icon: RoundedIconContainer(
      svgPicture: sFamily,
      backgroundColor: cBlue.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 5,
    description: "Educação",
    icon: RoundedIconContainer(
      svgPicture: sEducation,
      backgroundColor: cPurple.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 6,
    description: "Energia elétrica",
    icon: RoundedIconContainer(
      svgPicture: sElectricity,
      backgroundColor: cAmber.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 7,
    description: "Atividades físicas",
    icon: RoundedIconContainer(
      svgPicture: sExercise,
      backgroundColor: cOrange.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 8,
    description: "Presentes e doações",
    icon: RoundedIconContainer(
      svgPicture: sGift,
      backgroundColor: cPink.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 9,
    description: "Saúde",
    icon: RoundedIconContainer(
      svgPicture: sHealth,
      backgroundColor: cBrown.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 10,
    description: "Casa",
    icon: RoundedIconContainer(
      svgPicture: sHouse,
      backgroundColor: cCyan.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 11,
    description: "Lazer e hobbies",
    icon: RoundedIconContainer(
      svgPicture: sLeisure,
      backgroundColor: cIndigo.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 12,
    description: "Dívidas e empréstimos",
    icon: RoundedIconContainer(
      svgPicture: sLoans,
      backgroundColor: cLime.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 13,
    description: "Telefonia",
    icon: RoundedIconContainer(
      svgPicture: sMobile,
      backgroundColor: cTeal.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 14,
    description: "Outros",
    icon: RoundedIconContainer(
      svgPicture: sOther,
      backgroundColor: cGrey.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 15,
    description: "Animais de estimação",
    icon: RoundedIconContainer(
      svgPicture: sPet,
      backgroundColor: cDeepPurple.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 16,
    description: "Mercado",
    icon: RoundedIconContainer(
      svgPicture: sShoppingCart,
      backgroundColor: cDeepOrange.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 17,
    description: "Serviços de streaming",
    icon: RoundedIconContainer(
      svgPicture: sStreaming,
      backgroundColor: cRedAccent.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 18,
    description: "Transporte",
    icon: RoundedIconContainer(
      svgPicture: sTransport,
      backgroundColor: cIndigoAccent.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 19,
    description: "Viagens",
    icon: RoundedIconContainer(
      svgPicture: sTravel,
      backgroundColor: cLightBlue.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 20,
    description: "Internet",
    icon: RoundedIconContainer(
      svgPicture: sWifi,
      backgroundColor: cLightGreen.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 21,
    description: "Bares e restaurantes",
    icon: RoundedIconContainer(
      svgPicture: sCoffee,
      backgroundColor: cGreenAccent.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 22,
    description: "Cuidados pessoais",
    icon: RoundedIconContainer(
      svgPicture: sSelfCare,
      backgroundColor: cYellow.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 23,
    description: "Compras",
    icon: RoundedIconContainer(
      svgPicture: sShopping,
      backgroundColor: cAmberAccent.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 24,
    description: "Impostos e taxas",
    icon: RoundedIconContainer(
      svgPicture: sBank,
      backgroundColor: cBlueAccent.shade700,
      radius: 24,
    ),
  ),
  Category(
    id: 25,
    description: "Trabalho",
    icon: RoundedIconContainer(
      svgPicture: sWork,
      backgroundColor: cPinkAccent.shade700,
      radius: 24,
    ),
  ),
];
