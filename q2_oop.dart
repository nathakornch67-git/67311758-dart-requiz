abstract class MenuItem {
  final String name;
  final double basePrice;

  static int itemCount = 0;

  MenuItem(this.name, this.basePrice) {
    itemCount++;
  }

  double price();

  void show() {
    print("$name - ${price()} บาท");
  }
}

class Drink extends MenuItem {
  int toppings;

  Drink(String name, double basePrice, this.toppings)
      : super(name, basePrice);

  @override
  double price() {
    return basePrice + (10 * toppings);
  }
}

class Food extends MenuItem {
  String size;

  Food(String name, double basePrice, this.size)
      : super(name, basePrice);

  @override
  double price() {

    double multi;

    switch (size) {
      case "S":
        multi = 1.0;
        break;

      case "M":
        multi = 1.2;
        break;

      case "L":
        multi = 1.5;
        break;

      default:
        multi = 1.0;
    }

    return basePrice * multi;
  }
}

class Wallet {

  double _balance;

  Wallet(this._balance);

  double get balance {
    return _balance;
  }

  set balance(double money) {

    if (money < 0) {
      print("ผิดพลาด: ยอดเงินติดลบไม่ได้");
    } else {
      _balance = money;
    }
  }

  bool pay(double money) {

    if (_balance >= money) {
      _balance = _balance - money;
      return true;
    } else {
      print("ยอดเงินไม่พอ");
      return false;
    }
  }
}

enum OrderStatus {
  pending,
  paid,
  cancelled
}

void showStatus(OrderStatus status) {

  switch (status) {

    case OrderStatus.pending:
      print("สถานะ: รอชำระเงิน");
      break;

    case OrderStatus.paid:
      print("สถานะ: ชำระเงินแล้ว");
      break;

    case OrderStatus.cancelled:
      print("สถานะ: ยกเลิกคำสั่งซื้อ");
      break;
  }
}

void main() {

  List<MenuItem> order = [

    Drink("ลาเต้",55,1),

    Food("ข้าวผัด",60,"L"),

    Drink("อเมริกาโน่",45,0)

  ];

  double total = 0;

  for (MenuItem item in order) {

    item.show();

    total = total + item.price();

  }

  print("ยอดรวมทั้งสิ้น : $total บาท");

  print("---");

  Wallet wallet = Wallet(300);

  wallet.balance = -50;

  bool result1 = wallet.pay(200);

  if (result1) {
    print("ชำระเงินสำเร็จ");
    showStatus(OrderStatus.paid);
  }

  print("ยอดคงเหลือ : ${wallet.balance} บาท");

  bool result2 = wallet.pay(500);

  if (!result2) {
    showStatus(OrderStatus.pending);
  }

  print("ยอดคงเหลือ : ${wallet.balance} บาท");

  print("---");

  print("จำนวนรายการเมนูที่ถูกสร้าง: ${MenuItem.itemCount}");

}