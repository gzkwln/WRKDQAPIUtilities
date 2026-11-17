# WRKDQAPIUtilities
# README WRKDQAPIUTILITIES - DQ KPI DASHBOARDS


## Required execution order

```text
100_wrkdqapiutilities_backend_schema_v1.0.0.sql
                    ↓
110_wrkdqapiutilities_base_configuration_v1.0.0.sql
                    ↓
Destination-specific API configuration
                    ↓
Backend execution test
                    ↓
Cloud Construct datasets and WebApp
```


```text
/*=============================================================================
0 - IMPORTANT NOTES

    a. The database name used by this solution is WRKDQAPIUtilities.

    b. Execute the SQL files in numerical order. File 110 must be executed
       only after file 100 has completed successfully.

    c. File 100 creates the complete backend structure. It must be a
       schema-only script and must not contain client or project data.

    d. File 110 inserts the reusable non-sensitive configuration required by
       the solution into GETAPIRESULTS and APIRESULTS.

    e. File 110 must not contain API passwords, SQL passwords, access tokens,
       proxy credentials, client-specific server names, or confidential API
       payloads. Destination credentials must be configured separately using
       the approved secret-management process.

    f. The included HTML guides contain the detailed backend and Cloud
       Construct instructions. The steps below define the required deployment
       order for future projects.

1 - SQL SERVER > BACK UP EXISTING DATABASE

    If WRKDQAPIUtilities already exists, create and verify a backup before
    replacing it. Pause SKP activity, SQL Agent jobs, or other processes that
    connect to the database during deployment.

2 - SQL SERVER > CREATE OR REPLACE DATABASE OBJECTS

    Run:

        100_wrkdqapiutilities_backend_schema_v1.0.0.sql

    This file creates the WRKDQAPIUtilities backend objects, including the
    required tables, history tables, views, stored procedures, functions,
    constraints, indexes, and supporting database objects.

    If the script contains CREATE DATABASE statements with physical MDF/LDF
    paths from another server, remove or adapt those statements before running
    the script. Prefer creating WRKDQAPIUtilities using the destination SQL
    Server default data and log locations.

3 - SQL SERVER > INSERT REUSABLE BASE CONFIGURATION

    After file 100 completes successfully, run:

        110_wrkdqapiutilities_base_configuration_v1.0.0.sql

    This file inserts the non-sensitive reusable rows required by the process
    into:

        - dbo.GETAPIRESULTS
        - dbo.APIRESULTS

    Before execution, review the file and confirm that it contains no live API
    credentials, client data, confidential JSON payloads, or source-environment
    connection information.

4 - SQL SERVER > VALIDATE OBJECT CREATION

    Confirm that file 100 completed without unresolved errors and that all
    required objects exist. Pay particular attention to:

        - ImportJSONFile_* views
        - JSON_* current-state tables
        - *_History tables
        - APIResults_Combined and related dashboard views
        - webKnowledgeTierExtract_JSON_TABLES_Ins
        - webKnowledgeTierExtract_ArchiveToHistory
        - DQReportsGeneralData_Ins, when automated execution is used
        - Required SQL CLR assemblies, when applicable

5 - SQL SERVER > VALIDATE BASE CONFIGURATION

    Confirm that file 110 inserted the expected rows into GETAPIRESULTS and
    APIRESULTS without duplicates.

    Review at least:

        - ExtractID
        - URL and URLEXTENSION
        - TENANTID placeholder or destination value
        - TABLENAME
        - TableOrder
        - Active

    APIUsername and APIPassword must be populated separately through the
    approved destination configuration process.

6 - SQL SERVER > SECURITY AND DATA VALIDATION

    Before entering destination credentials or running an API extraction,
    confirm that the database contains no project/client data.

    Run:

        SELECT
            s.name AS SchemaName,
            t.name AS TableName,
            SUM(p.rows) AS RowCount
        FROM sys.tables AS t
        INNER JOIN sys.schemas AS s
            ON s.schema_id = t.schema_id
        INNER JOIN sys.partitions AS p
            ON p.object_id = t.object_id
        WHERE p.index_id IN (0, 1)
        GROUP BY s.name, t.name
        HAVING SUM(p.rows) > 0
        ORDER BY s.name, t.name;

    At this stage, only the approved reusable configuration rows inserted by
    file 110 should be present. Investigate any other populated table before
    continuing.

7 - SKP > CATALOG > SYSTEMS > CONNECTIONS

    Create or validate the destination SQL Server connection for
    WRKDQAPIUtilities.

    Required usages:

        - Construct
        - Any additional approved usage required by the target implementation

    Test the connection before continuing.

8 - SKP > CATALOG > SYSTEMS > DATASTORES

    Add datastore:

        WRKDQAPIUtilities

    Link the datastore to the WRKDQAPIUtilities database and the connection
    created in step 7. Validate that the required tables and views are visible.

9 - BACKEND > CONFIGURE DESTINATION API VALUES

    Configure the destination-specific values required by GETAPIRESULTS,
    including:

        - ExtractID
        - TENANTID
        - APIUsername
        - APIPassword
        - Endpoint URL values, where different
        - Active status

    Obtain API credentials through the approved Syniti/Cloud Operations
    process. Do not store credentials in this repository, the README, HTML
    guides, screenshots, or SQL seed file.

10 - BACKEND > SELECT AND TEST THE EXECUTION METHOD

    Choose one of the following methods:

    A. Fully automated SQL execution
       - Validate SQL CLR and the required API assembly.
       - Test the API stored procedure manually.
       - Execute DQReportsGeneralData_Ins manually once.
       - Schedule only after a successful end-to-end test.

    B. Semi-automated PowerShell execution
       - Follow the backend operations HTML guide.
       - Retrieve API payloads with the sanitized PowerShell process.
       - Load APIRESULTS.
       - Update and archive GETAPIRESULTS.
       - Populate the JSON_* tables.
       - Archive the transformed data into *_History tables.

    Detailed instructions:

        docs/wrkdqapiutilities_backend_operations_guide_v1.0.0.html

11 - SQL SERVER > VALIDATE BACKEND OUTPUTS

    Confirm that:

        - APIRESULTS contains the current endpoint payloads.
        - GETAPIRESULTS.GETRESULTS and LastUpdate were refreshed.
        - JSON_* tables contain transformed data.
        - *_History tables contain the expected weekly snapshot.
        - APIResults_Combined returns dashboard-ready records.
        - PM0 and P00 views return the correct system-specific results.
        - Weekly summary views return WeekID in chronological order.

12 - CLOUD CONSTRUCT > CREATE DATASETS

    This model is created with dashboards for two different systems (P00 and PM0). Create and preview the following logical datasets if applies:

        PM0
        - SubjectAreaDQScore_PM0
        - DashboardDataDomainDQScore_PM0
        - Top5Reports_PM0
        - APIResults_Combined_PM0
        - APIResults_DQScore_Weekly_Summary_PM0

        P00
        - SubjectAreaDQScore
        - DashboardDataDomainDQScore
        - Top5Reports
        - APIResults_Combined
        - APIResults_DQScore_Weekly_Summary_P00

    Resolve missing fields or incompatible data types before building the
    dashboard.

13 - CLOUD CONSTRUCT > BUILD DQ KPI DASHBOARDS WEBAPP

    Follow:

        docs/dq_kpi_dashboard_cloud_construct_build_guide_v1.0.0.html

    Create:

        - WebApp: DQ KPI Dashboards
        - Page: Main Page
        - Tab: System - PM0
        - Tab: System - P00
        - Tab: System - PM0 Trend
        - Tab: System - P00 Trend

    Recreate the grids, charts, field formatting, and parent-child bindings
    documented in the HTML guide. Do not reuse generated IDs from another SKP
    environment.

14 - CLOUD CONSTRUCT > CONFIGURE SECURITY

    Configure the dashboard as read-only:

        - Select: Enabled
        - Insert: Disabled
        - Update: Disabled
        - Delete: Disabled

    Test with a representative non-admin user.

15 - CLOUD CONSTRUCT > CONFIGURE NAVIGATION

    Configure the Finance, Business Partners, and Materials navigation buttons
    using the destination SKP Subject Area URLs. Do not copy source-tenant
    Subject Area IDs or URLs.

16 - END-TO-END VALIDATION

    Validate one known DQ implementation through the complete flow:

        Syniti API
        > APIRESULTS / GETAPIRESULTS
        > ImportJSONFile_* view
        > JSON_* table
        > APIResults_Combined
        > Cloud Construct dataset
        > Current-state dashboard
        > Weekly history summary
        > Trend chart

    Reconcile Rule ID, Subject Area, Data Domain Segment, DQ Score, ErrorCount,
    OpportunityCount, WeekID, and NumberOfRules.

17 - DEPLOYMENT DOCUMENTATION

    Additional reference:

        docs/dq_kpi_dashboard_deployment_guide_v1.0.0.docx

    Record the destination environment, deployed Git tag, commit SHA, execution
    method, schedule, support owner, and credential owner outside the reusable
    source repository.


=============================================================================*/
```

## Repository files

```text
README.md

sql/
├── 100_wrkdqapiutilities_backend_schema_v1.0.0.sql
└── 110_wrkdqapiutilities_base_configuration_v1.0.0.sql

docs/
├── wrkdqapiutilities_backend_operations_guide_v1.0.0.html
├── dq_kpi_dashboard_cloud_construct_build_guide_v1.0.0.html
└── dq_kpi_dashboard_deployment_guide_v1.0.0.docx
```

## Required execution order

```text
100_wrkdqapiutilities_backend_schema_v1.0.0.sql
                    ↓
110_wrkdqapiutilities_base_configuration_v1.0.0.sql
                    ↓
Destination-specific API configuration
                    ↓
Backend execution test
                    ↓
Cloud Construct datasets and WebApp
```
