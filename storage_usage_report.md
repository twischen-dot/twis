# 硬盘使用情况报告

- 生成时间：2025-12-02 星期二 CST
- 系统：macOS（APFS 文件系统，SSD）

## 存储摘要
- 物理硬盘：APPLE SSD AP0256Z（约 256 GB）
- APFS 容器总容量：约 245.11 GB
- 可用空间：约 118.5 GB
- 估算已用空间：约 126.6 GB

来源：
- `diskutil info /` 与 `system_profiler SPStorageDataType` 显示容器容量与可用空间。
- `df -h` 显示数据卷 `/System/Volumes/Data` 使用约 91 GiB、可用约 110 GiB；系统只读卷 `/` 使用约 11.3 GiB。

## 卷与挂载点
- 系统卷：`Macintosh HD`（挂载点 `/`，只读快照）
- 数据卷：`Data`（挂载点 `/System/Volumes/Data`，可写）
- 其他系统卷：`Preboot`、`VM`、`Update` 等（占用很小）
- 临时挂载：`/Volumes/ChatWise`（磁盘映像，容量约 59.8 MB）

## 用户目录占用（Top 项）
- `~/Library`：约 19 GB
- `~/Downloads`：约 9.2 GB
- `~/Movies`：约 4.9 GB
- `~/claudia`：约 2.1 GB
- `~/Documents`：约 1.9 GB
- `~/Projects`：约 861 MB

数据来源：`du -sh ~/*` 采样。

## 清理建议
- 优先清理 `~/Library`（缓存与应用数据）、`~/Downloads`、`~/Movies` 等体积较大目录。
- 检查不再使用的大文件或临时文件；必要时迁移至外接存储或云盘。
- 如需详细到子目录级别的清单，可继续按体积从大到小列出并逐项处理。
