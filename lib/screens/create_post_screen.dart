import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _controller = TextEditingController();
  String _category = 'সাধারণ';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('নতুন পোস্ট প্রকাশ করুন', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'ত্রিশাল কমিউনিটির সাথে বিষয় শেয়ার করুন',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.text),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            initialValue: _category,
            decoration: const InputDecoration(labelText: 'পোস্টের ধরন / ক্যাটাগরি'),
            items: const ['সাধারণ', 'খবর', 'ব্যবসা', 'ইভেন্ট', 'সহায়তা']
                .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                .toList(),
            onChanged: (v) => setState(() => _category = v ?? 'সাধারণ'),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _controller,
            minLines: 6,
            maxLines: 10,
            decoration: const InputDecoration(
              hintText: 'আপনার পোস্টের বিবরণ লিখুন...',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColors.sky, borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.add_a_photo_outlined, color: AppColors.primary),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ছবি যুক্ত করুন (ঐচ্ছিক)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      Text('আপনার পোস্ট সুন্দর করতে ছবি যোগ করতে পারেন', style: TextStyle(color: AppColors.muted, fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              if (_controller.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('পোস্টের টেক্সট লিখুন।')));
                return;
              }
              showDialog<void>(
                context: context,
                builder: (ctx) => AlertDialog(
                  icon: const Icon(Icons.check_circle_rounded, color: AppColors.green, size: 48),
                  title: const Text('পোস্ট সফলভাবে সম্পন্ন!'),
                  content: Text('ক্যাটাগরি: $_category\n\n"${_controller.text.trim()}"\n\nআপনার পোস্টটি ত্রিশাল কমিউনিটিতে পোস্ট করা হয়েছে।'),
                  actions: [
                    FilledButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        Navigator.pop(context);
                      },
                      child: const Text('ঠিক আছে'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.send_rounded),
            label: const Text('পোস্ট সাবমিট করুন'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}
