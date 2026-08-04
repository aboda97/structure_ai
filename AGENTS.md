# AGENTS.md

Flutter app (`structure_app`) — currently a **clean-architecture scaffold**: only `lib/core/` exists, no features yet. This repo is a template to bootstrap new apps.

## Commands

- `flutter analyze` — static analysis (stock `flutter_lints`, no custom rules)
- `flutter test` — runs `test/widget_test.dart`
- `flutter run` — **will not work out of the box**: `SupabaseConstants.supabaseUrl/supabasePublishableKey` (`lib/core/constants/supabase_constants.dart`) and `ApiConstants.baseUrl` are empty strings; `FirebaseService.initialize()` calls `Firebase.initializeApp()` with no options (no `firebase_options.dart`, no `google-services.json`). Don't invent placeholder credentials — leave unset unless asked.

## Known broken baseline (verified 2026-08)

`flutter analyze` reports **1 issue**. The `auth_injection.dart` unused-import warnings and the `SupabaseService.initialize()` `anonKey` deprecation (supabase_flutter 2.16 wants `publishableKey`) were fixed — match the renamed `supabasePublishableKey` constant. Remaining:
- **Error**: `test/widget_test.dart` still references `MyApp` from the default counter template; the real root widget is `App` in `lib/app.dart`. `flutter test` fails to compile until fixed.

Also note: every file in `lib/core/` is documented with beginner-friendly English comments explaining what each part does and why — keep comments meaningful when editing.

## Architecture conventions

- **Layer** (feature template): `lib/features/<feature>/` with `data/`, `domain/`, `presentation/`, plus `<feature>/di/<feature>_injection.dart`. `auth_injection.dart` shows the intended DI order: data sources → repositories → use cases → cubits (Bloc/Cubit state management is expected).
- **DI**: `get_it` singleton `sl` in `lib/core/di/service_locator.dart`. `initDependencies()` order matters: `initCore()` first, then feature `init*()` — keep the commented feature registrations as the pattern. `registerLazySingleton` for deps, `registerFactory` for cubits.
- **Routing**: `go_router`. `AppRouter.router` is a static singleton in `lib/core/routing/app_router.dart`; screens are registered in `route_names.dart`, `app_router.dart`, and guarded in `route_guards.dart`. Add new routes to all three. Splash is `/`, login is `/login`; the current login `GoRoute` has no builder yet.
- **Networking**: `DioClient.create()` wires **only** `AuthInterceptor` + `LoggerInterceptor`. `RefreshTokenInterceptor` and `RetryInterceptor` exist but are not registered anywhere — wire them up before relying on 401-refresh/retry behavior. `ApiClient` wraps Dio and maps `DioException` → domain exceptions via `DioErrorMapper`, then `ErrorHandler` → `Failure`.
- **Auth tokens**: stored in `flutter_secure_storage` (not SharedPreferences) under keys in `KeysConstants` (`access_token`, etc.). `AuthInterceptor` reads `access_token`; `RouteGuards.redirect` uses it to decide login state.
- **Style**: `abstract final class` for constants/services, `abstract interface class` + `*Impl` for abstractions, `final class` elsewhere. Match this in new code.
