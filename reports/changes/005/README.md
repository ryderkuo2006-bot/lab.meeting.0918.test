# 005: T count

[Back to change log](../../README.md)

## Request and code change

Count T bases separately.

- Added columns: `t_count`.
- [Original commit](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/6e29eb3ca48d48c42ca4be785bece54fad36bb8e) · [Code at this version](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/blob/6e29eb3ca48d48c42ca4be785bece54fad36bb8e/analysis/calculate_gc.R).
- [Result snapshot](results.csv): the small final table from this exact commit.
- All existing columns and the six-row order are unchanged from the previous version.

## New results

| Sequence | t_count |
|---|---|
| genome_001 | 21 |
| genome_002 | 21 |
| genome_003 | 22 |
| genome_004 | 21 |
| genome_005 | 20 |
| genome_006 | 22 |

## Provenance and validation

This English report was consolidated during the directory reorganization. The linked commit and result snapshot retain the original analysis version; historical commits are not rewritten.

At the original run, all six new results were checked against independent Python calculations and earlier columns were compared for equality.
[Local artifact index](artifacts.csv) lists descriptions, sizes and SHA-256 values. The preserved files are under `work/gc_content/history/t_count/`, excluded from Git. Original snapshots retain their original language and paths to preserve their hashes.

## Reproduce this historical version

Use the linked original commit in a separate checkout/worktree, then run `Rscript analysis/calculate_gc.R` from that checkout root. The historical script expects the historical input paths. Running the current script instead includes later features.

These are descriptive measurements of six fictional short sequences, not biological conclusions.
