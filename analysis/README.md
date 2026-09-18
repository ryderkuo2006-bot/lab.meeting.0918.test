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
