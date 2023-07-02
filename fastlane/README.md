fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios build_and_run_ui_test

```sh
[bundle exec] fastlane ios build_and_run_ui_test
```

Run UI tests

### ios build_and_run_ui_test_in_parallel

```sh
[bundle exec] fastlane ios build_and_run_ui_test_in_parallel
```

Run UI tests in parallel

### ios build_for_testing

```sh
[bundle exec] fastlane ios ui_tests
```

Create xctestrun file

### ios ui_test_shard

```sh
[bundle exec] fastlane ios ui_test_shard
```

Run sliced UI test plan

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
