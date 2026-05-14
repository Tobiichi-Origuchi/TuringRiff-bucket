# TuringRiff-bucket

[![CI Tests](https://github.com/TuringRiff/TuringRiff-bucket/actions/workflows/ci.yml/badge.svg)](https://github.com/TuringRiff/TuringRiff-bucket/actions/workflows/ci.yml)
[![Excavator](https://github.com/TuringRiff/TuringRiff-bucket/actions/workflows/excavator.yml/badge.svg)](https://github.com/TuringRiff/TuringRiff-bucket/actions/workflows/excavator.yml)

这是个人的 [Scoop](https://scoop.sh) 软件仓库（Bucket），主要用于收录一些自定义的、或者在官方仓库中找不到的 Windows 应用程序和工具。

[English README](README.md)

## 已收录应用

| 应用 | 描述 | 主页 |
|:----|:----|:----|
| [pilinara](bucket/pilinara.json) | 基于 PiliPlus 的 BiliBili Flutter 第三方桌面客户端，支持离线缓存 | [GitHub](https://github.com/Starfallan/PiliNara) |

## 如何使用

在使用本仓库之前，请确保你已经安装了 [Scoop](https://scoop.sh)。

### 添加仓库

```powershell
scoop bucket add TuringRiff-bucket https://github.com/TuringRiff/TuringRiff-bucket.git
```

### 安装应用

```powershell
scoop install TuringRiff-bucket/<应用名称>
```

## 贡献指南

欢迎提交 Pull Request 来添加或更新应用配置 (Manifest)。

## 许可证

本项目基于 [Unlicense](LICENSE) 发布至公共领域。
