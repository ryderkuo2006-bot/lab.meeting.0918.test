# 002: AT content

[Back to change log](../../README.md)

## Request and code change

Add AT count and AT percentage.

- Added columns: `at_count`, `at_percent`.
- [Original commit](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/8860aeb3e9c368f4b4f2650dfcd1344aea074207) · [Code at this version](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/blob/8860aeb3e9c368f4b4f2650dfcd1344aea074207/analysis/calculate_gc.R).
- [Result snapshot](results.csv): the small final table from this exact commit.
- All existing columns and the six-row order are unchanged from the previous version.

## New results

| Sequence | at_count | at_percent |
|---|---|---|
| genome_001 | 44 | 50 |
| genome_002 | 44 | 50 |
| genome_003 | 45 | 51.14 |
| genome_004 | 44 | 50 |
| genome_005 | 44 | 49.44 |
| genome_006 | 45 | 50.56 |

## Provenance and validation

This English report was consolidated during the directory reorganization. The linked commit and result snapshot retain the original analysis version; historical commits are not rewritten.

This retrospective record was reconstructed from Git history. No per-run artifact archive was recorded at that time.

## Reproduce this historical version

Use the linked original commit in a separate checkout/worktree, then run `Rscript analysis/calculate_gc.R` from that checkout root. The historical script expects the historical input paths. Running the current script instead includes later features.

These are descriptive measurements of six fictional short sequences, not biological conclusions.
