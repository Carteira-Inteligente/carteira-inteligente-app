import '../models/period.dart';

List<Period> periodOptions = [
  Period(
    id: "NOT_REPEAT",
    description: "Não repete",
  ),
  Period(
    id: "DAILY",
    description: "Diária",
  ),
  Period(
    id: "WEEKLY",
    description: "Semanal",
  ),
  Period(
    id: "BIWEEKLY",
    description: "Quinzenal",
  ),
  Period(
    id: "MONTHLY",
    description: "Mensal",
  ),
  Period(
    id: "BIMONTHLY",
    description: "Bimestral",
  ),
  Period(
    id: "QUARTERLY",
    description: "Trimestral",
  ),
  Period(
    id: "SEMESTERLY",
    description: "Semestral",
  ),
  Period(
    id: "ANNUAL",
    description: "Anual",
  ),
];

String buildPeriodDescription(String description) {
  if (description == "NOT_REPEAT") {
    return "Não repete";
  } else if (description == "DAILY") {
    return "Diária";
  } else if (description == "WEEKLY") {
    return "Semanal";
  } else if (description == "BIWEEKLY") {
    return "Quinzenal";
  } else if (description == "MONTHLY") {
    return "Mensal";
  } else if (description == "BIMONTHLY") {
    return "Bimestral";
  } else if (description == "QUARTERLY") {
    return "Trimestral";
  } else if (description == "SEMESTERLY") {
    return "Semestral";
  } else if (description == "ANNUAL") {
    return "Anual";
  } else {
    return "";
  }
}

String buildPeriodId(String description) {
  if (description == "NOT_REPEAT") {
    return "NOT_REPEAT";
  } else if (description == "DAILY") {
    return "DAILY";
  } else if (description == "WEEKLY") {
    return "WEEKLY";
  } else if (description == "BIWEEKLY") {
    return "BIWEEKLY";
  } else if (description == "MONTHLY") {
    return "MONTHLY";
  } else if (description == "BIMONTHLY") {
    return "BIMONTHLY";
  } else if (description == "QUARTERLY") {
    return "QUARTERLY";
  } else if (description == "SEMESTERLY") {
    return "SEMESTERLY";
  } else if (description == "ANNUAL") {
    return "ANNUAL";
  } else {
    return "";
  }
}
