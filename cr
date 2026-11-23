Justification

This change includes an enhancement to automate OneStream file transfers to FIP ADLS and a break/fix to restore the JLD STAT MTD load button. It reduces manual file handling, improves transfer tracking, and supports completion of monthly Market Management processing.

Related CRs: [Enter related CR numbers, or “None” if confirmed.]

Implementation Plan
1. Back up the affected production workspace, workflow profile, business rules, and configurations.
2. Create the required tables using XFC_FIP_RunLog_CreateDDL.sql, XFC_StandardHierarchyExport_CreateDDL.sql, and XFC_CustomHierarchyExport_CreateDDL.sql.
3. Import XFC_StandardHierarchyExport_Data.xml and XFC_CustomHierarchyExport_Data.xml through Table Data Manager.
4. Import the FIP Integration workspace (aw.xml), MarketManagement_Allocation.Export to FIP workflow profile (wp.xml), and ADLSUploader Smart Integration component (sic.xml).
5. In FIP Integration → Metrics_That_Matter, set FIP_SPN_SECRET_NAME, FIP_ACCOUNT_NAME, and FIP_CLIENT_ID to the production values provided in the deployment sheet.
6. Deploy the correction for the Load and Consolidate JLD STAT MTD button.
7. Validate hierarchy and Market Management file transfers to ADLS, file archiving, and run logging. Verify that the JLD STAT MTD button completes the intended monthly load and consolidation successfully.







  Backout Plan
1. Stop the FIP export/ADLS transfer process to prevent additional file transfers.
2. Restore modified workspaces, workflow profiles, business rules, and parameter values from pre-deployment backups. Disable newly introduced integration components.
3. Revert the JLD STAT MTD button changes and resume the existing Load and Consolidate JLD STAT YTD workaround.
4. Retain run logs, archived files, and newly created tables for troubleshooting and reconciliation.
5. Coordinate with the FIP team to reconcile files already delivered to ADLS and address any downstream processing.
6. Verify that existing OneStream processes function as before deployment and notify stakeholders that the change has been backed out.
Lower Environment Test Plan

Perform testing in DEV2 – Functional Testing:
1. Execute standard and custom hierarchy exports for 2026M1 and 2026M2.
2. Verify data and hierarchy files in the outgoing folder, archive folder, and ADLS destination.
3. Validate file contents, mappings, timestamps, and entries in XFC_FIP_RunLog.
4. Execute Load and Consolidate JLD STAT MTD and verify successful completion, correct monthly data, and consolidation results.
Lower Environment Test Results

The screenshot shows expected results, but the actual pass/fail column is cut off. If all FIP tests passed, enter:

“Functional testing completed successfully in DEV2 for standard and custom exports across 2026M1 and 2026M2. Verified file generation, ADLS delivery, archiving, run logging, and exported data and mappings. All 14 FIP test cases passed.”

The sheet does not show JLD STAT testing. Once that fix is verified, add:

“The JLD STAT MTD button successfully completed the monthly load and consolidation, with results matching expected values.”
