# Analysis scripts

`calculate_gc.R` reads `data/raw/genomes.fasta` using base R, without additional packages.

```bash
Rscript scripts/calculate_gc.R
```

In RStudio, set the working directory to the project root and run:

```r
source("scripts/calculate_gc.R")
```

The final table is `results/gc_content.csv`. Parsed sequences, R objects, environment details and a result copy are written to `work/gc_content/current/`. An optional first command-line argument overrides that local working directory.

## Columns

| Columns | Definition |
|---|---|
| genome_id, sequence_length_bp | FASTA ID and sequence length |
| gc_count, at_count | G+C and A+T counts |
| gc_percent, at_percent | Counts divided by sequence length, times 100 |
| g_count, c_count, a_count, t_count | Individual base counts |
| a_percent, t_percent | Individual base percentages |
| gc_skew, at_skew | (G−C)/(G+C) and (A−T)/(A+T); NA for zero denominators |
| gc_deviation_pp | GC percentage minus 50, in percentage points |
| length_rank, gc_rank | Descending ranks; ties share the minimum rank; GC ranking uses unrounded proportions |
| longest_run_bp | Longest consecutive run of one base |
| dominant_bases | Most frequent bases, including ties, in A/C/G/T order |

Percentages are rounded to two decimal places and skews to four. Input supports lowercase and multiline sequences; empty sequences, duplicate IDs and non-ACGT characters are rejected.

See the [change log](../reports/README.md) for earlier results and code versions.
