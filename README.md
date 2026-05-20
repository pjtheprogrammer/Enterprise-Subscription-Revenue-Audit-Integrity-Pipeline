# 🛡️ Enterprise Subscription Revenue Audit & Integrity Pipeline

## 🎯 The Challenge
Upstream synchronization failures between the core CRM and billing systems were causing massive data corruption, leading to severe financial reporting inflation. 

* **The "Ghost Revenue" Problem:** Upstream database bugs failed to update account statuses upon customer cancellation, causing standard financial reports to blindly calculate and misreport non-existent Monthly Recurring Revenue (MRR).
* **Corrupted Financial Records:** Raw data exports contained negative revenue anomalies and missing temporal data, crashing standard reporting pipelines and distorting historical data.
* **Presentation Layer Strain:** Forcing the business intelligence layer to compute complex billing logic over heavy transactional tables caused massive dashboard performance degradation and sluggish load times.

---

## 💡 The Solution
I designed and built an end-to-end, decoupled data engineering pipeline leveraging **Python** and **PostgreSQL** to detect, cleanse, and quantify reporting inflation before it could reach executive financial statements.

### ⚙️ Python Preprocessing & Data Cleansing
* **Automated Extraction:** Developed Python scripts utilizing `Pandas` to programmatically ingest raw subscription and customer datasets.
* **Data Integrity Enforcement:** Engineered programmatic data-cleaning rules to catch and filter out corrupt, negative revenue anomalies at the ingestion boundary.
* **Defensive Schema Design:** Applied a standard engineering placeholder date (`2099-12-31`) to accounts with missing attrition timelines, standardizing the database schema and drastically simplifying downstream SQL date-math calculations.

### 🛢️ Decoupled PostgreSQL View Engine
* **True Revenue Engine:** Formulated a production database view (`v_true_revenue_reporting`) to enforce bulletproof business logic at the source, forcing churned accounts to zero and ensuring lean, reliable metrics.
* **The Revenue Inflation Audit:** Engineered a parallel, specialized audit view (`v_revenue_inflation_audit`) leveraging targeted conditional logic to intentionally isolate system discrepancies and calculate cumulative historical "paper leakage" for executive review.

### 🏎️ Backend Performance Optimization
* **Source-Side Computation:** Shifted heavy analytical and conditional workloads upstream from the presentation layer into the PostgreSQL database engine.
* **Lean Architecture:** Minimized frontend DAX architectural complexity, leaving Power BI to handle simple visualizations rather than heavy data-shaping, which significantly reduced report load times.

---

## 📈 The Impact

* 🔍 **Dollar-Mapped Auditing:** Delivered interactive, executive-ready Power BI dashboards providing financial teams with a clear, dollar-mapped view to isolate operational system bugs and reconcile cumulative paper leakage.
* ⚡ **Subsecond Dashboard Performance:** By moving complex conditional logic out of DAX and into optimized PostgreSQL views, dashboard load times dropped from minutes to seconds.
* 🔒 **Absolute Financial Reassurance:** Eliminated "Ghost Revenue" reporting entirely, giving C-suite leadership access to a verified, transparent, and audit-ready view of corporate financial health.
