# TuringRiff-bucket

[![CI Tests](https://github.com/TuringRiff/TuringRiff-bucket/actions/workflows/ci.yml/badge.svg)](https://github.com/TuringRiff/TuringRiff-bucket/actions/workflows/ci.yml)
[![Excavator](https://github.com/TuringRiff/TuringRiff-bucket/actions/workflows/excavator.yml/badge.svg)](https://github.com/TuringRiff/TuringRiff-bucket/actions/workflows/excavator.yml)

A personal [Scoop](https://scoop.sh) bucket for custom or hard-to-find Windows applications and tools.

[中文说明](README-zh.md)

## Available Apps

| App | Description | Homepage |
|:----|:-----------|:---------|
| [pilinara](bucket/pilinara.json) | Flutter BiliBili desktop client forked from PiliPlus, with offline cache support | [GitHub](https://github.com/Starfallan/PiliNara) |

## Usage

To use this bucket, you must have [Scoop](https://scoop.sh) installed.

### Add the bucket

```powershell
scoop bucket add TuringRiff-bucket https://github.com/TuringRiff/TuringRiff-bucket.git
```

### Install an application

```powershell
scoop install TuringRiff-bucket/<app-name>
```

## Contributing

Contributions are welcome! Please submit a Pull Request if you'd like to add or update an application manifest.

## License

This project is released into the public domain under the [Unlicense](LICENSE).
