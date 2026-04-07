# ASC Freeze — Global Reporting Stable — 2026-04-07

## Status

This freeze captures a stable governed checkpoint of the ASC platform after global reporting identity cleanup.

## Included Stability Guarantees

- deployment completes successfully
- final deployment state resolves to steady
- settled deployment state is written
- narrator summary reads settled state
- shared dashboard reads settled state
- shared dashboard uses tenant-qualified global project IDs
- shared dashboard uses tenant-qualified global program IDs
- shared dashboard governor decision is correctly parsed
- tenant-facing dashboards remain local and readable
- preview versus actual comparison passes
- governance loop health reports healthy
- System Doctor validates both runtime health and shared reporting identity safety

## Known Remaining Warning

- duplicate processed project IDs exist across tenants
- this is still tolerated because tenant runtime paths isolate local files
- shared reporting is protected because it now uses tenant-qualified global IDs
- future storage-level normalization may still be desirable

## Rollback Purpose

If future work destabilizes global reporting identity, shared dashboard truth, governance interpretation, or doctor alignment, rollback to this freeze.

## Suggested Rollback Reference

- git tag: `asc-freeze-global-reporting-stable-2026-04-07`
