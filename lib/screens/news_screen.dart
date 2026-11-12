import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/mock_data.dart';
import '../models/news_article.dart';
import 'news_detail_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String _selectedCategory = 'সব';
  String _searchQuery = '';

  final categories = ['সব', 'Local', 'Campus', 'Development', 'Sports', 'National'];

  @override
  Widget build(BuildContext context) {
    final filteredNews = newsArticles.where((article) {
      final matchesCategory = _selectedCategory == 'সব' || article.tag.toLowerCase() == _selectedCategory.toLowerCase();
      final matchesQuery = article.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          article.summary.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ত্রিশাল সংবাদ', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22)),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('ব্রেকিং নিউজ এলার্ট অন রয়েছে')),
              );
            },
            icon: const Icon(Icons.notifications_active_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          // Search Field
          TextField(
            onChanged: (val) => setState(() => _searchQuery = val),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              hintText: 'সংবাদ ও খবর সন্ধান করুন...',
            ),
          ),
          const SizedBox(height: 16),

          // News Category Chips
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final cat = categories[index];
                final isSelected = _selectedCategory == cat;
                return ChoiceChip(
                  label: Text(cat),
                  selected: isSelected,
                  onSelected: (_) => setState(() => _selectedCategory = cat),
                  selectedColor: AppColors.primary,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.text,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  side: BorderSide(color: isSelected ? AppColors.primary : AppColors.border),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // News List
          if (filteredNews.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Column(
                  children: [
                    Icon(Icons.newspaper_outlined, size: 50, color: AppColors.muted),
                    SizedBox(height: 10),
                    Text('কোনো খবর পাওয়া যায়নি', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )
          else
            ...filteredNews.map((article) => _buildNewsCard(context, article)),
        ],
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context, NewsArticle article) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NewsDetailScreen(article: article))),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    article.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: AppColors.sky,
                      child: const Center(child: Icon(Icons.newspaper_rounded, size: 50, color: AppColors.primary)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.sky,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      article.tag,
                      style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.calendar_today_rounded, size: 12, color: AppColors.muted),
                  const SizedBox(width: 4),
                  Text(article.date, style: const TextStyle(color: AppColors.muted, fontSize: 11)),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                article.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, height: 1.3, color: AppColors.text),
              ),
              const SizedBox(height: 6),
              Text(
                article.summary,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, color: AppColors.muted, height: 1.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
