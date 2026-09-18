# 模擬第 4 次：T 百分比

使用者需求（模擬）：也加上 T%，讓四種鹼基的資訊更完整。

## 程式與結果如何改變

- 前一版本：[2f8622f](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/2f8622f372b43f7dc67f8657381690109c1d0047)。
- 程式：`analysis/calculate_gc.R` 新增 `t_percent` 欄位。
- 計算規則：T / 序列長度 × 100，取兩位小數。
- 驗證：六條序列的新欄位與獨立 Python 計算一致；全部既有欄位與列順序不變。
- 本報告與程式、CSV 在同一筆 commit；在 GitHub 點 History 可找到對應版本。

| 序列 | 修改前 | 修改後：t_percent |
|---|---|---|
| genome_001 | 無此欄位 | 23.86 |
| genome_002 | 無此欄位 | 23.86 |
| genome_003 | 無此欄位 | 25 |
| genome_004 | 無此欄位 | 23.86 |
| genome_005 | 無此欄位 | 22.47 |
| genome_006 | 無此欄位 | 24.72 |

## 本機與 GitHub 更新

本機：修改 R 程式與小型結果，建立 `runs/007_t_percent/` 保存修改前後結果、程式與輸入快照、中間表、R 物件、環境、日誌與驗證摘要。

GitHub：push 後收到本次 commit 的程式、最新小型結果、報告、[檔案索引](007_t_percent_files.csv)與首頁紀錄；不接收 `runs/` 中間檔。

输入 SHA-256：`89ceb887f1a5c742c5a3c77e0d08f62d55cd834c88e60c2b79eb178f08cfab44`。
程式 SHA-256：`56bf30942cf2bd45649b13de2f8303a521bfac71db25815efb802204b9033686`。

## 重跑

要重現這次版本，先在獨立 checkout/worktree 取出包含本報告的 commit（直接使用最新程式會含後續功能），再於專案根目錄執行：

```bash
mkdir -p runs/007_t_percent_repeat
Rscript analysis/calculate_gc.R runs/007_t_percent_repeat > runs/007_t_percent_repeat/run.log 2>&1
```

本機原始快照亦保存該版程式、輸入與 R 環境資訊。這些是虛構短序列的描述統計，不作生物學推論。
