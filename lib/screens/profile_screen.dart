import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import 'cart_screen.dart';
import 'shop_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আমার প্রোফাইল', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22)),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('সেটিংস অপশন যুক্ত হয়েছে')),
              );
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          // User Card Banner
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppColors.cardGradient,
              borderRadius: BorderRadius.circular(26),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person_rounded, size: 48, color: AppColors.primary),
                ),
                const SizedBox(height: 12),
                const Text(
                  'ত্রিশাল নাগরিক',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Mymensingh, Bangladesh',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified_rounded, color: Color(0xFFFFD600), size: 16),
                      SizedBox(width: 6),
                      Text(
                        'Verified Trishal Resident',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // Quick Stats
          Row(
            children: [
              _buildStatCard('অর্ডার', '২টি', Icons.shopping_bag_outlined, () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
              }),
              const SizedBox(width: 12),
              _buildStatCard('পোস্ট', '৫টি', Icons.article_outlined, () {}),
              const SizedBox(width: 12),
              _buildStatCard('পছন্দ', '১২টি', Icons.favorite_border_rounded, () {}),
            ],
          ),

          const SizedBox(height: 24),

          const Text(
            'অ্যাকাউন্ট ও সুবিধা',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),

          _buildMenuItem(
            context,
            icon: Icons.person_outline_rounded,
            title: 'প্রোফাইল সম্পাদনা',
            subtitle: 'নাম, মোবাইল নম্বর ও ঠিকানা পরিবর্তন করুন',
          ),
          _buildMenuItem(
            context,
            icon: Icons.storefront_rounded,
            title: 'ত্রিশাল শপ ও অর্ডার',
            subtitle: 'আমার অর্ডারের তালিকা ও বিবরণ',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ShopScreen())),
          ),
          _buildMenuItem(
            context,
            icon: Icons.shopping_cart_outlined,
            title: 'আমার কার্ট',
            subtitle: 'কার্টে থাকা পণ্যসমূহ দেখুন',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())),
          ),
          _buildMenuItem(
            context,
            icon: Icons.language_rounded,
            title: 'ভাষা (Language)',
            subtitle: 'বাংলা / English',
          ),
          _buildMenuItem(
            context,
            icon: Icons.help_outline_rounded,
            title: 'সাহায্য ও সাপোর্ট',
            subtitle: 'ত্রিশাল হেল্পলাইন ও যোগাযোগ',
          ),
          _buildMenuItem(
            context,
            icon: Icons.info_outline_rounded,
            title: 'অ্যাপ সম্পর্কে',
            subtitle: 'Trishal Official App • Version 1.0.0',
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              Icon(icon, color: AppColors.primary, size: 22),
              const SizedBox(height: 6),
              Text(value, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              Text(label, style: const TextStyle(color: AppColors.muted, fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: AppColors.border),
        ),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.sky,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: AppColors.primary, size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 11, color: AppColors.muted)),
        trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
        onTap: onTap ??
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$title: অপশনটি প্রস্তুত আছে')),
              );
            },
      ),
    );
  }
}
