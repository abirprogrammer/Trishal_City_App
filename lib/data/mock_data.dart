import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/news_article.dart';
import '../models/event_item.dart';
import '../models/community_post.dart';
import '../models/category_item.dart';

const categories = ['সব', 'খাবার', 'ফ্যাশন', 'ইলেকট্রনিক্স', 'ঘর ও জীবন', 'কৃষি'];

final List<CategoryItem> homeCategories = [
  const CategoryItem(
    id: 'news',
    titleEn: 'News',
    titleBn: 'খবর',
    icon: Icons.newspaper_rounded,
    bgColor: Color(0xFFEAF2FF),
    iconColor: Color(0xFF165DFC),
    countText: '১২টি নতুন',
  ),
  const CategoryItem(
    id: 'business',
    titleEn: 'Business',
    titleBn: 'ব্যবসা',
    icon: Icons.storefront_rounded,
    bgColor: Color(0xFFEBF9F1),
    iconColor: Color(0xFF10A875),
    countText: '৪৫টি দোকান',
  ),
  const CategoryItem(
    id: 'education',
    titleEn: 'Education',
    titleBn: 'শিক্ষা',
    icon: Icons.school_rounded,
    bgColor: Color(0xFFF3EDFF),
    iconColor: Color(0xFF7C3AED),
    countText: '১৮টি প্রতিষ্ঠান',
  ),
  const CategoryItem(
    id: 'jobs',
    titleEn: 'Jobs',
    titleBn: 'চাকরি',
    icon: Icons.work_rounded,
    bgColor: Color(0xFFFFECEC),
    iconColor: Color(0xFFEF4444),
    countText: '৮টি নিয়োগ',
  ),
  const CategoryItem(
    id: 'events',
    titleEn: 'Events',
    titleBn: 'ইভেন্ট',
    icon: Icons.calendar_month_rounded,
    bgColor: Color(0xFFFFECF3),
    iconColor: Color(0xFFEC4899),
    countText: '৫টি ইভেন্ট',
  ),
  const CategoryItem(
    id: 'health',
    titleEn: 'Health',
    titleBn: 'স্বাস্থ্য',
    icon: Icons.medical_services_rounded,
    bgColor: Color(0xFFEBFBF5),
    iconColor: Color(0xFF0D9488),
    countText: '১৫টি ক্লিনিক',
  ),
  const CategoryItem(
    id: 'places',
    titleEn: 'Places',
    titleBn: 'দর্শনীয় স্থান',
    icon: Icons.location_on_rounded,
    bgColor: Color(0xFFFFF3E5),
    iconColor: Color(0xFFFF8A32),
    countText: '১০টি স্থান',
  ),
  const CategoryItem(
    id: 'more',
    titleEn: 'More',
    titleBn: 'আরও',
    icon: Icons.grid_view_rounded,
    bgColor: Color(0xFFEEF5FF),
    iconColor: Color(0xFF3B82F6),
    countText: 'সব সেবা',
  ),
];

const List<NewsArticle> newsArticles = [
  NewsArticle(
    id: 'n1',
    title: 'ত্রিশালে নতুন সড়ক নির্মাণে শুরু হয়েছে কাজ',
    date: 'Nov 7, 2026',
    tag: 'Local',
    imageUrl: 'https://images.unsplash.com/photo-1570129477492-45c003edd2be?auto=format&fit=crop&w=600&q=80',
    summary: 'ত্রিশাল পৌরসভার প্রধান সড়কের সংস্কার কাজ শুরু হয়েছে। এতে যানজট নিরসন হবে।',
    content: 'ত্রিশাল পৌরসভার প্রধান সড়ক পুনর্বাসন ও সম্প্রসারণের কাজ আজ আনুষ্ঠানিকভাবে উদ্বোধন করা হয়েছে। উপজেলা চেয়ারম্যান এবং পৌরসভার মেয়র উপস্থিত থেকে এ উন্নয়ন কাজের ভিত্তিপ্রস্তর স্থাপন করেন। স্থানীয় বাসিন্দারা দীর্ঘদিনের এ চাহিদা পূরণ হওয়ায় সন্তোষ প্রকাশ করেছেন।',
    author: 'ত্রিশাল প্রতিনিধি',
    readTime: '৩ মিনিট',
    isFeatured: true,
  ),
  NewsArticle(
    id: 'n2',
    title: 'জাতীয় কবি কাজী নজরুল ইসলাম বিশ্ববিদ্যালয়ে বিশেষ সমাবর্তন',
    date: 'Nov 5, 2026',
    tag: 'Campus',
    imageUrl: 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&w=600&q=80',
    summary: 'জাককানইবিতে জমকালো আয়োজনে বিশেষ সমাবর্তন ও সাংস্কৃতিক উৎসব অনুষ্ঠিত হতে যাচ্ছে।',
    content: 'ত্রিশালে অবস্থিত জাতীয় কবি কাজী নজরুল ইসলাম বিশ্ববিদ্যালয় ক্যাম্পাসে আগামী সপ্তাহে বিশেষ সমাবর্তন অনুষ্ঠিত হবে। বিশ্ববিদ্যালয়ের মাননীয় উপাচার্য জানান, প্রস্তুতি প্রায় সম্পন্ন। শিক্ষা ও গবেষণায় বিশেষ অবদানের জন্য গুণিজনদের সম্মাননা দেওয়া হবে।',
    author: 'ক্যাম্পাস রিপোর্ট',
    readTime: '৪ মিনিট',
    isFeatured: true,
  ),
  NewsArticle(
    id: 'n3',
    title: 'ত্রিশাল বাজারে নতুন আধুনিক বর্জ্য ব্যবস্থাপনা কেন্দ্র',
    date: 'Nov 3, 2026',
    tag: 'Development',
    imageUrl: 'https://images.unsplash.com/photo-1532996122724-e3c354a0b15b?auto=format&fit=crop&w=600&q=80',
    summary: 'পরিবেশবান্ধব ও পরিচ্ছন্ন শহর গড়তে নতুন প্রকল্প গ্রহণ।',
    content: 'ত্রিশাল বাজার এলাকার পরিবেশ রক্ষার্থে আধুনিক বর্জ্য প্রক্রিয়াজাতকরণ প্ল্যান্ট উদ্বোধন করা হয়েছে। স্থানীয় প্রশাসন বাজার ব্যবসায়ী সমিতির সহযোগিতায় এই উদ্যোগ বাস্তবায়ন করেছে।',
    author: 'পরিবেশ ডেস্কে',
    readTime: '২ মিনিট',
  ),
];

const List<EventItem> eventItems = [
  EventItem(
    id: 'e1',
    title: 'ত্রিশাল উপজেলা বিজ্ঞান মেলা ২০২৬',
    dateDay: '23',
    dateMonth: 'Nov',
    time: '10:00 AM • উপজেলা মাঠ',
    location: 'ত্রিশাল উপজেলা পরিষদ মাঠ',
    imageUrl: 'https://images.unsplash.com/photo-1511578314322-379afb476865?auto=format&fit=crop&w=600&q=80',
    organizer: 'উপজেলা প্রশাসন, ত্রিশাল',
    description: 'উপজেলার স্কুল ও কলেজের শিক্ষার্থীদের উদ্ভাবনী প্রজেক্ট প্রদর্শনী, কুইজ প্রতিযোগিতা ও পুরস্কার বিতরণী অনুষ্ঠিত হবে। সকল নাগরিক আমন্ত্রিত।',
  ),
  EventItem(
    id: 'e2',
    title: 'নজরুল জয়ন্তী ও লোকজ মেলা',
    dateDay: '05',
    dateMonth: 'Dec',
    time: '04:00 PM • দরিরামপুর',
    location: 'দরিরামপুর নজরুল মঞ্চ, ত্রিশাল',
    imageUrl: 'https://images.unsplash.com/photo-1465847899084-d164df4dedc6?auto=format&fit=crop&w=600&q=80',
    organizer: 'নজরুল একাডেমি ত্রিশাল',
    description: 'কাজী নজরুল ইসলামের স্মৃতিবিজড়িত ত্রিশালে বার্ষিক নজরুল মেলা ও তিন দিনব্যাপী সাংস্কৃতিক সন্ধ্যার আয়োজন করা হয়েছে।',
  ),
  EventItem(
    id: 'e3',
    title: 'বিনামূল্যে স্বাস্থ্য ও রক্তদান ক্যাম্প',
    dateDay: '12',
    dateMonth: 'Dec',
    time: '09:00 AM • ত্রিশাল সরকারি হাসপাতাল',
    location: 'ত্রিশাল স্বাস্থ্য কমপ্লেক্স',
    imageUrl: 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?auto=format&fit=crop&w=600&q=80',
    organizer: 'ত্রিশাল যুব কল্যাণ সমিতি',
    description: 'অভিজ্ঞ ডাক্তারদের দ্বারা বিনামূল্যে বিশেষজ্ঞ সেবা ও ডায়াবেটিস পরীক্ষা প্রদান করা হবে।',
  ),
];

final List<CommunityPost> mockPosts = [
  CommunityPost(
    id: 'p1',
    authorName: 'তানভীর আহমেদ',
    authorSubtitle: 'ত্রিশাল সদর • ৫ মিনিট আগে',
    timeAgo: '৫ মিনিট আগে',
    content: 'আজকে ত্রিশাল রাজলক্ষ্মী বইমেলায় অনেক সুন্দর সুন্দর বই এসেছে। নজরুল একাডেমির স্টলে স্পেশাল ছাড় চলছে। সবাই ঘুরে আসতে পারেন! 📚✨',
    category: 'সাধারণ',
    likes: 24,
    comments: 7,
    isLiked: true,
  ),
  CommunityPost(
    id: 'p2',
    authorName: 'সাদিয়া আক্তার',
    authorSubtitle: 'দরিরামপুর • ১ ঘণ্টা আগে',
    timeAgo: '১ ঘণ্টা আগে',
    content: 'ত্রিশাল বাজারে তাজা অর্গানিক সরিষার তেল ও খাঁটি মধু দরকার হলে যোগাযোগ করতে পারেন। একদম ঘরোয়াভাবে তৈরি। 🍯🫙',
    category: 'ব্যবসা',
    likes: 42,
    comments: 15,
  ),
  CommunityPost(
    id: 'p3',
    authorName: 'জাককানইবি ব্লাড ব্যাংক',
    authorSubtitle: 'বিশ্ববিদ্যালয় ক্যাম্পাস • ২ ঘণ্টা আগে',
    timeAgo: '২ ঘণ্টা আগে',
    content: 'জরুরি রক্তের প্রয়োজন! B+ (বি পজিটিভ)। স্থান: ত্রিশাল উপজেলা হাসপাতাল। যেকোনো রক্তদাতা ভাই যোগাযোগ করুন। 🩸 01700-000000',
    category: 'সহায়তা',
    likes: 89,
    comments: 31,
    isLiked: true,
  ),
];

const products = <Product>[
  Product(id: 'p1', name: 'ত্রিশালের খাঁটি মধু', subtitle: 'প্রাকৃতিক • ৫০০ গ্রাম', category: 'খাবার', price: 420, oldPrice: 480, emoji: '🍯', colorValue: 0xFFFFE7B8, description: 'ত্রিশালের স্থানীয় বন ও খামার থেকে সংগৃহীত ১০০% প্রাকৃতিক ও খাঁটি মধু। কোনোরূপ কৃত্রিম উপাদান ছাড়া বাজারজাতকৃত।', featured: true),
  Product(id: 'p2', name: 'দেশি সরিষার তেল', subtitle: 'কোল্ড প্রেসড • ১ লিটার', category: 'খাবার', price: 280, emoji: '🫙', colorValue: 0xFFFFF0C9, description: 'ঐতিহ্যবাহী কাঠের ঘানিতে ভাঙানো বিশুদ্ধ সরিষার তেল। ঝাঁজালো ও ঘ্রাণযুক্ত।', featured: true),
  Product(id: 'p3', name: 'কটন পাঞ্জাবি', subtitle: 'কমফোর্ট ফিট • বিভিন্ন সাইজ', category: 'ফ্যাশন', price: 950, oldPrice: 1200, emoji: '👔', colorValue: 0xFFDCEBFF, description: '১০০% পিওর কটন কাপড়ে তৈরি আরামদায়ক পাঞ্জাবি। প্রিমিয়াম সেলাই ও ডিজাইন।', featured: true),
  Product(id: 'p4', name: 'ওয়্যারলেস ইয়ারবাড', subtitle: 'চার্জিং কেসসহ', category: 'ইলেকট্রনিক্স', price: 1250, emoji: '🎧', colorValue: 0xFFE9E1FF, description: 'এইচডি সাউন্ড ও নয়েজ ক্যানসেলেশন সমৃদ্ধ ইয়ারবাড। লং ব্যাটারি ব্যাকআপ।', featured: false),
  Product(id: 'p5', name: 'হ্যান্ডমেড মাটির কাপ', subtitle: '২ পিস সেট', category: 'ঘর ও জীবন', price: 180, emoji: '☕', colorValue: 0xFFFFE2D2, description: 'ত্রিশালের ঐতিহ্যবাহী মৃৎশিল্পীদের নিজ হাতে তৈরি মাটির চায়ের কাপ।', featured: false),
  Product(id: 'p6', name: 'জৈব সবজি প্যাক', subtitle: 'মৌসুমি সবজি • ২ কেজি', category: 'কৃষি', price: 220, emoji: '🥬', colorValue: 0xFFD9F7E7, description: 'কোনো কীটনাশক ছাড়াই স্থানীয় খামারে উৎপাদিত তাজা জৈব সবজির মিক্সড প্যাক।', featured: true),
  Product(id: 'p7', name: 'লেদার ওয়ালেট', subtitle: 'স্লিম ডিজাইন', category: 'ফ্যাশন', price: 390, emoji: '👛', colorValue: 0xFFFFE6D6, description: '১০০% জেনুইন লেদার স্লিম ওয়ালেট। পকেটে সহজে ফিট হয়।', featured: false),
  Product(id: 'p8', name: 'স্টাডি টেবিল ল্যাম্প', subtitle: 'রিচার্জেবল LED', category: 'ঘর ও জীবন', price: 690, emoji: '💡', colorValue: 0xFFFFF1C9, description: 'চোখের জন্য আরামদায়ক লাইট সেটিংসসহ আধুনিক LED টেবিল ল্যাম্প।', featured: false),
];
