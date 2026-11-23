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
