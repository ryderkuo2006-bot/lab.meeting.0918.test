# 模擬第 10 次：數量最多的鹼基

使用者需求（模擬）：最後告訴我每条序列哪種鹼基最多，同分請全部列出。

## 程式與結果如何改變

- 前一版本：[c098156](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/c098156ceb8fe5214dd330c88aa349a334c8f888)。
- 程式：`analysis/calculate_gc.R` 新增 `dominant_bases` 欄位。
- 計算規則：同分全部列出，以 A/C/G/T 順序用 / 連接。
- 驗證：六條序列的新欄位與獨立 Python 計算一致；全部既有欄位與列順序不變。
- 本報告與程式、CSV 在同一筆 commit；在 GitHub 點 History 可找到對應版本。

| 序列 | 修改前 | 修改後：dominant_bases |
|---|---|---|
| genome_001 | 無此欄位 | A |
| genome_002 | 無此欄位 | A |
| genome_003 | 無此欄位 | A |
| genome_004 | 無此欄位 | A/G |
| genome_005 | 無此欄位 | A |
| genome_006 | 無此欄位 | A |

## 本機與 GitHub 更新

本機：修改 R 程式與小型結果，建立 `runs/013_dominant_bases/` 保存修改前後結果、程式與輸入快照、中間表、R 物件、環境、日誌與驗證摘要。

GitHub：push 後收到本次 commit 的程式、最新小型結果、報告、[檔案索引](013_dominant_bases_files.csv)與首頁紀錄；不接收 `runs/` 中間檔。

输入 SHA-256：`89ceb887f1a5c742c5a3c77e0d08f62d55cd834c88e60c2b79eb178f08cfab44`。
程式 SHA-256：`4aa8d8c49845c57596d5d5198e07a886138a33bf39f7fea539a4876dbd6a68b3`。

## 重跑

要重現這次版本，先在獨立 checkout/worktree 取出包含本報告的 commit（直接使用最新程式會含後續功能），再於專案根目錄執行：

```bash
mkdir -p runs/013_dominant_bases_repeat
Rscript analysis/calculate_gc.R runs/013_dominant_bases_repeat > runs/013_dominant_bases_repeat/run.log 2>&1
```

本機原始快照亦保存該版程式、輸入與 R 環境資訊。這些是虛構短序列的描述統計，不作生物學推論。
