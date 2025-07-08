# Ile Ire - Interactive Learning Platform

<div align="center">
  <img src="assets/images/logo.png" alt="Ile Ire Logo" width="200"/>
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.5.0-blue.svg)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-3.5.0-blue.svg)](https://dart.dev/)
  [![Firebase](https://img.shields.io/badge/Firebase-Enabled-orange.svg)](https://firebase.google.com/)
  [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
</div>

## 📱 About

**Ile Ire** is a comprehensive educational mobile application built with Flutter that provides an interactive learning experience for children. The app combines gamification, digital libraries, and assessment tools to create an engaging educational platform.

## ✨ Features

### 🎯 Core Features
- **Interactive Dashboard** - Personalized learning dashboard with progress tracking
- **Digital Library** - Extensive collection of books, stories, and educational content
- **Quiz System** - Interactive assessments with skill-based learning
- **Gamification** - Coin rewards and achievement system
- **Analytics** - Detailed performance tracking and insights
- **User Profiles** - Personalized user management with kid-specific profiles

### 📚 Educational Content
- **E-Book Library** - Digital books with reading progress tracking
- **Story Library** - Interactive storytelling experience
- **Skit Library** - Educational skits and performances
- **Video Content** - Educational videos and multimedia content
- **Club System** - Community-based learning groups

### 🎮 Gamification Elements
- **Coin System** - Earn coins through learning activities
- **Badges & Achievements** - Reward system for completed milestones
- **Progress Tracking** - Visual progress indicators
- **Leaderboards** - Competitive learning environment

### 🔐 Authentication & Security
- **Firebase Authentication** - Secure user registration and login
- **Email Verification** - Account verification system
- **Profile Management** - User profile customization
- **Data Privacy** - Secure data handling

## 🛠️ Technology Stack

### Frontend
- **Flutter** - Cross-platform mobile development framework
- **Dart** - Programming language
- **Riverpod** - State management
- **Go Router** - Navigation and routing

### Backend & Services
- **Firebase** - Backend as a Service
  - Firebase Authentication
  - Cloud Firestore (Database)
  - Firebase Storage
- **Stripe** - Payment processing (integrated)

### UI/UX Libraries
- **Material Design** - UI components
- **Google Fonts** - Typography
- **Flutter SVG** - Vector graphics
- **Rive** - Animations
- **Cached Network Image** - Image caching

### Audio & Media
- **Audio Players** - Sound effects and audio content
- **Flutter TTS** - Text-to-speech functionality
- **YouTube Player** - Video content integration

## 📋 Prerequisites

Before running this project, ensure you have the following installed:

- **Flutter SDK** (3.5.0 or higher)
- **Dart SDK** (3.5.0 or higher)
- **Android Studio** / **VS Code** with Flutter extensions
- **Firebase CLI** (for backend setup)
- **Git** (for version control)

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/ileiwe.git
cd ileiwe
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Firebase Setup
1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication, Firestore, and Storage services
3. Download the configuration files:
   - `google-services.json` for Android
   - `GoogleService-Info.plist` for iOS
4. Place the files in their respective directories:
   - Android: `android/app/google-services.json`
   - iOS: `ios/Runner/GoogleService-Info.plist`

### 4. Environment Configuration
Create a `.env` file in the root directory and add your configuration:
```env
# Add any environment variables here
```

### 5. Run the Application
```bash
# For development
flutter run

# For production build
flutter build apk --release
flutter build ios --release
```

## 📁 Project Structure

```
lib/
├── app/                    # Application modules
│   ├── analytics/         # Analytics and reporting
│   ├── auth/             # Authentication system
│   ├── club/             # Club management
│   ├── coinsHistory/     # Coin transaction history
│   ├── dashboard/        # Main dashboard
│   ├── game/             # Gaming features
│   ├── library/          # Digital library system
│   ├── messages/         # Messaging system
│   ├── notifications/    # Push notifications
│   ├── onboarding/       # User onboarding
│   ├── profile/          # User profile management
│   ├── quizes/           # Quiz and assessment system
│   ├── stripe_payment/   # Payment processing
│   ├── subscription/     # Subscription management
│   └── welcome/          # Welcome and splash screens
├── constant/             # Application constants
├── cores/               # Core utilities and themes
└── main.dart            # Application entry point
```

## 🎨 Design System

The application follows a consistent design system with:
- **Color Scheme**: Purple-based theme (#7a00aa)
- **Typography**: Google Fonts integration
- **Icons**: Custom SVG icons and Material Design icons
- **Animations**: Rive animations for enhanced UX
- **Responsive Design**: Adaptive layouts for different screen sizes

## 🔧 Configuration

### Firebase Configuration
The app uses Firebase for backend services. Ensure proper configuration in:
- `lib/firebase_options.dart`
- Platform-specific configuration files

### Navigation
Routes are defined in `lib/cores/routes.dart` using Go Router for type-safe navigation.

### State Management
Riverpod is used for state management with providers defined in each module.

## 📱 Platform Support

- **Android** - API level 21+ (Android 5.0+)
- **iOS** - iOS 12.0+
- **Web** - Modern browsers (Chrome, Firefox, Safari, Edge)
- **Desktop** - Windows, macOS, Linux (experimental)

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run widget tests
flutter test test/widget_test.dart

# Run integration tests
flutter test integration_test/
```

## 📦 Building for Production

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow Flutter best practices
- Use meaningful commit messages
- Write tests for new features
- Update documentation as needed
- Follow the existing code style

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- All contributors and beta testers
- Educational content providers

## 📞 Support

For support and questions:
- Create an issue in the GitHub repository
- Contact the development team
- Check the documentation in the `/docs` folder

## 🔄 Version History

- **v1.2.0** - Current stable release
- **v1.1.0** - Added analytics and improved UI
- **v1.0.0** - Initial release with core features

---

<div align="center">
  Made with ❤️ by the Ile Ire Development Team
</div>
