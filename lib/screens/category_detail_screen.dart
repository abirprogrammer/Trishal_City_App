import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../models/category_item.dart';
import '../data/mock_data.dart';
import '../widgets/product_card.dart';
import 'news_detail_screen.dart';
import 'event_detail_screen.dart';
import 'shop_screen.dart';

class CategoryDetailScreen extends StatelessWidget {
  final CategoryItem category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.titleBn),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: category.bgColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: category.iconColor.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(color: category.iconColor.withOpacity(0.15), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Icon(category.icon, color: category.iconColor, size: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${category.titleBn} (${category.titleEn})',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.text),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'ত্রিশাল উপজেলার ${category.titleBn} সংক্রান্ত সেবা ও তথ্যসমূহ',
                        style: const TextStyle(fontSize: 12, color: AppColors.muted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'সাম্প্রতিক আপডেট ও সেবা (${category.countText})',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 14),
          if (category.id == 'news')
            ...newsArticles.map((article) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(color: AppColors.border),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        article.imageUrl,
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(color: AppColors.sky, child: const Icon(Icons.newspaper)),
                      ),
                    ),
                    title: Text(article.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: Text('${article.date} • ${article.tag}', style: const TextStyle(fontSize: 11, color: AppColors.muted)),
                    trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NewsDetailScreen(article: article))),
                  ),
                ))
          else if (category.id == 'events')
            ...eventItems.map((ev) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(color: AppColors.border),
                    ),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(color: AppColors.sky, borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(ev.dateDay, style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.primary, fontSize: 18)),
                      ),
                    ),
                    title: Text(ev.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: Text(ev.time, style: const TextStyle(fontSize: 11, color: AppColors.muted)),
                    trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EventDetailScreen(event: ev))),
                  ),
                ))
          else if (category.id == 'business')
            ...products.take(4).map((p) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(color: AppColors.border),
                    ),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(color: Color(p.colorValue), borderRadius: BorderRadius.circular(12)),
                      child: Center(child: Text(p.emoji, style: const TextStyle(fontSize: 24))),
                    ),
                    title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: Text('মূল্য: ৳${p.price}', style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold)),
                    trailing: const Icon(Icons.shopping_bag_outlined, color: AppColors.primary),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ShopScreen())),
                  ),
                ))
          else
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Icon(category.icon, size: 50, color: category.iconColor),
                  const SizedBox(height: 12),
                  Text(
                    '${category.titleBn} বিভাগের তালিকা',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'ত্রিশাল উপজেলার বিভিন্ন স্থানীয় প্রতিষ্ঠান, অফিস ও সেবাসমূহ এখানে দেখানো হবে।',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.muted, fontSize: 12),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
