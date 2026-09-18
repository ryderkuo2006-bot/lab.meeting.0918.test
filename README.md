# Lab meeting 分析示範

以六條虛構短 DNA 序列，示範分析程式的修改、結果比較與 Git 版本紀錄。

## 分析紀錄

| 次數 | 使用者需求／改動 | 結果摘要 | 詳細紀錄 |
|---|---|---|---|
| 003 | 在 GC% / AT% 分析加入 G、C 計數與 GC skew | 原百分比不變；genome_004 的 G/C 差異最大 | [報告與結果比較](reports/003_gc_skew.md) |
| 004 | A 鹼基計數 | 新增 `a_count`；既有結果不變 | [報告](reports/004_a_count.md) |
| 005 | T 鹼基計數 | 新增 `t_count`；既有結果不變 | [報告](reports/005_t_count.md) |
| 006 | A 百分比 | 新增 `a_percent`；既有結果不變 | [報告](reports/006_a_percent.md) |
| 007 | T 百分比 | 新增 `t_percent`；既有結果不變 | [報告](reports/007_t_percent.md) |
| 008 | A/T 平衡 | 新增 `at_skew`；既有結果不變 | [報告](reports/008_at_skew.md) |
| 009 | GC 與 50% 的差距 | 新增 `gc_deviation_pp`；既有結果不變 | [報告](reports/009_gc_deviation_pp.md) |
| 010 | 序列長度排名 | 新增 `length_rank`；既有結果不變 | [報告](reports/010_length_rank.md) |
| 011 | GC 含量排名 | 新增 `gc_rank`；既有結果不變 | [報告](reports/011_gc_rank.md) |

001、002 對應先前的 GC% 與 AT% 開發；當時未建立此格式的報告，可在 Git 歷史查看。

## 檔案位置

- [分析程式與操作說明](analysis/README.md)
- [最新小型結果](analysis/results/gc_content.csv)
- [原始合成資料說明](synthetic_genome_dataset/README.md)
- [本機中間檔索引](reports/003_local_files.csv)：只上傳用途、大小與校驗值。
- `runs/`：中間資料與執行快照，僅留在本機，不上傳。

每次分析採用「程式＋簡短報告＋小型結果＋本機檔案索引」一起 commit、push。
在 GitHub 點進 commit，可同時比較程式和結果的變化。
新增分析時使用新的 run 名稱及報告檔，並在上表新增一列。

[十次使用者改動模擬總覽](reports/simulation_10.md)
