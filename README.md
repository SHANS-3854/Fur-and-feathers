# PetCare — fresh Flutter project (Phase 1)

This is a new scaffold created from scratch, not the previous scaffold.

## Included in Phase 1
- Flutter/Dart app structure with null safety
- Semantic `ThemeExtension<GlassTokens>` for light and dark themes
- Ambient gradient background and reusable glass surface
- Persisted theme selection and Reduce Effects setting
- Riverpod settings state
- `go_router` stateful five-tab navigation
- Empty states that do not fabricate pet, clinic, rating, hours, emergency availability, or camera data
- A widget test for the navigation shell

## Toolchain
Flutter **3.35.7** is pinned in `.fvmrc`; Dart SDK constraint is `>=3.9.0 <4.0.0`.
Dependency versions are pinned exactly in `pubspec.yaml`. This is the project's selected baseline,
not a claim that it is the newest stable Flutter release.

## Important: Android-phone-only workflow
Acode is an editor, not a Flutter SDK or Android compiler. Use a cloud development environment
with a terminal, such as GitHub Codespaces, in the phone browser. Upload these files into a
GitHub repository with `pubspec.yaml` at its root. Then run:

```bash
flutter --version
flutter pub get
flutter analyze
flutter test
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

Forward port 8080 in the Codespaces Ports panel to view the early UI in your browser. This web
preview is not a substitute for native Android testing. To create an APK, a Flutter-capable
environment with Android SDK/build tools is required. iOS builds require macOS and Xcode.

## Supabase project setup
1. Go to https://supabase.com/dashboard and sign in.
2. Create an organization if needed, then choose **New project**.
3. Name it `petcare`, select a database password and choose a suitable region.
4. Wait until the project is provisioned.
5. In the dashboard's **Connect** panel or **Project Settings → API Keys**, copy the Project URL
   and the **publishable** key.
6. Never put a `service_role`/secret key in a Flutter app, repository, screenshot, or `env.json`.
7. Keep the database empty for now. Phase 4 will add migration files and RLS policies before
   connecting any real pet data.

`env.example.json` is a template. When backend integration is introduced, copy it to `env.json`,
fill in the real URL and publishable key, and keep `env.json` ignored by Git. Use:
`flutter run --dart-define-from-file=env.json`

No Supabase SDK or connection is included in Phase 1 yet; this is deliberate. No real project
credentials were provided, and the Phase 1 UI is local-only.

## Alarm and location roadmap
Phase 1 does not request location permissions or schedule notifications. Phase 3 will add
`flutter_local_notifications`, timezone-aware recurrence and snooze. Phase 5 will add
permission-on-action GPS, manual city/postcode search, verified clinic repository, and native
map handoff. The app will show a clear empty/setup state rather than invent clinics.

## Verification status
Flutter commands were not run in the source-generation environment. Do not consider Phase 1
complete until `flutter pub get`, `flutter analyze`, and `flutter test` have been run in a real
Flutter environment and any reported issues are fixed.
