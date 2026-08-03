import 'package:flutter/material.dart';
import '../navigation/bottom_nav_bar.dart'; // Reusing your bottom navigation bar

class CreateReceiptScreen extends StatefulWidget {
  const CreateReceiptScreen({super.key});

  @override
  State<CreateReceiptScreen> createState() => _CreateReceiptScreenState();
}

class _CreateReceiptScreenState extends State<CreateReceiptScreen> {
  int _currentNavIndex = 0;

  // Form Controllers & State Variables
  String? _selectedMineral = 'Gold Concentrate';
  final List<String> _mineralOptions = [
    'Gold Concentrate',
    'Copper',
    'Tanzanite',
    'Iron Ore',
    'Diamond',
  ];

  final TextEditingController _voucherNumController = TextEditingController();
  final TextEditingController _mineralValueController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _vehicleNumController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _buyerNameController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  @override
  void dispose() {
    _voucherNumController.dispose();
    _mineralValueController.dispose();
    _quantityController.dispose();
    _vehicleNumController.dispose();
    _phoneController.dispose();
    _buyerNameController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0F57A6);
    const labelStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color(0xFF333333),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAFC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: primaryColor),
          onPressed: () {},
        ),
        title: const Text(
          'Create Receipt',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: primaryColor,
              child: const Text(
                'MS',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Header
            const Text(
              'Voucher Generation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Fill in the mineral transaction details below.',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),

            // Main White Card Container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mineral Type Dropdown
                  const Text('Mineral Type', style: labelStyle),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    value: _selectedMineral,
                    decoration: _inputDecoration(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    items: _mineralOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedMineral = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),

                  // Voucher Number Input (with Prefixed Tag)
                  const Text('Voucher Number', style: labelStyle),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAEFF5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: const Text(
                          'A437',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _voucherNumController,
                          keyboardType: TextInputType.number,
                          decoration: _inputDecoration(
                            hintText: 'Enter digits',
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Mineral Value Input (with Currency Prefix)
                  const Text('Mineral Value', style: labelStyle),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAEFF5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: const Text(
                          'TZS',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _mineralValueController,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: _inputDecoration(
                            hintText: '0.00',
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Quantity
                  const Text('Quantity (kg/ct)', style: labelStyle),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: _inputDecoration(hintText: 'Enter amount'),
                  ),
                  const SizedBox(height: 20),

                  Divider(color: Colors.grey.shade200, thickness: 1),
                  const SizedBox(height: 16),

                  // Vehicle Number
                  const Text('Vehicle Number', style: labelStyle),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _vehicleNumController,
                    decoration: _inputDecoration(hintText: 'e.g., T 123 ABC'),
                  ),
                  const SizedBox(height: 16),

                  // Transport Phone
                  const Text('Transport Phone', style: labelStyle),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: _inputDecoration(hintText: '+255...'),
                  ),
                  const SizedBox(height: 16),

                  // Buyer Name
                  const Text('Buyer Name', style: labelStyle),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _buyerNameController,
                    decoration: _inputDecoration(hintText: 'Full legal name'),
                  ),
                  const SizedBox(height: 16),

                  // Destination
                  const Text('Destination', style: labelStyle),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _destinationController,
                    decoration: _inputDecoration(
                      hintText: 'City or Delivery Point',
                    ),
                  ),
                  const SizedBox(height: 20),

                  Divider(color: Colors.grey.shade200, thickness: 1),
                  const SizedBox(height: 16),

                  // Static/Auto-filled Information Cards
                  _buildInfoCard(
                    label: 'PRODUCTION CENTER',
                    value: 'Central Mineral Hub',
                  ),
                  const SizedBox(height: 12),
                  _buildInfoCard(
                    label: 'SELLER NAME',
                    value: 'Official Dealer',
                  ),
                  const SizedBox(height: 12),
                  _buildInfoCard(
                    label: 'LICENSE NUMBER',
                    value: 'LIC-2024-889',
                  ),
                  const SizedBox(height: 12),

                  // Sales Date & Time (with Calendar Icon)
                  _buildInfoCard(
                    label: 'SALES DATE & TIME',
                    value: '29 Jul 2026 14:25',
                    icon: Icons.calendar_today_outlined,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Preview Receipt Button
            Center(
              child: OutlinedButton.icon(
                onPressed: () {
                  // Action for receipt preview
                },
                icon: const Icon(Icons.remove_red_eye_outlined, size: 18),
                label: const Text(
                  'Preview Receipt',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: primaryColor,
                  side: const BorderSide(color: primaryColor, width: 1.5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
        onNewReceiptTap: () {},
      ),
    );
  }

  // Helper method for input decorations matching the grey/purple tint fields
  InputDecoration _inputDecoration({
    String? hintText,
    BorderRadius? borderRadius,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
      filled: true,
      fillColor: const Color(0xFFF3F5F9),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF0F57A6), width: 1.5),
      ),
    );
  }

  // Helper method for static informational fields
  Widget _buildInfoCard({
    required String label,
    required String value,
    IconData? icon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8FB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: icon != null
                      ? const Color(0xFF0F57A6)
                      : Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          if (icon != null)
            Icon(icon, size: 20, color: const Color(0xFF0F57A6)),
        ],
      ),
    );
  }
}
