# 從專案根目錄執行：Rscript analysis/calculate_gc.R
# 僅使用 R 內建功能，不需要安裝套件。
# GC% = (G 的數量 + C 的數量) / 序列長度 * 100。
# AT% = (A 的數量 + T 的數量) / 序列長度 * 100。
# GC skew = (G - C) / (G + C)，正值表示 G 比 C 多。

input_file <- "synthetic_genome_dataset/genomes.fasta"
output_file <- "analysis/results/gc_content.csv"
args <- commandArgs(trailingOnly = TRUE)
run_dir <- if (length(args) > 0L) args[1] else NULL

# 讀取 FASTA，支援同一條序列分成多行的格式。
lines <- trimws(readLines(input_file, warn = FALSE))
lines <- lines[nzchar(lines)]
headers <- which(startsWith(lines, ">"))
if (length(headers) == 0L || headers[1] != 1L) {
  stop("FASTA 必須以 >序列名稱 開始。")
}

genome_ids <- sub("[[:space:]].*$", "", substring(lines[headers], 2L))
if (any(!nzchar(genome_ids)) || anyDuplicated(genome_ids)) {
  stop("FASTA 序列名稱不可空白或重複。")
}

ends <- c(headers[-1L] - 1L, length(lines))
sequences <- vapply(seq_along(headers), function(i) {
  if (ends[i] <= headers[i]) stop("發現空序列：", genome_ids[i])
  toupper(paste0(lines[seq.int(headers[i] + 1L, ends[i])], collapse = ""))
}, character(1))

# 這份資料應只包含 A、C、G、T；遇到其他字元時停止，避免分母不明確。
if (any(grepl("[^ACGT]", sequences))) {
  stop("序列包含 A、C、G、T 以外的字元，請先確認資料。")
}

sequence_length_bp <- nchar(sequences)
gc_count <- nchar(gsub("[^GC]", "", sequences))
at_count <- nchar(gsub("[^AT]", "", sequences))
g_count <- nchar(gsub("[^G]", "", sequences))
c_count <- nchar(gsub("[^C]", "", sequences))
gc_skew <- rep(NA_real_, length(sequences))
has_gc <- gc_count > 0L
gc_skew[has_gc] <- (g_count[has_gc] - c_count[has_gc]) / gc_count[has_gc]
results <- data.frame(
  genome_id = genome_ids,
  sequence_length_bp = sequence_length_bp,
  gc_count = gc_count,
  gc_percent = round(gc_count / sequence_length_bp * 100, 2),
  at_count = at_count,
  at_percent = round(at_count / sequence_length_bp * 100, 2),
  g_count = g_count,
  c_count = c_count,
  gc_skew = round(gc_skew, 4)
)

# A 鹼基計數：整數計數
results$a_count <- nchar(gsub("[^A]", "", sequences))

# T 鹼基計數：整數計數
results$t_count <- nchar(gsub("[^T]", "", sequences))

# A 百分比：A / 序列長度 × 100，取兩位小數
results$a_percent <- round(results$a_count / sequence_length_bp * 100, 2)

# T 百分比：T / 序列長度 × 100，取兩位小數
results$t_percent <- round(results$t_count / sequence_length_bp * 100, 2)

# A/T 平衡：(A − T) / (A + T)，取四位小數；分母為零時 NA，不是百分比
results$at_skew <- NA_real_
has_at <- at_count > 0L
results$at_skew[has_at] <- round((results$a_count[has_at] - results$t_count[has_at]) / at_count[has_at], 4)

# GC 與 50% 的差距：GC% − 50，單位是百分點；50% 只是示範比較基準
results$gc_deviation_pp <- round(gc_count / sequence_length_bp * 100 - 50, 2)

# 序列長度排名：長度由大至小排名；同分同名次，下一名跳號；原始列順序不變
results$length_rank <- rank(-sequence_length_bp, ties.method = "min")

# GC 含量排名：以未四捨五入的 GC 比例由大至小排名，同分同名次並跳號
results$gc_rank <- rank(-(gc_count / sequence_length_bp), ties.method = "min")

# 最長連續相同鹼基：例如 AAAT 的值是 3；只計算連續相同字元的長度
results$longest_run_bp <- vapply(strsplit(sequences, ""), function(bases) max(rle(bases)$lengths), integer(1))

# 指定 run 資料夾時，保留本機中間資料與執行環境。
if (!is.null(run_dir)) {
  dir.create(run_dir, recursive = TRUE, showWarnings = FALSE)
  write.csv(data.frame(genome_id = genome_ids, sequence = sequences),
            file.path(run_dir, "parsed_sequences.csv"), row.names = FALSE)
  saveRDS(list(sequences = sequences, results = results),
          file.path(run_dir, "analysis_state.rds"))
  writeLines(capture.output(sessionInfo()), file.path(run_dir, "session_info.txt"))
  write.csv(results, file.path(run_dir, "after.csv"), row.names = FALSE)
}

dir.create(dirname(output_file), recursive = TRUE, showWarnings = FALSE)
write.csv(results, output_file, row.names = FALSE)
print(results, row.names = FALSE)
cat("\n結果已儲存至：", output_file, "\n", sep = "")
