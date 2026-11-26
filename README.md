# Threebody Big Void 超高虚空世界数据包

> Minecraft Java 数据包（多版本支持）：**1.20.1 / 1.21.1 / 1.21.3 / 1.21.11 / 26.3 / 26.4-pre-1**
> 在创建世界时提供一个**纯虚空 + 世界高度拉满**的世界预设。
>
> 版本：**v2.2.0**

- 世界预设 ID：`threebody_bigvoid:bigvoid`
- 主世界：**纯虚空**（flat 生成器 + 空层，生物群系 `the_void`，不生成结构/植被）
- 世界高度：`min_y = -2032`、`height = 4064`、`logical_height = 4064` —— **游戏的最大可能高度**（1.18+ 各版本上限一致；方块可放 y = -2032 ~ 2031）
- 下界 / 末地：保持原版
- 出生点保护：进世界时自动把世界出生点设到 **(0, 120, 0)**，并在 (0,119,0) 周围铺一个 **5×5 玻璃小平台**，不会出生就掉进虚空
- 带高度守卫：**把本包启用在一个普通高度的世界里不会有任何改动**（不会改出生点、不会放平台）
- 世界类型列表里的显示名默认是原始 key `generator.threebody_bigvoid.bigvoid`；附带**可选资源包**可显示为「三体·超高虚空世界 (4064高)」

---

## 支持的 Minecraft 版本（下载哪个包）

各版本差异只在数据包元数据与维度类型（dimension_type）的字段格式；玩法/世界参数完全一致。请下载与你游戏版本对应的 zip：

| Minecraft 版本 | 文件（`dist/`） | 数据包格式 | 备注 |
|---|---|---|---|
| 1.20.1 | `threebody-bigvoid-1.20.1.zip` | `pack_format: 15` | 旧目录结构、旧维度类型格式 |
| 1.21.1 | `threebody-bigvoid-1.21.1.zip` | `pack_format: 48` | |
| 1.21.3 | `threebody-bigvoid-1.21.3.zip` | `pack_format: 57` | |
| 1.21.11 | `threebody-bigvoid-1.21.11.zip` | `min_format/max_format: 94` | 新版维度类型（attributes/timelines） |
| 26.3 | `threebody-bigvoid-26.3.zip` | `min_format/max_format: 121` | 新版维度类型 + 26.x 字段 |
| 26.4-pre-1 | `threebody-bigvoid-26.4-pre-1.zip` | `min_format/max_format: 128` | 快照版 |

> 也可在 GitHub **Releases**（`v2.2.0`）按版本下载；`dist/SHA256SUMS.txt` 是对应校验和。
> 世界高度上限 1.18+ 各版本一致（-2032 ~ 2031），因此所有版本的 bigvoid 都是"高度拉满"。

---

## 安装 / 创建这个世界

> 需要 Minecraft Java（按上表选对应版本）。

### 单人客户端（新建世界）

1. 把与你版本对应的 `dist/threebody-bigvoid-<版本>.zip` 放进游戏目录的 `datapacks` 文件夹（没有就新建）：
   - Windows：`%APPDATA%\.minecraft\datapacks\`
   - 本机示例：`F:\MC-environment\.minecraft\versions\1.21.3-Fabric\datapacks\`
   - 也可以不放进文件夹，直接在第 2 步把 zip **拖进**创建界面。
2. 进入游戏 →「创建新世界」→ **「更多 / More」** → **「数据包 / Data Packs」** → 把 `threebody-bigvoid` 启用到右栏 → 完成。
3. 回到「世界 / World」标签 → 点 **「世界类型 / World Type」** 按钮循环选择，找到我们的预设：
   - 未装可选资源包时显示原始 id：`generator.threebody_bigvoid.bigvoid`
   - 装了可选资源包后显示：`三体·超高虚空世界 (4064高)`
4. 建议把**游戏模式选为创造**，其它默认即可，点「创建新世界」。
5. 进世界后你会站在 (0, 120, 0) 的 5×5 玻璃小平台上，四周纯虚空。按 `F3` 可以看到高度范围极大；飞到 y 2000 附近也完全没问题。

> 关键点：**「世界类型」必须点一下并选中这个预设**，否则会生成默认世界。

### 服务器

1. 第一次启动前，先在服务器目录里建好 `world/datapacks/`，把数据包放进去（zip 或文件夹均可）。
2. `server.properties`：
   ```properties
   level-name=world
   level-type=threebody_bigvoid:bigvoid
   ```
   （自定义命名空间不能省略，要写全。）
3. 启动服务器（会新建世界）。日志里应能看到 `Found new data pack file/...loading it automatically`，世界生成完成后出生点即为 (0,120,0)。
4. 进服后可用 `/function threebody_bigvoid:help` 查看信息。

### 可选：世界类型中文显示名资源包

`optional/name-resourcepack/`（构建后为 `dist/threebody-bigvoid-name-resourcepack.zip`）是一个**可选资源包**，只修改「世界类型」列表里的显示名，不影响玩法。把它放进 `resourcepacks` 文件夹并在「资源包」界面启用即可。

---

## 重要注意事项

- **这个世界依赖这个数据包**：世界的 `level.dat` 里记录的是自定义维度类型 `threebody_bigvoid:void_overworld`。**不要删除/改名数据包文件**，否则该存档可能无法正常加载（普通世界不受影响）。玩之前建议先备份存档。
- 数据包会**每次世界加载时**把世界出生点设回 (0,120,0) 并补玻璃平台；用床设置的重生点仍然优先生效。
- 不想要玻璃平台：`/fill 0 119 0 4 119 4 minecraft:air`（下次重进世界会再出现，这是防摔保护）。想要更大安全落点可以自己 `/fill`。
- 虚空里掉下去会死（创造模式立刻按两下空格起飞；也可以 `/tp 0 200 0`）。服务器建议创造/旁观，或 `gamemode=creative`。
- **只对新建世界生效**：把数据包塞进已有世界的 `datapacks` 不会把已有世界变成虚空/拉高高度（本包没有覆盖原版维度类型，这是故意的，避免搞坏老存档）。
- 世界高度上限同样适用于方块（可放 y=-2032~2031）；展示实体/其它实体可以待在更靠上的位置（1.21.3 实体 y 允许到 ±2e7 级别）。
- 卸载：从世界 `datapacks` 删除本包前请先备份；删掉后世界可能因缺少自定义维度类型而无法加载。

---

## 与本项目其它数据包配合

- 三体引力模拟数据包（单独仓库 `threebody`）：新建这个世界时把两个包**都在「数据包」页启用**，进入世界后：
  ```
  /function threebody:add_red
  /function threebody:add_blue
  /function threebody:add_green
  ```
  就能在超大尺度的虚空里看三体运动。已有虚空世界加装引力包：把 `threebody.zip` 放进 `saves/<世界>/datapacks/`，游戏内 `/reload`。

---

## 从源码构建

仓库支持**多版本构建**：共用一套世界预设/函数/标签，`build.py` 按 `versions.json` 为各版本生成正确的 `pack.mcmeta` 与 `dimension_type`（1.20.1/1.21.1/1.21.3 旧格式；1.21.11/26.x 新 attributes 格式；26.x 含必填字段），并处理 1.20.1 的复数目录。

```bash
python3 build.py                       # 构建全部版本 -> dist/
python3 build.py --only 26.4-pre-1     # 只构建一个版本
python3 build.py --list                # 列出可构建版本
```

- 需要 **Python 3**（Windows 用 `python build.py`）。`build.sh` / `build.ps1` 是包装脚本。
- 构建产物：`dist/threebody-bigvoid-<版本>.zip` + `dist/SHA256SUMS.txt`。
- `overrides/<版本>/` 存放按版本生成的 `dimension_type/void_overworld.json`（都是从该版本官方 vanilla overworld 模板复制后只改高度字段，保证字段 schema 正确）。
- 修改 `data/` 下的公共内容（world preset、load/help 函数、标签）后重新构建即可对所有版本生效。

---

## 目录结构

```
threebody-bigvoid/                       ← git 仓库根
├─ pack.mcmeta                           ← 默认（1.21.3）源码元数据，构建时按版本重写
├─ data/minecraft/tags/function/load.json
├─ data/minecraft/tags/worldgen/world_preset/normal.json
├─ data/threebody_bigvoid/
│  ├─ dimension_type/void_overworld.json  ← 默认（旧格式）；各版本覆盖在 overrides/
│  ├─ worldgen/world_preset/bigvoid.json  ← 纯虚空主世界 + 原版下界/末地
│  └─ function/{load,help}.mcfunction
├─ overrides/<版本>/data/.../dimension_type/void_overworld.json  ← 1.20.1/1.21.11/26.x 专用维度类型
├─ versions.json                         ← 版本 → pack 元数据/布局 的构建矩阵
├─ build.py / build.sh / build.ps1
├─ optional/name-resourcepack/           ← 可选：世界类型中文显示名（资源包，1.21.3 格式；其它版本需改 pack.mcmeta）
├─ dist/                                 ← 各版本 zip + SHA256SUMS
├─ README.md
└─ CHANGELOG.md
```

---

## 常见问题

**Q：「世界类型」列表里没有这个预设？**
确认创建界面的「数据包」页已经启用本包（在右栏）；本包通过 `data/minecraft/tags/worldgen/world_preset/normal.json` 把自己加进列表。如果还是看不到，检查游戏版本与数据包版本是否对应（见上表）。

**Q：列表里显示的是 `generator.threebody_bigvoid.bigvoid`？**
正常，那是没装可选资源包时的原始翻译 key，功能相同。可选资源包只改显示名（1.21.3 格式，其它版本可自行改资源包 pack.mcmeta）。

**Q：出生在虚空里一直下坠？**
正常流程会在你进世界前设好出生点 (0,120,0) 和玻璃平台。万一没有（例如手动改过出生点），修复：
```
/tp 0 120 0
/setworldspawn 0 120 0
/fill 0 119 0 4 119 4 minecraft:glass
```

**Q：能用在别的版本吗？**
支持列表见上表。其它 1.21.x/26.x 中间版本未逐一测试，通常可用对应世代的构建，但请自行验证。

**Q：能在已有世界把高度拉高吗？**
本包设计为"新建世界时选择"，不对已有世界生效（避免数据风险）。

---

## 版本历史

见 [CHANGELOG.md](CHANGELOG.md)。

## 相关项目

- 本仓库（超高虚空世界生成数据包）：[MJIFmc/mc-bigvoid-datapack](https://github.com/MJIFmc/mc-bigvoid-datapack)
- 三体引力模拟数据包（单独仓库）：[MJIFmc/threebody-mc-datapack](https://github.com/MJIFmc/threebody-mc-datapack)

## License

本项目采用 **MIT License**，见 [LICENSE](LICENSE)（Copyright (c) 2026 MJIFmc）。
