# 008: A/T balance

[Back to change log](../../README.md)

## Request and code change

Calculate (A - T) / (A + T); use NA when the denominator is zero.

- Added columns: `at_skew`.
- [Original commit](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/0dbb20a7f5676522072cdae84398a51b730d3f05) · [Code at this version](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/blob/0dbb20a7f5676522072cdae84398a51b730d3f05/analysis/calculate_gc.R).
- [Result snapshot](results.csv): the small final table from this exact commit.
- All existing columns and the six-row order are unchanged from the previous version.

## New results

| Sequence | at_skew |
|---|---|
| genome_001 | 0.0455 |
| genome_002 | 0.0455 |
| genome_003 | 0.0222 |
| genome_004 | 0.0455 |
| genome_005 | 0.0909 |
| genome_006 | 0.0222 |

## Provenance and validation

This English report was consolidated during the directory reorganization. The linked commit and result snapshot retain the original analysis version; historical commits are not rewritten.

At the original run, all six new results were checked against independent Python calculations and earlier columns were compared for equality.
[Local artifact index](artifacts.csv) lists descriptions, sizes and SHA-256 values. The preserved files are under `work/gc_content/history/at_skew/`, excluded from Git. Original snapshots retain their original language and paths to preserve their hashes.

## Reproduce this historical version

Use the linked original commit in a separate checkout/worktree, then run `Rscript analysis/calculate_gc.R` from that checkout root. The historical script expects the historical input paths. Running the current script instead includes later features.

These are descriptive measurements of six fictional short sequences, not biological conclusions.
