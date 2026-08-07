/// Summary of a receipt as displayed in the history list and details screen.
class ReceiptRecord {
  final String voucherNo;
  final String buyer;
  final String mineralType;
  final String valueTzs;
  final String date;
  final String quantity;
  final String vehicleNumber;
  final String transportPhone;
  final String destination;
  final String productionCenter;
  final String sellerName;
  final String licenseNumber;

  const ReceiptRecord({
    required this.voucherNo,
    required this.buyer,
    required this.mineralType,
    required this.valueTzs,
    required this.date,
    required this.quantity,
    required this.vehicleNumber,
    required this.transportPhone,
    required this.destination,
    required this.productionCenter,
    required this.sellerName,
    required this.licenseNumber,
  });
}
