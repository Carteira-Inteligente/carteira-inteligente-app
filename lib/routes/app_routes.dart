const port = "8090";
const uri = "http://localhost:$port/api";

class AppRoutes {
  static const userRoute = "$uri/user";
  static const entryRoute = "$uri/entry";
  static const budgetRoute = "$uri/budget";
  static const categoryRoute = "$uri/category";
  static const paymentTypeRoute = "$uri/payment-type";
}
