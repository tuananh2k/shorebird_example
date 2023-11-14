import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

final _shorebirdCodePush = ShorebirdCodePush();

@RoutePage(name: 'ExampleScreen')
class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  final _isShorebirdAvailable = _shorebirdCodePush.isShorebirdAvailable();
  int? _currentPatchVersion;
  bool _isCheckingForUpdate = false;

  /// sẽ có các case cần phải check:
  /// - thay đổi logic/UI (new patch)
  /// - thay đổi thư viện (new release)
  /// - thay đổi quyền truy cập của android/ios (new release)
  /// - thay đổi cấu hình của android/android manifest (new release)

  @override
  void initState() {
    super.initState();
    // Request the current patch number.
    _shorebirdCodePush.currentPatchNumber().then((currentPatchVersion) {
      if (!mounted) return;
      setState(() {
        _currentPatchVersion = currentPatchVersion;
      });
    });
  }

  Future<void> _checkForUpdate() async {
    setState(() {
      _isCheckingForUpdate = true;
    });

    // Ask the Shorebird servers if there is a new patch available.
    final isUpdateAvailable =
        await _shorebirdCodePush.isNewPatchAvailableForDownload();

    if (!mounted) return;

    setState(() {
      _isCheckingForUpdate = false;
    });

    if (isUpdateAvailable) {
      _showUpdateAvailableBanner();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No update available'),
        ),
      );
    }
  }

  void _showDownloadingBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      const MaterialBanner(
        content: Text('Downloading...'),
        actions: [
          SizedBox(
            height: 14,
            width: 14,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ],
      ),
    );
  }

  void _showUpdateAvailableBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text('Update available'),
        actions: [
          TextButton(
            onPressed: () async {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              await _downloadUpdate();

              if (!mounted) return;
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('Download'),
          ),
        ],
      ),
    );
  }

  void _showRestartBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      const MaterialBanner(
        content: Text('A new patch is ready!'),
        actions: [
          TextButton(
            // Restart the app for the new patch to take effect.
            onPressed: Restart.restartApp,
            child: Text('Restart app'),
          ),
        ],
      ),
    );
  }

  Future<void> _downloadUpdate() async {
    _showDownloadingBanner();

    await Future.wait([
      _shorebirdCodePush.downloadUpdateIfAvailable(),
      // Add an artificial delay so the banner has enough time to animate in.
      Future<void>.delayed(const Duration(milliseconds: 250)),
    ]);

    if (!mounted) return;

    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    _showRestartBanner();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final heading = _currentPatchVersion != null
        ? '$_currentPatchVersion'
        : 'No patch installed';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('Shorebird with Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Hế lô patch mới nè'),
            const Text('Current patch version:'),
            Text(
              heading,
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            if (!_isShorebirdAvailable)
              Text(
                'Shorebird Engine not available.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            if (_isShorebirdAvailable)
              ElevatedButton(
                onPressed: _isCheckingForUpdate ? null : _checkForUpdate,
                child: _isCheckingForUpdate
                    ? const _LoadingIndicator()
                    : const Text('Check for update'),
              ),
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "This is Center Short Toast",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: const Text('Show toast'),
            ),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  PlatformFile file = result.files.first;

                  print(file.name);
                  print(file.bytes);
                  print(file.size);
                  print(file.extension);
                  print(file.path);
                }
              },
              child: const Text('Pick file'),
            )
          ],
        ),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 14,
      width: 14,
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }
}
