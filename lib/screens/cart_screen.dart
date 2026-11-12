import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('আমার কার্ট')),
      body: AnimatedBuilder(animation: cartController, builder: (context, _) {
        final items = cartController.items;
        if (items.isEmpty) return const Center(child: Padding(padding: EdgeInsets.all(28), child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.shopping_bag_outlined, size: 68, color: AppColors.muted), SizedBox(height: 15), Text('কার্ট এখন খালি', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)), SizedBox(height: 6), Text('শপ থেকে পছন্দের পণ্য যোগ করুন।', style: TextStyle(color: AppColors.muted))])));
        return ListView(padding: const EdgeInsets.fromLTRB(18, 8, 18, 22), children: [
          ...items.map((entry) => Container(margin: const EdgeInsets.only(bottom: 11), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.border)), child: Row(children: [
            Container(width: 65, height: 65, decoration: BoxDecoration(color: Color(entry.key.colorValue), borderRadius: BorderRadius.circular(16)), child: Center(child: Text(entry.key.emoji, style: const TextStyle(fontSize: 31)))),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(entry.key.name, style: const TextStyle(fontWeight: FontWeight.w800)), const SizedBox(height: 5), Text('৳${entry.key.price} × ${entry.value}', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800))])),
            Row(mainAxisSize: MainAxisSize.min, children: [
              _qtyButton(Icons.remove, () => cartController.removeOne(entry.key)),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w900))),
              _qtyButton(Icons.add, () => cartController.add(entry.key)),
            ]),
          ]))),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.all(17), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.border)), child: Column(children: [
            _priceRow('পণ্যের মূল্য', '৳${cartController.total}'),
            const SizedBox(height: 9),
            _priceRow('ডেলিভারি', '৳60'),
            const Divider(height: 22),
            _priceRow('সর্বমোট', '৳${cartController.total + 60}', bold: true),
          ])),
          const SizedBox(height: 18),
          const Text('ডেলিভারির তথ্য', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          TextField(controller: _name, decoration: const InputDecoration(labelText: 'আপনার নাম')),
          const SizedBox(height: 10),
          TextField(controller: _phone, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'মোবাইল নম্বর')),
          const SizedBox(height: 10),
          TextField(controller: _address, maxLines: 2, decoration: const InputDecoration(labelText: 'সম্পূর্ণ ঠিকানা')),
          const SizedBox(height: 17),
          FilledButton.icon(onPressed: _checkout, icon: const Icon(Icons.check_circle_outline_rounded), label: const Text('ডেমো অর্ডার কনফার্ম করুন'), style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16))),
          const SizedBox(height: 8),
          const Text('এটি ডেমো চেকআউট। কোনো অনলাইন পেমেন্ট নেওয়া হয় না।', textAlign: TextAlign.center, style: TextStyle(color: AppColors.muted, fontSize: 11)),
        ]);
      }),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(9), child: Container(width: 28, height: 28, decoration: BoxDecoration(color: AppColors.sky, borderRadius: BorderRadius.circular(9)), child: Icon(icon, size: 17, color: AppColors.primary)));
  Widget _priceRow(String label, String price, {bool bold = false}) => Row(children: [Expanded(child: Text(label, style: TextStyle(color: bold ? AppColors.text : AppColors.muted, fontWeight: bold ? FontWeight.w900 : FontWeight.w500))), Text(price, style: TextStyle(fontWeight: bold ? FontWeight.w900 : FontWeight.w700, fontSize: bold ? 18 : 14, color: bold ? AppColors.primary : AppColors.text))]);

  void _checkout() {
    if (cartController.items.isEmpty) return;
    if (_name.text.trim().isEmpty || _phone.text.trim().isEmpty || _address.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('নাম, মোবাইল নম্বর ও ঠিকানা পূরণ করুন।')));
      return;
    }
    showDialog<void>(context: context, builder: (dialogContext) => AlertDialog(
      icon: const Icon(Icons.check_circle_rounded, color: AppColors.green, size: 48),
      title: const Text('ডেমো অর্ডার সম্পন্ন!'),
      content: Text('ধন্যবাদ ${_name.text.trim()}। আপনার অর্ডারটি শুধু এই ডেমো অ্যাপে দেখানো হয়েছে। বাস্তব অর্ডারের জন্য সার্ভার সংযোগ প্রয়োজন।'),
      actions: [FilledButton(onPressed: () { cartController.clear(); Navigator.pop(dialogContext); Navigator.pop(context); }, child: const Text('ঠিক আছে'))],
    ));
  }
}
