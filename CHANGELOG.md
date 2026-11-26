# Changelog

## v2.2.0 — 2026-11-26

- **新增多版本支持**：1.20.1 / 1.21.1 / 1.21.3 / 1.21.11 / 26.3 / 26.4-pre-1；`dist/` 下每版本一个 zip，GitHub Release v2.2.0 附带全部版本。
- **各版本维度类型**：从该版本官方 vanilla overworld `dimension_type` 模板生成（只改 `height/min_y/logical_height` 为 4064/-2032/4064），保证字段 schema 正确：
  - 1.20.1 / 1.21.1 / 1.21.3：旧格式（1.20.1 的 `monster_spawn_light_level` 是旧 uniform 包法）；
  - 1.21.11：新 `attributes`/`timelines` 格式；
  - 26.3 / 26.4-pre-1：新格式 + 26.x 必填字段（如 `has_ender_dragon_fight`）。
- **1.20.1**：函数标签路径改为复数 `tags/functions/`（构建时自动处理）。
- **构建系统**：`versions.json` + `build.py` 多版本构建；`overrides/<版本>/` 放各版本 dimension_type；确定性 zip + `SHA256SUMS.txt`；GitHub Actions 更新。
- 验证：6 个版本均用「预建 world/datapacks + `level-type=threebody_bigvoid:bigvoid`」新建世界通过（生成/平台/Spawn=(0,120,0)/虚空/高度上限 -2032..2031/普通世界守卫）。
- 世界高度上限在 1.18+ 各版本一致，因此各版本都是"高度拉满"。

## v2.0.0 — 2026-11-26

- 命名空间与仓库名 `santi_bigvoid` → **`threebody_bigvoid`**；维度类型/世界预设/函数/lang key 同步更新。
- 世界预设 ID：`threebody_bigvoid:bigvoid`；维度类型 ID：`threebody_bigvoid:void_overworld`。
- 拆分为**独立仓库**（与引力数据包分开维护）。
- 保留 v1 的世界参数：高度 4064 满上限、纯虚空、出生点 (0,120,0) + 5×5 玻璃平台、高度守卫。
- 新增可选资源包（世界类型中文显示名）源码与构建产物。

## v1.0.0 — 2026-11-25（初版，命名空间 `santi_bigvoid`）

- 超高虚空世界预设（MC 1.21.3）：min_y=-2032 / height=4064 / 纯虚空 / 出生平台。
