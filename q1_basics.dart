const double vatRate = 0.07;

double calcTotal({
  required int price,
  required int qty,
  double discount = 0,
}) {
  return (price * qty - discount) * (1 + vatRate);
}

void main() {

  final String shopName = "Dart Cafe";

  print("ร้าน: $shopName");
  print("อัตราภาษี (vatRate): $vatRate");
  print("---");

  List<String> categories = [
    "เครื่องดื่ม",
    "ของคาว",
    "ของหวาน"
  ];
  Map<String, int> menu = {
    "ลาเต้": 55,
    "อเมริกาโน่": 45,
    "ข้าวผัด": 60,
    "เค้ก": 40
  };

  print("หมวดเมนู: $categories");
  print("จำนวนเมนูทั้งหมด: ${menu.length} รายการ");
  print("ราคาลาเต้: ${menu["ลาเต้"]} บาท");
  print("---");

  print("เมนูราคาตั้งแต่ 50 บาทขึ้นไป");

  for (var item in menu.entries) {
    if (item.value >= 50) {
      print("${item.key} : ${item.value} บาท");
    }
  }

  print("---");

  double total1 = calcTotal(
    price: 55,
    qty: 2,
  );

  double total2 = calcTotal(
    price: 55,
    qty: 2,
    discount: 10,
  );

  print("ยอดสุทธิ (ไม่มีส่วนลด): $total1 บาท");
  print("ยอดสุทธิ (ส่วนลด 10 บาท): $total2 บาท");

  print("---");
  String? coupon;

  print("ความยาวคูปอง: ${coupon?.length ?? 0}");

  coupon ??= "NO-COUPON";

  print("คูปองหลังกำหนดค่า: $coupon");
}