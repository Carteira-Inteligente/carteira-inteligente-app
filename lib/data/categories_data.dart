import '../constants/colors.dart';
import '../constants/svgs.dart';
import '../models/category.dart';
import '../widgets/Containers/rounded_icon_container.dart';

List<Category> categoryList = [
  Category(
    id: 1,
    description: "Cartão de crédito",
    icon: RoundedIconContainer(
      sCards,
      cBlueGrey.shade700,
      24,
    ),
  ),
  Category(
    id: 2,
    description: "Cultura",
    icon: RoundedIconContainer(
      sCulture,
      cGreen.shade700,
      24,
    ),
  ),
  Category(
    id: 3,
    description: "Alimentação",
    icon: RoundedIconContainer(
      sDinner,
      cRed.shade700,
      24,
    ),
  ),
  Category(
    id: 4,
    description: "Família e filhos",
    icon: RoundedIconContainer(
      sFamily,
      cBlue.shade700,
      24,
    ),
  ),
  Category(
    id: 5,
    description: "Educação",
    icon: RoundedIconContainer(
      sEducation,
      cPurple.shade700,
      24,
    ),
  ),
  Category(
    id: 6,
    description: "Energia elétrica",
    icon: RoundedIconContainer(
      sElectricity,
      cAmber.shade700,
      24,
    ),
  ),
  Category(
    id: 7,
    description: "Atividades físicas",
    icon: RoundedIconContainer(
      sExercise,
      cOrange.shade700,
      24,
    ),
  ),
  Category(
    id: 8,
    description: "Presentes e doações",
    icon: RoundedIconContainer(
      sGift,
      cPink.shade700,
      24,
    ),
  ),
  Category(
    id: 9,
    description: "Saúde",
    icon: RoundedIconContainer(
      sHealth,
      cBrown.shade700,
      24,
    ),
  ),
  Category(
    id: 10,
    description: "Casa",
    icon: RoundedIconContainer(
      sHouse,
      cCyan.shade700,
      24,
    ),
  ),
  Category(
    id: 11,
    description: "Lazer e hobbies",
    icon: RoundedIconContainer(
      sLeisure,
      cIndigo.shade700,
      24,
    ),
  ),
  Category(
    id: 12,
    description: "Dívidas e empréstimos",
    icon: RoundedIconContainer(
      sLoans,
      cLime.shade700,
      24,
    ),
  ),
  Category(
    id: 13,
    description: "Telefonia",
    icon: RoundedIconContainer(
      sMobile,
      cTeal.shade700,
      24,
    ),
  ),
  Category(
    id: 14,
    description: "Outros",
    icon: RoundedIconContainer(
      sOther,
      cGrey.shade700,
      24,
    ),
  ),
  Category(
    id: 15,
    description: "Animais de estimação",
    icon: RoundedIconContainer(
      sPet,
      cDeepPurple.shade700,
      24,
    ),
  ),
  Category(
    id: 16,
    description: "Mercado",
    icon: RoundedIconContainer(
      sShoppingCart,
      cDeepOrange.shade700,
      24,
    ),
  ),
  Category(
    id: 17,
    description: "Serviços de streaming",
    icon: RoundedIconContainer(
      sStreaming,
      cRedAccent.shade700,
      24,
    ),
  ),
  Category(
    id: 18,
    description: "Transporte",
    icon: RoundedIconContainer(
      sTransport,
      cIndigoAccent.shade700,
      24,
    ),
  ),
  Category(
    id: 19,
    description: "Viagens",
    icon: RoundedIconContainer(
      sTravel,
      cLightBlue.shade700,
      24,
    ),
  ),
  Category(
    id: 20,
    description: "Internet",
    icon: RoundedIconContainer(
      sWifi,
      cLightGreen.shade700,
      24,
    ),
  ),
  Category(
    id: 21,
    description: "Bares e restaurantes",
    icon: RoundedIconContainer(
      sCoffee,
      cGreenAccent.shade700,
      24,
    ),
  ),
  Category(
    id: 22,
    description: "Cuidados pessoais",
    icon: RoundedIconContainer(
      sSelfCare,
      cYellow.shade700,
      24,
    ),
  ),
  Category(
    id: 23,
    description: "Compras",
    icon: RoundedIconContainer(
      sShopping,
      cAmberAccent.shade700,
      24,
    ),
  ),
  Category(
    id: 24,
    description: "Impostos e taxas",
    icon: RoundedIconContainer(
      sBank,
      cBlueAccent.shade700,
      24,
    ),
  ),
  Category(
    id: 25,
    description: "Trabalho",
    icon: RoundedIconContainer(
      sWork,
      cPinkAccent.shade700,
      24,
    ),
  ),
];
