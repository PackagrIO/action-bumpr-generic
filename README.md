# action-bumpr-generic

<p align="center">
  <a href="https://github.com/PackagrIO/docs">
  <img width="300" alt="portfolio_view" src="https://github.com/PackagrIO/bumpr/raw/master/images/bumpr.png">
  </a>
</p>

Github Action that allows you to bump SemVer version for Generic repositories

# Documentation
Full documentation is available at [PackagrIO/docs](https://github.com/PackagrIO/docs)

# Usage

```yaml
name: Release
# This workflow is triggered manually
on:
  workflow_dispatch:
    inputs:
      version_bump_type:
        description: 'Version Bump Type (major, minor, patch)'
        required: true
        default: 'patch'
      version_metadata_path:
        description: 'Path to file containing Version string'
        required: true
        default: 'VERSION'
      generic_version_template:
        description: 'Go Template used for updating metadata file'
        required: true
        default: 'version := "%d.%d.%d"'
jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    container: golang:1.13
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Bump version
        id: bump_version
        uses: packagrio/action-bumpr-generic@master
        with:
          version_bump_type: ${{ github.event.inputs.version_bump_type }}
          version_metadata_path: ${{ github.event.inputs.version_metadata_path }}
          generic_version_template: ${{ github.event.inputs.generic_version_template }}
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

# Inputs

- `version_bump_type`
- `version_metadata_path`
- `generic_version_template`

# Outputs

- `release_version`
