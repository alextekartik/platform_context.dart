#!/bin/bash

# Fast fail the script on failures.
set -e

dartanalyzer --fatal-warnings \
  lib/context_browser.dart \
  lib/context_io.dart

pub run test -p vm
pub run test -p firefox,chrome