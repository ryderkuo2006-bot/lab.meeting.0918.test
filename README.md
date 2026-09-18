# Lab meeting genome analysis

A small, reproducible analysis of six fictional DNA sequences.

## Project layout

```text
data/raw/                 Original FASTA and sample metadata
scripts/                  Active analysis code
results/                  Latest small analysis outputs
reports/
  README.md               Change log: what changed each time
  changes/
    001/                  Report and final result snapshot
    002/
    003/                  Report, result snapshot and artifact index
    ...
work/                     Local intermediate files; excluded from Git
  gc_content/
    current/              Current working files
    history/              Preserved earlier local runs
```

## Run the analysis

From the project root, with R installed:

```bash
Rscript scripts/calculate_gc.R
```

The script writes [results/gc_content.csv](results/gc_content.csv) and local working files under `work/gc_content/current/`. Rerunning replaces these current files.

- [Change log and per-change reports](reports/README.md)
- [Script instructions and column definitions](scripts/README.md)
- [Input dataset description](data/raw/README.md)

GitHub stores source code, the small synthetic input, small result tables and reports. Intermediate objects and logs stay in `work/`; back them up separately if needed. Historical code is available through the commit links in the change log.

The local `analysis/` folder contains the user's separate, uncommitted C editing exercise; it is not part of the R analysis workflow.
