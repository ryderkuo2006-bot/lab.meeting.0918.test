# 003：比較 G 與 C 是否平衡

## 模擬使用者需求

「GC% 接近，是否代表 G 和 C 一樣多？請加上 G、C 各自的數量與 GC skew，保留舊結果做比較，中間檔不要上傳。」

## 版本與程式改動

- 基準版本：[8860aeb](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/8860aeb3e9c368f4b4f2650dfcd1344aea074207)（已有 GC% 與 AT%）。
- 本報告、修改後程式與小型結果一同提交；在本報告的 History 點進本次 commit 可查看完整差異。
- `analysis/calculate_gc.R` 新增 `g_count`、`c_count`、`gc_skew` 三個欄位。
- GC skew = (G − C) / (G + C)，不是百分比；G + C 為零時回傳 NA。
- 加入可選的本機 run 資料夾，保存中間表、R 物件、執行環境與結果快照。

## 修改前後結果

輸入為同一份 `synthetic_genome_dataset/genomes.fasta`。舊版所有六個欄位逐筆比對均不變；新版增加最後三欄。

| 序列 | 原 GC% → 新 GC% | 原 AT% → 新 AT% | 新增 G 數 | 新增 C 數 | 新增 GC skew |
|---|---:|---:|---:|---:|---:|
| genome_001 | 50.00 → 50.00 | 50.00 → 50.00 | 22 | 22 | 0.0000 |
| genome_002 | 50.00 → 50.00 | 50.00 → 50.00 | 22 | 22 | 0.0000 |
| genome_003 | 48.86 → 48.86 | 51.14 → 51.14 | 22 | 21 | 0.0233 |
| genome_004 | 50.00 → 50.00 | 50.00 → 50.00 | 23 | 21 | 0.0455 |
| genome_005 | 50.56 → 50.56 | 49.44 → 49.44 | 23 | 22 | 0.0222 |
| genome_006 | 49.44 → 49.44 | 50.56 → 50.56 | 22 | 22 | 0.0000 |

結論：GC% 相同不代表 G、C 各自一樣多。例如 genome_001 與 genome_004 的 GC% 都是 50%，前者 G、C 各有 22 個，後者為 23 個 G、21 個 C。這裡只描述六條虛構短序列，不推論物種差異。

## 如何重跑

從專案根目錄執行，換用新資料夾避免覆蓋這次紀錄：

```bash
mkdir -p runs/003_gc_skew_repeat
Rscript analysis/calculate_gc.R runs/003_gc_skew_repeat > runs/003_gc_skew_repeat/run.log 2>&1
```

目前小型結果：[gc_content.csv](../analysis/results/gc_content.csv)。歷史結果可在對應 commit 查看。

## 中間檔在哪裡

本次資料夾為 `runs/003_gc_skew/`，由 `.gitignore` 排除，不上傳 GitHub。
[本機檔案索引](003_local_files.csv) 記錄各檔用途、大小與 SHA-256；索引不包含序列內容。
包括修改前後結果、解析後序列、R 物件、程式與輸入快照、環境資訊、執行紀錄和驗證摘要。
GitHub 不備份這些本機檔案；重要的本機紀錄需另行備份。

## 驗證

R 程式成功執行；以獨立 Python 計數確認六筆 G/C 數量及公式，並確認既有六個欄位完全不變。
