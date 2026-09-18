# 分析程式

這個資料夾用來存放 lab meeting 的分析程式，例如 Python 腳本或 Jupyter Notebook。

- 輸入資料位於專案根目錄下的 `synthetic_genome_dataset/`。
- 分析程式存放在這個 `analysis/` 資料夾。
- 建議從專案根目錄執行程式，方便使用一致的資料路徑。

## 計算 GC% 與 AT%

`calculate_gc.R` 使用 R 內建功能讀取 FASTA，計算每條序列的長度、G/C 與 A/T 鹼基數，以及 GC 與 AT 百分比，不需要額外套件。

在專案根目錄執行：

```bash
Rscript analysis/calculate_gc.R
```

也可以在 RStudio 將工作目錄設為專案根目錄，執行：

```r
source("analysis/calculate_gc.R")
```

結果會顯示在畫面上，並儲存至 `analysis/results/gc_content.csv`。
GC% = (G + C 的數量) / 序列長度 × 100，取小數點後兩位。
AT% = (A + T 的數量) / 序列長度 × 100，取小數點後兩位。
CSV 的 `at_count` 與 `at_percent` 欄位分別記錄 A/T 鹼基數與 AT 百分比。
程式支援多行與小寫序列；若有 A、C、G、T 以外的字元會停止並提示。

## G/C 平衡與本機執行紀錄

新增 `g_count`、`c_count` 與 `gc_skew = (G - C) / (G + C)`。
正值表示 G 較多、負值表示 C 較多；沒有 G/C 時輸出 NA。

傳入本次執行的資料夾，可保留中間檔與 R 環境資訊：

```bash
mkdir -p runs/003_gc_skew
Rscript analysis/calculate_gc.R runs/003_gc_skew > runs/003_gc_skew/run.log 2>&1
```

每次新分析請改用新的 run 名稱，避免覆蓋本機紀錄。
`runs/` 不上傳 GitHub；小型結果仍更新在 `analysis/results/gc_content.csv`。
本次改動與結果比較見 [分析報告](../reports/003_gc_skew.md)。

## 十次漸進新增功能

- `a_count`：整數計數。
- `t_count`：整數計數。
- `a_percent`：A / 序列長度 × 100，取兩位小數。
- `t_percent`：T / 序列長度 × 100，取兩位小數。
- `at_skew`：(A − T) / (A + T)，取四位小數；分母為零時 NA，不是百分比。
- `gc_deviation_pp`：GC% − 50，單位是百分點；50% 只是示範比較基準。
- `length_rank`：長度由大至小排名；同分同名次，下一名跳號；原始列順序不變。
- `gc_rank`：以未四捨五入的 GC 比例由大至小排名，同分同名次並跳號。
- `longest_run_bp`：例如 AAAT 的值是 3；只計算連續相同字元的長度。

每次保留既有欄位，新增欄位放在表格尾端。詳見 [十次模擬總覽](../reports/simulation_10.md)。
