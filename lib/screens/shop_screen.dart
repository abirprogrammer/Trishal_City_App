import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/mock_data.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});
  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String _category = 'সব';
  String _query = '';
  bool _offersOnly = false;

  @override
  Widget build(BuildContext context) {
    final shown = products.where((p) {
      final matchesCategory = _category == 'সব' || p.category == _category;
      final matchesQuery = p.name.toLowerCase().contains(_query.toLowerCase()) || p.subtitle.toLowerCase().contains(_query.toLowerCase());
      return matchesCategory && matchesQuery && (!_offersOnly || p.oldPrice != null);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ত্রিশাল শপ', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22)),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())),
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                TextField(
                  onChanged: (value) => setState(() => _query = value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    hintText: 'পণ্য বা দোকান খুঁজুন...',
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: AppColors.cardGradient,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Local Finds,\nBetter Trishal.',
                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, height: 1.1),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'এলাকার পণ্য কিনুন, স্থানীয় ব্যবসাকে এগিয়ে নিন।',
                              style: TextStyle(color: Colors.white70, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 68,
                        height: 68,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.storefront_rounded, color: Colors.white, size: 36),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text('ক্যাটাগরি', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 38,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (_, index) {
                      final category = categories[index];
                      final selected = _category == category;
                      return ChoiceChip(
                        label: Text(category),
                        selected: selected,
                        onSelected: (_) => setState(() => _category = category),
                        selectedColor: AppColors.primary,
                        labelStyle: TextStyle(
                          color: selected ? Colors.white : AppColors.text,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        side: BorderSide(color: selected ? AppColors.primary : AppColors.border),
                        backgroundColor: Colors.white,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(child: Text('${shown.length}টি পণ্য', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900))),
                    FilterChip(
                      label: const Text('অফার'),
                      selected: _offersOnly,
                      onSelected: (value) => setState(() => _offersOnly = value),
                      selectedColor: AppColors.sky,
                      checkmarkColor: AppColors.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ]),
            ),
          ),
          if (shown.isEmpty)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.search_off_rounded, size: 50, color: AppColors.muted),
                      SizedBox(height: 10),
                      Text('কোনো পণ্য পাওয়া যায়নি', style: TextStyle(fontWeight: FontWeight.w800)),
                      Text('অন্য নাম বা ক্যাটাগরি দিয়ে খুঁজুন', style: TextStyle(color: AppColors.muted)),
                    ],
                  ),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 28),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ProductCard(product: shown[index]),
                  childCount: shown.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                  childAspectRatio: 0.64,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
