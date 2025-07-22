#!/bin/bash

set -e

# Simulate detection of legacy Windows version (for testing)
IMAGE_VERSION=$(ver) # This will output Windows version string

echo "Detected OS version: $IMAGE_VERSION"

DPL_VERSION=2.0.0

# Check if the OS is old (dummy logic – replace with actual detection if needed)
# For this test, we assume all current Windows runners are "legacy"
IS_LEGACY=true

if $IS_LEGACY && [[ "$DPL_VERSION" > "2.0.0" || "$DPL_VERSION" == "2.0.0" ]]; then
  echo ""
  echo "WARNING: Skipping deployment instructions. In this OS environment version, it is not possible to use DPL v2 by default due to compatibility issues between legacy system components and the modern Ruby version. Please use the older DPL v1 instead by modifying only this specific build job recipe to include \`dpl_version: 1.10.16\`, e.g.:"
  echo ""
  echo "- name: \"job name\""
  echo "  os: windows"
  echo "  deploy:"
  echo "    provider: # enter your provider details here"
  echo "    dpl_version: 1.10.16"
  echo ""
  exit 0
fi

echo "Proceeding with deployment..."
