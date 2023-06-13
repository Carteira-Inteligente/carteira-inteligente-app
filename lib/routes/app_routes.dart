const port = "8090";
const uri = "http://localhost:$port/api";

class AppRoutes {
  static const categoryRoute = "$uri/category";
  static const paymentTypeRoute = "$uri/payment-type";
  static const budgetRoute = "$uri/budget";
}
