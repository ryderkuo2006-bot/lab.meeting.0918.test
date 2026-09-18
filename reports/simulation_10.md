# 十次使用者改動模擬

這是實際修改、執行與驗證的示範；每列各有一筆獨立 commit。
沿用同一份六條合成序列，每次增加一项功能，保留先前欄位；所有既有結果逐次比對不變。

| 次數 | 模擬使用者需求 | 新增結果欄位 | 程式與結果差異 | 本機中間檔 |
|---|---|---|---|---|
| 1 | 請把 A 的數量單獨列出來。 | `a_count` | [報告](004_a_count.md) | `runs/004_a_count/` |
| 2 | 也加上 T 的數量，方便比較 A 和 T。 | `t_count` | [報告](005_t_count.md) | `runs/005_t_count/` |
| 3 | 不同長度不好比較，請加上 A%。 | `a_percent` | [報告](006_a_percent.md) | `runs/006_a_percent/` |
| 4 | 也加上 T%，讓四種鹼基的資訊更完整。 | `t_percent` | [報告](007_t_percent.md) | `runs/007_t_percent/` |
| 5 | 我也想知道 A 和 T 是否平衡，像 G/C 那樣比較。 | `at_skew` | [報告](008_at_skew.md) | `runs/008_at_skew/` |

## 更新順序

1. 改檔案、執行：本機程式與結果改變，GitHub 還不變。
2. commit：本機多一個可回溯版本，GitHub 還不變。
3. push：GitHub 收到尚未上傳的 commits，網頁顯示最新版及逐次歷史。

本次示範先在本機完成十次 commit，再一次 push，GitHub 仍保留十筆獨立版本。
也可以每做一次 commit 就 push，讓其他人立即看見進度。

## 哪些會上傳

- `analysis/calculate_gc.R`：累積十次修改的程式；舊版從每筆 commit 查看。
- `analysis/results/gc_content.csv`：最新小型結果；每次的新增欄位可在 commit 差異查看。
- `reports/`：十份獨立報告及各次中間檔索引，不包含中間檔內容。
- `README.md`：首頁分析紀錄與連結。
- `runs/`：本機保存十組中間檔，由 `.gitignore` 排除，上傳數量為零。

## 如何查看指定版本

在專案首頁點 Commits，選擇「模擬 01」至「模擬 10」的 commit。
點程式或結果檔看增刪差異；使用該 commit 的 Browse files 查看當時完整檔案。
每份報告也附上一版本連結、輸入與程式 SHA-256，以及六筆新增結果。

這次故意一次只加一項功能，方便教學；實務上可把同一個完整需求的變更整理成一筆 commit。
