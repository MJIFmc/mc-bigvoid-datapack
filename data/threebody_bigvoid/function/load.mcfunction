# ============================================================
# Threebody Big Void - 初始化(仅对「超高世界」生效, 普通世界启用本包不会改动任何东西)
# 高度探测: 主世界 y=2000 处若是空气, 说明这是高度 4064 的超高世界
# ============================================================
execute positioned 0 2000 0 if block ~ ~ ~ minecraft:air run setworldspawn 0 120 0
execute positioned 0 2000 0 if block ~ ~ ~ minecraft:air run fill 0 119 0 4 119 4 minecraft:glass
