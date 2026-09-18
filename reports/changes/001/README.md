# 001: GC content

[Back to change log](../../README.md)

## Request and code change

Calculate sequence length, GC count and GC percentage.

- Added columns: `sequence_length_bp`, `gc_count`, `gc_percent`.
- [Original commit](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/5c2c5e6db14fd1205d23133300ecb7c3cc0f4d73) · [Code at this version](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/blob/5c2c5e6db14fd1205d23133300ecb7c3cc0f4d73/analysis/calculate_gc.R).
- [Result snapshot](results.csv): the small final table from this exact commit.
- Initial analysis; no earlier result to compare.

## New results

| Sequence | sequence_length_bp | gc_count | gc_percent |
|---|---|---|---|
| genome_001 | 88 | 44 | 50 |
| genome_002 | 88 | 44 | 50 |
| genome_003 | 88 | 43 | 48.86 |
| genome_004 | 88 | 44 | 50 |
| genome_005 | 89 | 45 | 50.56 |
| genome_006 | 89 | 44 | 49.44 |

## Provenance and validation

This English report was consolidated during the directory reorganization. The linked commit and result snapshot retain the original analysis version; historical commits are not rewritten.

This retrospective record was reconstructed from Git history. No per-run artifact archive was recorded at that time.

## Reproduce this historical version

Use the linked original commit in a separate checkout/worktree, then run `Rscript analysis/calculate_gc.R` from that checkout root. The historical script expects the historical input paths. Running the current script instead includes later features.

These are descriptive measurements of six fictional short sequences, not biological conclusions.
