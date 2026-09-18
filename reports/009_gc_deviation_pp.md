# 模擬第 6 次：GC 與 50% 的差距

使用者需求（模擬）：請標出 GC% 比 50% 高或低多少。

## 程式與結果如何改變

- 前一版本：[0dbb20a](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/0dbb20a7f5676522072cdae84398a51b730d3f05)。
- 程式：`analysis/calculate_gc.R` 新增 `gc_deviation_pp` 欄位。
- 計算規則：GC% − 50，單位是百分點；50% 只是示範比較基準。
- 驗證：六條序列的新欄位與獨立 Python 計算一致；全部既有欄位與列順序不變。
- 本報告與程式、CSV 在同一筆 commit；在 GitHub 點 History 可找到對應版本。

| 序列 | 修改前 | 修改後：gc_deviation_pp |
|---|---|---|
| genome_001 | 無此欄位 | 0 |
| genome_002 | 無此欄位 | 0 |
| genome_003 | 無此欄位 | -1.14 |
| genome_004 | 無此欄位 | 0 |
| genome_005 | 無此欄位 | 0.56 |
| genome_006 | 無此欄位 | -0.56 |

## 本機與 GitHub 更新

本機：修改 R 程式與小型結果，建立 `runs/009_gc_deviation_pp/` 保存修改前後結果、程式與輸入快照、中間表、R 物件、環境、日誌與驗證摘要。

GitHub：push 後收到本次 commit 的程式、最新小型結果、報告、[檔案索引](009_gc_deviation_pp_files.csv)與首頁紀錄；不接收 `runs/` 中間檔。

输入 SHA-256：`89ceb887f1a5c742c5a3c77e0d08f62d55cd834c88e60c2b79eb178f08cfab44`。
程式 SHA-256：`ef48d7fb9850d24e3fe7a77f7cc02d8e62e0b65666cf2cff28b032ba62b0ccad`。

## 重跑

要重現這次版本，先在獨立 checkout/worktree 取出包含本報告的 commit（直接使用最新程式會含後續功能），再於專案根目錄執行：

```bash
mkdir -p runs/009_gc_deviation_pp_repeat
Rscript analysis/calculate_gc.R runs/009_gc_deviation_pp_repeat > runs/009_gc_deviation_pp_repeat/run.log 2>&1
```

本機原始快照亦保存該版程式、輸入與 R 環境資訊。這些是虛構短序列的描述統計，不作生物學推論。
