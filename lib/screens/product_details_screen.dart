import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../models/product.dart';
import '../controllers/cart_controller.dart';
import 'cart_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('পণ্যের বিস্তারিত'), actions: [IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())), icon: const Icon(Icons.shopping_bag_outlined))]),
      body: ListView(padding: const EdgeInsets.all(18), children: [
        Container(height: 260, decoration: BoxDecoration(color: Color(product.colorValue), borderRadius: BorderRadius.circular(28)), child: Center(child: Text(product.emoji, style: const TextStyle(fontSize: 110)))),
        const SizedBox(height: 20),
        Row(children: [
          Expanded(child: Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900))),
          if (product.oldPrice != null) Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFFFE9E1), borderRadius: BorderRadius.circular(10)), child: const Text('অফার', style: TextStyle(color: Color(0xFFDC5427), fontWeight: FontWeight.w800))),
        ]),
        const SizedBox(height: 6),
        Text(product.subtitle, style: const TextStyle(color: AppColors.muted)),
        const SizedBox(height: 14),
        Row(children: [
          Text('৳${product.price}', style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: AppColors.primary)),
          if (product.oldPrice != null) ...[const SizedBox(width: 9), Text('৳${product.oldPrice}', style: const TextStyle(color: AppColors.muted, decoration: TextDecoration.lineThrough))],
        ]),
        const SizedBox(height: 22),
        const Text('পণ্যের বিবরণ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        Text(product.description, style: const TextStyle(height: 1.6, color: AppColors.muted)),
        const SizedBox(height: 16),
        Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: AppColors.sky, borderRadius: BorderRadius.circular(16)), child: const Row(children: [Icon(Icons.verified_user_outlined, color: AppColors.primary), SizedBox(width: 10), Expanded(child: Text('অর্ডার করার আগে বিক্রেতার কাছে পণ্যের প্রাপ্যতা ও ডেলিভারি নিশ্চিত করুন।', style: TextStyle(fontSize: 12, height: 1.4)))])),
      ]),
      bottomNavigationBar: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(18, 10, 18, 14), child: Row(children: [
        Expanded(child: OutlinedButton.icon(onPressed: () { cartController.add(product); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('কার্টে যোগ হয়েছে'))); }, icon: const Icon(Icons.add_shopping_cart_rounded), label: const Text('কার্টে যোগ করুন'), style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)))),
        const SizedBox(width: 10),
        Expanded(child: FilledButton(onPressed: () { cartController.add(product); Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())); }, style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)), child: const Text('অর্ডার করুন'))),
      ]))),
    );
  }
}
