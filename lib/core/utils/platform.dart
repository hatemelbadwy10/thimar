// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.




import 'dart:collection';
import 'dart:io';

/// Information about the environment in which the current program is running.
///
/// Platform provides information such as the operating system,
/// the hostname of the computer, the value of environment variables,
/// the path to the running program,
/// and other global properties of the program being run.
///
/// ## Get the URI of the current Dart script
///
/// Use the [script] getter to get the URI to the currently running
/// Dart script.
/// ```dart
/// import 'dart:io' show Platform;
///
/// void main() {
///   // Get the URI of the script being run.
///   var uri = Platform.script;
///   // Convert the URI to a path.
///   var path = uri.toFilePath();
/// }
/// ```
/// ## Get the value of an environment variable
///
/// The [environment] getter returns a the names and values of environment
/// variables in a [Map] that contains key-value pairs of strings. The Map is
/// unmodifiable. This sample shows how to get the value of the `PATH`
/// environment variable.
/// ```dart
/// import 'dart:io' show Platform;
///
/// void main() {
///   Map<String, String> envVars = Platform.environment;
///   print(envVars['PATH']);
/// }
/// ```
/// ## Determine the OS
///
/// You can get the name of the operating system as a string with the
/// [operatingSystem] getter. You can also use one of the static boolean
/// getters: [isMacOS], [isLinux], [isWindows], etc.
/// ```dart
/// import 'dart:io' show Platform;
///
/// void main() {
///   // Get the operating system as a string.
///   String os = Platform.operatingSystem;
///   // Or, use a predicate getter.
///   if (Platform.isMacOS) {
///     print('is a Mac');
///   } else {
///     print('is not a Mac');
///   }
/// }
/// ```
final class Platform {
  /// The number of individual execution units of the machine.
  static final numberOfProcessors = _Platform.numberOfProcessors;

  /// The path separator used by the operating system to separate
  /// components in file paths.
  @pragma("vm:platform-const")
  static final pathSeparator = _Platform.pathSeparator;

  /// A string representing the operating system or platform.
  ///
  /// Possible values include:
  ///   "android"
  ///   "fuchsia"
  ///   "ios"
  ///   "linux"
  ///   "macos"
  ///   "windows"
  ///
  /// Note that this list may change over time so platform-specific logic
  /// should be guarded by the appropriate boolean getter e.g. [isMacOS].
  @pragma("vm:platform-const")
  static final operatingSystem = _Platform.operatingSystem;

  /// A string representing the version of the operating system or platform.
  ///
  /// The format of this string will vary by operating system, platform and
  /// version and is not suitable for parsing. For example:
  ///   "Linux 5.11.0-1018-gcp #20~20.04.2-Ubuntu SMP Fri Sep 3 01:01:37 UTC 2021"
  ///   "Version 14.5 (Build 18E182)"
  ///   '"Windows 10 Pro" 10.0 (Build 19043)'
  static final operatingSystemVersion = _Platform.operatingSystemVersion;

  /// The local hostname for the system.
  ///
  /// For example:
  ///   "mycomputer.corp.example.com"
  ///   "mycomputer"
  ///
  /// Uses the platform
  /// [`gethostname`](https://pubs.opengroup.org/onlinepubs/9699919799/functions/gethostname.html)
  /// implementation.
  static final localHostname = _Platform.localHostname;

  /// The version of the current Dart runtime.
  ///
  /// The value is a [semantic versioning](http://semver.org)
  /// string representing the version of the current Dart runtime,
  /// possibly followed by whitespace and other version and
  /// build details.
  static final version = _Platform.version;

  /// Get the name of the current locale.
  ///
  /// The result usually consists of
  ///  - a language (e.g., "en"), or
  ///  - a language and country code (e.g. "en_US", "de_AT"), or
  ///  - a language, country code and character set (e.g. "en_US.UTF-8").
  ///
  /// On macOS and iOS, the locale is taken from CFLocaleGetIdentifier.
  ///
  /// On Linux and Fuchsia, the locale is taken from the "LANG" environment
  /// variable, which may be set to any value. For example:
  /// ```shell
  /// LANG=kitten dart myfile.dart  # localeName is "kitten"
  /// ```
  ///
  /// On Android, the value will not change while the application is running,
  /// even if the user adjusts their language settings.
  ///
  /// See https://en.wikipedia.org/wiki/Locale_(computer_software)
  static String get localeName => _Platform.localeName();

  /// Whether the operating system is a version of
  /// [Linux](https://en.wikipedia.org/wiki/Linux).
  ///
  /// This value is `false` if the operating system is a specialized
  /// version of Linux that identifies itself by a different name,
  /// for example Android (see [isAndroid]).
  @pragma("vm:platform-const")
  static final bool isLinux = (operatingSystem == "linux");

  /// Whether the operating system is a version of
  /// [macOS](https://en.wikipedia.org/wiki/MacOS).
  @pragma("vm:platform-const")
  static final bool isMacOS = (operatingSystem == "macos");

  /// Whether the operating system is a version of
  /// [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows).
  @pragma("vm:platform-const")
  static final bool isWindows = (operatingSystem == "windows");

  /// Whether the operating system is a version of
  /// [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29).
  @pragma("vm:platform-const")
  static final bool isAndroid = (operatingSystem == "android");

  /// Whether the operating system is a version of
  /// [iOS](https://en.wikipedia.org/wiki/IOS).
  @pragma("vm:platform-const")
  static final bool isIOS = (operatingSystem == "ios");

  /// Whether the operating system is a version of
  /// [Fuchsia](https://en.wikipedia.org/wiki/Google_Fuchsia).
  @pragma("vm:platform-const")
  static final bool isFuchsia = (operatingSystem == "fuchsia");

  /// The environment for this process as a map from string key to string value.
  ///
  /// The map is unmodifiable,
  /// and its content is retrieved from the operating system on its first use.
  ///
  /// Environment variables on Windows are case-insensitive,
  /// so on Windows the map is case-insensitive and will convert
  /// all keys to upper case.
  /// On other platforms, keys can be distinguished by case.
  static Map<String, String> get environment => _Platform.environment;

  /// The path of the executable used to run the script in this isolate.
  /// Usually `dart` when running on the Dart VM or the
  /// compiled script name (`script_name.exe`).
  ///
  /// The literal path used to identify the executable.
  /// This path might be relative or just be a name from which the executable
  /// was found by searching the system path.
  ///
  /// Use [resolvedExecutable] to get an absolute path to the executable.
  static String get executable => _Platform.executable;

  /// The path of the executable used to run the script in this
  /// isolate after it has been resolved by the OS.
  ///
  /// This is the absolute path, with all symlinks resolved, to the
  /// executable used to run the script.
  ///
  /// See [executable] for the unresolved version.
  static String get resolvedExecutable => _Platform.resolvedExecutable;

  /// The absolute URI of the script being run in this isolate.
  ///
  /// If the script argument on the command line is relative,
  /// it is resolved to an absolute URI before fetching the script, and
  /// that absolute URI is returned.
  ///
  /// URI resolution only does string manipulation on the script path, and this
  /// may be different from the file system's path resolution behavior. For
  /// example, a symbolic link immediately followed by '..' will not be
  /// looked up.
  ///
  /// If a compiled Dart script is being executed the URI to the compiled
  /// script is returned, for example, `file:///full/path/to/script_name.exe`.
  ///
  /// If running on the Dart VM the URI to the running Dart script is returned,
  /// for example, `file:///full/path/to/script_name.dart`.
  ///
  /// If the executable environment does not support [script],
  /// the URI is empty.
  static Uri get script => _Platform.script;

  /// The flags passed to the executable used to run the script in this isolate.
  ///
  /// These are the command-line flags to the executable that precedes
  /// the script name.
  /// Provides a new list every time the value is read.
  static List<String> get executableArguments => _Platform.executableArguments;

  /// The `--packages` flag passed to the executable used to run the script
  /// in this isolate.
  ///
  /// If present, it specifies a file describing how Dart packages are looked up.
  ///
  /// Is `null` if there is no `--packages` flag.
  static String? get packageConfig => _Platform.packageConfig;

  /// The current operating system's default line terminator.
  ///
  /// The default character sequence that the operating system
  /// uses to separate or terminate text lines.
  ///
  /// The line terminator is currently the single line-feed character,
  /// U+000A or `"\n"`, on all supported operating systems except Windows,
  /// which uses the carriage-return + line-feed sequence, U+000D U+000A or
  /// `"\r\n"`
  @pragma("vm:platform-const")
  static String get lineTerminator => isWindows ? '\r\n' : '\n';

  @Deprecated("Do not instantiate this class, it will become abstract in a "
      "future Dart version")
  Platform();
}

class _Platform {
  external static int _numberOfProcessors();
  external static String _pathSeparator();
  external static String _operatingSystem();
  external static _operatingSystemVersion();
  external static _localHostname();
  external static _executable();
  external static _resolvedExecutable();

  /// Retrieve the entries of the process environment.
  ///
  /// The result is an [Iterable] of strings, where each string represents
  /// an environment entry.
  ///
  /// Environment entries should be strings containing
  /// a non-empty name and a value separated by a '=' character.
  /// The name does not contain a '=' character,
  /// so the name is everything up to the first '=' character.
  /// Values are everything after the first '=' character.
  /// A value may contain further '=' characters, and it may be empty.
  ///
  /// Returns an [OSError] if retrieving the environment fails.
  external static _environment();
  external static List<String> _executableArguments();
  external static String? _packageConfig();
  external static String _version();
  external static String _localeName();
  external static Uri _script();

  static String executable = _executable();
  static String resolvedExecutable = _resolvedExecutable();
  static String? packageConfig = _packageConfig();

  @pragma("vm:entry-point")
  static String Function()? _localeClosure;
  static String localeName() {
    final result = (_localeClosure == null) ? _localeName() : _localeClosure!();
    if (result is OSError) {
      throw result;
    }
    return result;
  }

  // Cache the OS environment. This can be an OSError instance if
  // retrieving the environment failed.
  static var /*OSError?|Map<String,String>?*/ _environmentCache;

  static int get numberOfProcessors => _numberOfProcessors();
  static String get pathSeparator => _pathSeparator();
  static String get operatingSystem => _operatingSystem();
  static Uri get script => _script();

  static String? _cachedOSVersion;
  static String get operatingSystemVersion {
    if (_cachedOSVersion == null) {
      var result = _operatingSystemVersion();
      if (result is OSError) {
        throw result;
      }
      _cachedOSVersion = result;
    }
    return _cachedOSVersion!;
  }

  static String get localHostname {
    var result = _localHostname();
    if (result is OSError) {
      throw result;
    }
    return result;
  }

  static List<String> get executableArguments => _executableArguments();

  static Map<String, String> get environment {
    if (_environmentCache == null) {
      var env = _environment();
      if (env is Iterable<Object?>) {
        var result = Platform.isWindows
            ? new _CaseInsensitiveStringMap<String>()
            : new Map<String, String>();
        for (var environmentEntry in env) {
          if (environmentEntry == null) {
            continue;
          }
          // TODO(kallentu): [_environment()] emits Iterable<dynamic> which is
          // why the cast and check is needed. Every element is a String,
          // however, so refactor [_environment()] at some point to emit
          // Iterable<String>s instead.
          var text = environmentEntry as String;
          // The Strings returned by [_environment()] are expected to be
          // valid environment entries, but exceptions have been seen
          // (e.g., an entry of just '=' has been seen on OS/X).
          // Invalid entries (lines without a '=' or with an empty name)
          // are discarded.
          var equalsIndex = text.indexOf('=');
          if (equalsIndex > 0) {
            result[text.substring(0, equalsIndex)] =
                text.substring(equalsIndex + 1);
          }
        }
        _environmentCache = new UnmodifiableMapView<String, String>(result);
      } else {
        _environmentCache = env;
      }
    }

    if (_environmentCache is OSError) {
      throw _environmentCache;
    } else {
      return _environmentCache!;
    }
  }

  static String get version => _version();
}

// Environment variables are case-insensitive on Windows. In order
// to reflect that we use a case-insensitive string map on Windows.
class _CaseInsensitiveStringMap<V> extends MapBase<String, V> {
  final Map<String, V> _map = new Map<String, V>();

  bool containsKey(Object? key) =>
      key is String && _map.containsKey(key.toUpperCase());
  bool containsValue(Object? value) => _map.containsValue(value);
  V? operator [](Object? key) => key is String ? _map[key.toUpperCase()] : null;
  void operator []=(String key, V value) {
    _map[key.toUpperCase()] = value;
  }

  V putIfAbsent(String key, V ifAbsent()) {
    return _map.putIfAbsent(key.toUpperCase(), ifAbsent);
  }

  void addAll(Map<String, V> other) {
    other.forEach((key, value) => this[key.toUpperCase()] = value);
  }

  V? remove(Object? key) =>
      key is String ? _map.remove(key.toUpperCase()) : null;

  void clear() {
    _map.clear();
  }

  void forEach(void f(String key, V value)) {
    _map.forEach(f);
  }

  Iterable<String> get keys => _map.keys;
  Iterable<V> get values => _map.values;
  int get length => _map.length;
  bool get isEmpty => _map.isEmpty;
  bool get isNotEmpty => _map.isNotEmpty;

  Iterable<MapEntry<String, V>> get entries => _map.entries;

  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> transform(String key, V value)) =>
      _map.map(transform);

  V update(String key, V update(V value), {V ifAbsent()?}) =>
      _map.update(key.toUpperCase(), update, ifAbsent: ifAbsent);

  void updateAll(V update(String key, V value)) {
    _map.updateAll(update);
  }

  void removeWhere(bool test(String key, V value)) {
    _map.removeWhere(test);
  }

  String toString() => _map.toString();
}
