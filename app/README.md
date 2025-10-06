# HearthBites Mobile App

Flutter mobile application for the HearthBites home-food marketplace.

## 🚀 Setup

### 1. Install Flutter

Follow the official guide: https://flutter.dev/docs/get-started/install

Verify installation:

```bash
flutter doctor
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Code

Generate Freezed and JSON serialization code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Configure Environment

The app uses these environment variables (with defaults):

```bash
# For Android emulator
export API_BASE_URL=http://10.0.2.2:8000

# For iOS simulator
export API_BASE_URL=http://localhost:8000

# For physical device (replace with your computer's IP)
export API_BASE_URL=http://192.168.1.100:8000
```

Or modify `lib/core/env.dart` directly.

### 5. Run the App

```bash
# Run on connected device/emulator
flutter run

# Run on specific device
flutter devices
flutter run -d <device_id>

# Run on Chrome (for testing)
flutter run -d chrome
```

## 📱 Supported Platforms

- ✅ Android (primary target)
- ✅ iOS
- ⚠️ Web (limited functionality)

## 🏗️ Architecture

```
lib/
├── core/
│   ├── env.dart                # Environment config
│   ├── theme.dart              # Material Theme
│   └── i18n/
│       ├── app_en.arb          # English strings
│       └── app_ur.arb          # Urdu strings
├── data/
│   ├── models/
│   │   ├── user.dart           # User model (Freezed)
│   │   ├── menu_item.dart      # Menu item model
│   │   ├── order.dart          # Order models
│   │   ├── delivery.dart       # Delivery model
│   │   └── cart_item.dart      # Cart item
│   └── services/
│       ├── api_client.dart     # Dio HTTP client
│       ├── menu_service.dart   # Menu API calls
│       ├── order_service.dart  # Order API calls
│       └── rider_service.dart  # Rider API calls
├── features/
│   ├── buyer/
│   │   ├── home_screen.dart            # Browse menu
│   │   ├── item_detail_screen.dart     # Item details
│   │   ├── cart_screen.dart            # Shopping cart
│   │   ├── checkout_screen.dart        # Checkout flow
│   │   └── order_status_screen.dart    # Track order
│   ├── seller/
│   │   ├── dashboard_screen.dart       # Seller home
│   │   ├── menu_form_screen.dart       # Add/edit items
│   │   └── orders_inbox_screen.dart    # Incoming orders
│   ├── rider/
│   │   ├── tasks_screen.dart           # Delivery tasks
│   │   └── task_detail_screen.dart     # Task details
│   └── account/
│       └── profile_screen.dart         # User profile
├── providers/
│   └── providers.dart          # Riverpod state management
├── app_router.dart             # GoRouter configuration
└── main.dart                   # App entry point
```

## 🎨 State Management

Uses **Riverpod** for state management:

### Providers

```dart
// Services
final apiClientProvider
final menuServiceProvider
final orderServiceProvider
final riderServiceProvider

// State
final currentUserProvider       // Current user
final cartProvider              // Shopping cart
final localeProvider            // App language

// Data
final menuItemsProvider         // Menu items list
final orderProvider             // Order details
final riderTasksProvider        // Rider tasks
```

## 🗺️ Navigation (GoRouter)

Routes:

```
Buyer:
  /buyer/home           → Browse menu
  /buyer/item/:id       → Item details
  /buyer/cart           → Shopping cart
  /buyer/checkout       → Checkout
  /buyer/order/:id      → Order tracking

Seller:
  /seller/dashboard     → Dashboard
  /seller/menu/new      → Add menu item
  /seller/menu/:id      → Edit menu item
  /seller/orders        → Orders inbox

Rider:
  /rider/tasks          → Task list
  /rider/task/:id       → Task details

General:
  /account              → Profile & settings
```

## 🌍 Internationalization

Supports English and Urdu with RTL layout.

### Add New Translations

1. Edit `lib/core/i18n/app_en.arb` and `app_ur.arb`
2. Run code generation:

```bash
flutter pub get
```

### Switch Language

Use the profile screen settings or:

```dart
ref.read(localeProvider.notifier).state = 'ur';
```

## 🎨 Theming

Material 3 theme with:
- Primary color: Warm Orange (`#FF6B35`)
- Dark mode support
- Custom card and button styles

Modify in `lib/core/theme.dart`.

## 🧪 Testing

### Run Tests

```bash
flutter test
```

### Static Analysis

```bash
flutter analyze
```

### Format Code

```bash
dart format lib/
```

## 📦 Key Packages

| Package | Purpose |
|---------|---------|
| `flutter_riverpod` | State management |
| `go_router` | Navigation |
| `dio` | HTTP client |
| `freezed` | Immutable models |
| `json_serializable` | JSON parsing |
| `shared_preferences` | Local storage |
| `cached_network_image` | Image caching |
| `url_launcher` | External URLs |
| `geolocator` | Location services |
| `firebase_messaging` | Push notifications |

## 🔧 Code Generation

When you modify Freezed models:

```bash
# Watch mode (auto-regenerate)
flutter pub run build_runner watch

# One-time build
flutter pub run build_runner build --delete-conflicting-outputs
```

## 📱 Build for Release

### Android

```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk

# App Bundle (for Play Store)
flutter build appbundle --release
```

### iOS

```bash
flutter build ios --release
```

## 🔐 Permissions

### Android (`android/app/src/main/AndroidManifest.xml`)

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
```

### iOS (`ios/Runner/Info.plist`)

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location for delivery</string>
```

## 🐛 Troubleshooting

### API Connection Issues

- **Android Emulator**: Use `http://10.0.2.2:8000`
- **iOS Simulator**: Use `http://localhost:8000`
- **Physical Device**: Use computer's IP address

### Code Generation Errors

```bash
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Dependency Conflicts

```bash
flutter pub upgrade --major-versions
```

## 📸 Screenshots

(Add screenshots here)

## 🚀 Performance Tips

1. Use `cached_network_image` for images
2. Implement pagination for long lists
3. Use `const` constructors where possible
4. Profile with Flutter DevTools

## 🤝 Contributing

1. Follow Flutter style guide
2. Use Freezed for models
3. Write widget tests for new features
4. Run `flutter analyze` before committing

## 📄 License

MIT License

---

**Happy Flutter Development! 🎯**

