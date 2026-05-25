# AGENTS.md

## Project overview

This repository contains `qt_qml_extensions`, a Qt/QML extension library plus a small C++/Qt test application. The root `CMakeLists.txt` acts as a library entry point when included from another CMake project; it returns early unless this repository is the top-level project. As a top-level project it builds `qt_qml_extensions_testapp`.

Primary stack:

- Qt 6 / QML / Qt Quick / Qt Quick Controls 2.
- C++23 for the test app.
- CMake 3.16+ with helper macros from `mb.util`.

## Build commands

CI uses Qt 6.9.3 and builds Debug and RelWithDebInfo with GCC and Clang:

```sh
cmake -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_STANDARD=26
cmake --build build --config Debug
```

```sh
cmake -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_STANDARD=26
cmake --build build --config RelWithDebInfo
```

Android builds are driven by `cmake-android.sh`, but that script handles signing/deployment details. Do not modify or run it unless the task explicitly calls for Android packaging.

## Test commands

CI runs CTest from the build directory:

```sh
ctest -C Debug --output-on-failure
```

```sh
ctest -C RelWithDebInfo --output-on-failure
```

No `add_test` or `enable_testing` calls are currently present in the tracked CMake files, so CTest may report that no tests were found. Prefer adding focused tests or QML test coverage when changing behavior.

Prefer a freshly configured `build/` directory for verification. Ignored local build directories may be stale or may contain dependency test entries from `mb.util`; in this checkout `cmake-build-debug` has incomplete Ninja metadata and CTest dependency entries whose executables are marked `_NOT_BUILT`.

## Formatting and linting

- C++ formatting is defined by `.clang-format` with LLVM base style, 4-space indentation, no tabs, and a 120-column limit.
- `.githooks/pre-commit` calls `clangformat.sh`; in this working tree that script exists but is ignored by `.gitignore`, so do not assume it is available in every clone.
- No tracked `.clang-tidy`, pre-commit configuration, QML formatter, or QML lint command was found.
- Keep QML formatting consistent with existing files: imports first, blank line before the root item, 4-space indentation, local implementation objects named `impl` where that pattern is already used.

## Architecture and important directories

- `CMakeLists.txt`: top-level build definition and QML module file list. Add new QML files/resources here when they must be packaged into the app.
- `cmake_util/`: repository CMake helper integration; currently depends on `mb.util`.
- `colors_palette/`: color extension API, state palettes, and color test QML.
- `controls/`: custom control wrappers. `controls/minimal/` is the actively maintained style.
- `controls/_shared/impl/`: shared QML and JS helpers for controls.
- `fonts/`: font configuration and font test QML.
- `layout/`: scaling and spacing helpers.
- `core/`: small JavaScript helpers used from QML.
- `_shared/`: shared QML utilities.
- `testapp/`: demo/test application and C++ Qt entry point.
- `.github/workflows/build.yml`: CI build matrix. Treat release/deployment workflow changes as approval-only.

## Coding conventions

- Preserve existing QML public ids that are documented as required, especially `extColors`, `extFont`, `extFontMetrics`, `extScale`, `extSpacing`, and `extControlsCfg`.
- Custom controls in style directories generally use a trailing underscore, such as `Button_` and `TextField_`; keep that naming pattern.
- Prefer the maintained `controls/minimal/` style for new or repaired controls unless the task explicitly targets another style.
- When adding or renaming QML files used by the top-level app, update the `qt_add_qml_module` `QML_FILES` or `RESOURCES` list.
- Keep generated headers generated indirectly. Edit `testapp_build_config.hpp.in`, not build-tree outputs.
- Keep C++ includes and warning-suppression wrappers consistent with the existing Qt/C++ files.

## Testing expectations

- For QML/control behavior changes, update or add a small demo/test surface under the relevant feature directory or `testapp/gui/AppWindow.qml` so the behavior can be exercised.
- For C++ changes, build the top-level app and run CTest for the touched configuration when Qt and `mb.util` are available.
- If tests cannot be run because local Qt, `mb.util`, Android SDK, or signing material is unavailable, say that explicitly in the final response.

## Files and directories agents must not edit without explicit approval

- Secret or local environment files, including `*.user`, `CMakeUserPresets.json`, `.idea/`, `.vscode/`, and local build outputs.
- Build and generated output directories: `build*/`, `cmake-build-*/`, `bin*/`, `lib*/`, `out/`, `__*/`, `_build*/`, `.qt/`, `.rcc/`, `qmltypes/`, `meta_types/`, and `*_autogen/`.
- Vendored or fetched dependencies under build trees, especially `cmake-build-*/_deps/`.
- Android deployment/signing configuration in `cmake-android.sh`.
- CI release/deployment behavior in `.github/workflows/` unless the task explicitly asks for CI changes.
- Lockfiles or generated code if they are introduced later, unless the task explicitly requires updating them.

## Security and privacy constraints

- Do not add secrets, passwords, signing keys, tokens, or personal machine paths to tracked files.
- Treat Android signing inputs and deployment settings as sensitive.
- Do not configure broad MCP, shell, browser, database, GitHub, or filesystem access in this repository by default.
- If a task requires changing signing, deployment, credentials, or CI publishing behavior, explain the risk before editing.

## Review checklist before final response

- Confirm new QML files/resources are listed in `qt_add_qml_module` when needed.
- Confirm C++ changes match `.clang-format`.
- Run the relevant CMake build and CTest commands when the local environment supports them.
- Report commands that were not run and why.
- Call out any security-sensitive files touched or intentionally left unchanged.
