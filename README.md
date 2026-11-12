# Trishal App — Flutter Starter Project

A polished Flutter starter app for Trishal, Mymensingh, with:
- Home dashboard and local information sections
- Shop with search, categories, product details, add-to-cart and quantity controls
- Working bottom navigation: Home, Shop, Post, Community, Profile
- Cart and demo checkout flow
- Bengali-first UI and blue premium theme
- No third-party package dependencies

## Run in Android Studio
1. Extract `trishal_app.zip`.
2. Open the extracted `trishal_app` folder in Android Studio.
3. Wait for Flutter dependencies to resolve.
4. Run:
   ```bash
   flutter pub get
   flutter run
   ```
5. Build an APK:
   ```bash
   flutter build apk --release
   ```
   APK path: `build/app/outputs/flutter-apk/app-release.apk`

## Important
This project is a working UI prototype using local sample data. Shop products, posts, news, and checkout are demo/local only; there is no live payment, real order fulfilment, admin panel, or server/database connected yet. Do not collect real payment details in this demo. To publish a production app, connect a secure backend and approved payment gateway, and add authentication, server-side product/order management, privacy policy, and security rules.
