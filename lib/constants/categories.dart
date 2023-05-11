import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/models/categories.dart';
import 'package:carteira_inteligente/widgets/Containers/category_icon_container.dart';

List<Categories> categoryList = [
  Categories(
    id: 1,
    description: "Cartão de crédito",
    icon: CategoryIconContainer(
      sCards,
      cBlueGrey.shade700,
      24,
    ),
  ),
  Categories(
    id: 2,
    description: "Cultura",
    icon: CategoryIconContainer(
      sCulture,
      cGreen.shade700,
      24,
    ),
  ),
  Categories(
    id: 3,
    description: "Alimentação",
    icon: CategoryIconContainer(
      sDinner,
      cRed.shade700,
      24,
    ),
  ),
  Categories(
    id: 4,
    description: "Família e filhos",
    icon: CategoryIconContainer(
      sFamily,
      cBlue.shade700,
      24,
    ),
  ),
  Categories(
    id: 5,
    description: "Educação",
    icon: CategoryIconContainer(
      sEducation,
      cPurple.shade700,
      24,
    ),
  ),
  Categories(
    id: 6,
    description: "Energia elétrica",
    icon: CategoryIconContainer(
      sElectricity,
      cAmber.shade700,
      24,
    ),
  ),
  Categories(
    id: 7,
    description: "Atividades físicas",
    icon: CategoryIconContainer(
      sExercise,
      cOrange.shade700,
      24,
    ),
  ),
  Categories(
    id: 8,
    description: "Presentes e doações",
    icon: CategoryIconContainer(
      sGift,
      cPink.shade700,
      24,
    ),
  ),
  Categories(
    id: 9,
    description: "Saúde",
    icon: CategoryIconContainer(
      sHealth,
      cBrown.shade700,
      24,
    ),
  ),
  Categories(
    id: 10,
    description: "Casa",
    icon: CategoryIconContainer(
      sHouse,
      cCyan.shade700,
      24,
    ),
  ),
  Categories(
    id: 11,
    description: "Lazer e hobbies",
    icon: CategoryIconContainer(
      sLeisure,
      cIndigo.shade700,
      24,
    ),
  ),
  Categories(
    id: 12,
    description: "Dívidas e empréstimos",
    icon: CategoryIconContainer(
      sLoans,
      cLime.shade700,
      24,
    ),
  ),
  Categories(
    id: 13,
    description: "Telefonia",
    icon: CategoryIconContainer(
      sMobile,
      cTeal.shade700,
      24,
    ),
  ),
  Categories(
    id: 14,
    description: "Outros",
    icon: CategoryIconContainer(
      sOther,
      cGrey.shade700,
      24,
    ),
  ),
  Categories(
    id: 15,
    description: "Animais de estimação",
    icon: CategoryIconContainer(
      sPet,
      cDeepPurple.shade700,
      24,
    ),
  ),
  Categories(
    id: 16,
    description: "Mercado",
    icon: CategoryIconContainer(
      sShoppingCart,
      cDeepOrange.shade700,
      24,
    ),
  ),
  Categories(
    id: 17,
    description: "Serviços de streaming",
    icon: CategoryIconContainer(
      sStreaming,
      cRedAccent.shade700,
      24,
    ),
  ),
  Categories(
    id: 18,
    description: "Transporte",
    icon: CategoryIconContainer(
      sTransport,
      cIndigoAccent.shade700,
      24,
    ),
  ),
  Categories(
    id: 19,
    description: "Viagens",
    icon: CategoryIconContainer(
      sTravel,
      cLightBlue.shade700,
      24,
    ),
  ),
  Categories(
    id: 20,
    description: "Internet",
    icon: CategoryIconContainer(
      sWifi,
      cLightGreen.shade700,
      24,
    ),
  ),
  Categories(
    id: 21,
    description: "Bares e restaurantes",
    icon: CategoryIconContainer(
      sCoffee,
      cGreenAccent.shade700,
      24,
    ),
  ),
  Categories(
    id: 22,
    description: "Cuidados pessoais",
    icon: CategoryIconContainer(
      sSelfCare,
      cYellow.shade700,
      24,
    ),
  ),
  Categories(
    id: 23,
    description: "Compras",
    icon: CategoryIconContainer(
      sShopping,
      cAmberAccent.shade700,
      24,
    ),
  ),
  Categories(
    id: 24,
    description: "Impostos e taxas",
    icon: CategoryIconContainer(
      sBank,
      cBlueAccent.shade700,
      24,
    ),
  ),
  Categories(
    id: 25,
    description: "Trabalho",
    icon: CategoryIconContainer(
      sWork,
      cPinkAccent.shade700,
      24,
    ),
  ),
];
