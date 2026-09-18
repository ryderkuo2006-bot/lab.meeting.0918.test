# Run from the project root: Rscript scripts/calculate_gc.R
# Uses base R only; no additional packages are required.
# GC% = (G + C) / sequence length * 100.
# AT% = (A + T) / sequence length * 100.
# GC skew = (G - C) / (G + C); positive values indicate more G.

input_file <- "data/raw/genomes.fasta"
output_file <- "results/gc_content.csv"
args <- commandArgs(trailingOnly = TRUE)
run_dir <- if (length(args) > 0L) args[1] else "work/gc_content/current"

# Read FASTA records, including multiline sequences.
lines <- trimws(readLines(input_file, warn = FALSE))
lines <- lines[nzchar(lines)]
headers <- which(startsWith(lines, ">"))
if (length(headers) == 0L || headers[1] != 1L) {
  stop("FASTA must start with a >sequence_id header.")
}

genome_ids <- sub("[[:space:]].*$", "", substring(lines[headers], 2L))
if (any(!nzchar(genome_ids)) || anyDuplicated(genome_ids)) {
  stop("FASTA sequence IDs must be nonempty and unique.")
}

ends <- c(headers[-1L] - 1L, length(lines))
sequences <- vapply(seq_along(headers), function(i) {
  if (ends[i] <= headers[i]) stop("Empty sequence: ", genome_ids[i])
  toupper(paste0(lines[seq.int(headers[i] + 1L, ends[i])], collapse = ""))
}, character(1))

# Reject characters other than A, C, G and T to keep denominators explicit.
if (any(grepl("[^ACGT]", sequences))) {
  stop("Sequences must contain only A, C, G and T.")
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

# Count A bases.
results$a_count <- nchar(gsub("[^A]", "", sequences))

# Count T bases.
results$t_count <- nchar(gsub("[^T]", "", sequences))

# A percentage, rounded to two decimal places.
results$a_percent <- round(results$a_count / sequence_length_bp * 100, 2)

# T percentage, rounded to two decimal places.
results$t_percent <- round(results$t_count / sequence_length_bp * 100, 2)

# AT skew: NA if there are no A/T bases; this is not a percentage.
results$at_skew <- NA_real_
has_at <- at_count > 0L
results$at_skew[has_at] <- round((results$a_count[has_at] - results$t_count[has_at]) / at_count[has_at], 4)

# Deviation from a demonstration reference of 50% GC, in percentage points.
results$gc_deviation_pp <- round(gc_count / sequence_length_bp * 100 - 50, 2)

# Rank lengths in descending order; ties share the minimum rank.
results$length_rank <- rank(-sequence_length_bp, ties.method = "min")

# Rank unrounded GC proportions in descending order, preserving ties.
results$gc_rank <- rank(-(gc_count / sequence_length_bp), ties.method = "min")

# Longest consecutive run of one base (AAAT gives 3).
results$longest_run_bp <- vapply(strsplit(sequences, ""), function(bases) max(rle(bases)$lengths), integer(1))

# List all most frequent bases in A/C/G/T order.
results$dominant_bases <- vapply(strsplit(sequences, ""), function(bases) {
  counts <- table(factor(bases, levels = c("A", "C", "G", "T")))
  paste(names(counts)[counts == max(counts)], collapse = "/")
}, character(1))

# Save intermediate objects and environment details in the local work directory.
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
cat("\nResults saved to: ", output_file, "\n", sep = "")
