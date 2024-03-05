# Snort3 Community Rules - Mirror

Community Rules are released on Snort's [website](https://www.snort.org/downloads/#rule-downloads), but the `.tar.gz` file is not versioned, so if a new version is released the hash will no longer match with the expected value. This also makes it impossible to pin a specific version.

This repository simply hosts a copy of that file's archived contents at a specific point in time, so that the aforementioned problems can be overcome.

For maintenance: script `update.sh` can be used in the repository's root directory to re-download the rules from the Snort website. Script `release.sh` commits and tags the result.
