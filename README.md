# 📊 Customer Segmentation for Campaign Targeting – OJAR Perfume

**Author**: Ahmed Ait Si Hamou  
**Role**: Data Analyst  
**Tools Used**: SQL Server, Tableau, PowerPoint

---

## 📎 Project Files & Links

| File Type       | Description                              | Link |
|------------------|------------------------------------------|------|
| 📄 Requirements  | Project objectives & business context     | [Requirements.docx](https://github.com/Ahmed-Aitsihamou/Customer-Segmentation-for-Campaign-Targeting-Using-SQL-and-Tableau/blob/main/01%20-%20Customer%20Segmentation%20for%20Campaign%20Targeting%20Requirements.pdf) |
| 📁 Dataset       | Cleaned data with customer + RFM metrics  | [Dataset.rar](https://github.com/Ahmed-Aitsihamou/Customer-Segmentation-for-Campaign-Targeting-Using-SQL-and-Tableau/blob/main/02%20-%20Dataset.rar) |
| 🧮 SQL Code      | RFM scoring logic + segmentation query    | [RFM_Segmentation.sql](https://github.com/Ahmed-Aitsihamou/Customer-Segmentation-for-Campaign-Targeting-Using-SQL-and-Tableau/blob/main/03%20-%20Customer%20Segmentation%20for%20Campaign%20Targeting%20Using%20RFM%20Segmentation.sql) |
| 📊 Dashboard     | Tableau Public (Interactive)              | [View Dashboard](https://public.tableau.com/app/profile/ahmed.aitsihamou/viz/CustomerSegmentationDashboardForCampaignTargeting/Page1) |
| 📽️ Presentation | Executive insights & strategy summary     | [Presentation.pdf](https://github.com/Ahmed-Aitsihamou/Customer-Segmentation-for-Campaign-Targeting-Using-SQL-and-Tableau/blob/main/05%20-%20Customer%20Segmentationfor%20Campaign%20Targeting%20Presentation.pdf) |

---

## 🧠 Project Overview

OJAR, a premium perfume brand, wants to improve the efficiency of its digital marketing campaigns. Currently, all customers are treated the same regardless of their behavior — leading to missed opportunities and marketing waste.

This project uses **RFM segmentation** (Recency, Frequency, Monetary) to identify and classify customer groups based on their purchasing behavior and demographics. It enables **targeted campaign planning**, increased **ROI**, and better **customer retention**.

---

## 🎯 Objectives

- Perform **RFM analysis** on customer transaction data
- Create actionable **customer segments**
- Analyze **demographics** (age, gender, country) per segment
- Deliver an interactive **Tableau dashboard** and strategic insights
- Present business recommendations to improve marketing efficiency

---

## 🗃️ Dataset Summary

| Table Name         | Description                                    |
|--------------------|------------------------------------------------|
| `Transactions_Data`| Transaction history (date, amount, customer_id)|
| `Customers_Data`   | Customer demographics & profile info           |
| `RFM_Segment_Data` | Final output table with RFM scores and labels  |

- ✅ 438 customers  
- ✅ 7,864 transactions  
- ✅ Fields: Age, Gender, Country, Signup Date, Purchase Behavior

---

## 🧮 RFM Segmentation Logic (SQL)

**Scoring Logic:**
- `Recency`: Days since last purchase (lower = better)
- `Frequency`: Total purchases (higher = better)
- `Monetary`: Total spend (higher = better)

**Segmentation via NTILE Buckets:**
```sql
NTILE(5) OVER (ORDER BY recency DESC) AS R_score
NTILE(5) OVER (ORDER BY frequency ASC) AS F_score
NTILE(5) OVER (ORDER BY monetary ASC) AS M_score
```

**Segment Mapping Rules:**

| Segment         | Rules                                    |
|--------------------|------------------------------------------------|
| `Champions`| R=5, F=5, M=5 |
| `Loyal Customers`   | R ≥ 4, F ≥ 4 |
| `Big Spenders` | M = 5 |
| `New Customers`| R = 5, F ≤ 2 |
| `At Risk`   | R ≤ 2, F ≥ 4 |
| `Others` | Everyone else |

🔗 See full SQL file: [RFM_Segmentation.sql](https://github.com/Ahmed-Aitsihamou/Customer-Segmentation-for-Campaign-Targeting-Using-SQL-and-Tableau/blob/main/03%20-%20Customer%20Segmentation%20for%20Campaign%20Targeting%20Using%20RFM%20Segmentation.sql)

---

## 📈 Tableau Dashboard
🔗 View Interactive Dashboard: [View Dashboard](https://public.tableau.com/app/profile/ahmed.aitsihamou/viz/CustomerSegmentationDashboardForCampaignTargeting/Page1) 
**Features:**
- KPI Summary (Total Revenue, Avg Recency, Frequency)
- Segment Distribution with % breakdown
- Behavioral Profiling (RFM Averages)
- Demographics: Age Group, Country, Gender
- Fully Filterable Customer Table (with mini bar charts)

---

## 📊 Key Insights
- 💡 Champions and Big Spenders represent <10% of customers but contribute the highest revenue
- 📉 At Risk customers show strong past value but long recency → reactivation priority
- 👥 26–35 age group dominates high-value segments → age-targeted campaigns have high potential
- 🌍 Canada and USA have the highest-value customers
- ⚖️ Gender is balanced → marketing tone can remain neutral

## 📢 Marketing Strategy by Segment
| Segment         | Goal                                    | Action Plan |
|--------------------|------------------------------------------------|------------------------------------------------|
| `Champions`| Retain/Upsell | VIP previews, loyalty gifts, referral bonuses |
| `Loyal Customers` | Strengthen Loyalty | Tiered perks, surprise incentives |
| `Big Spenders` | Reactivate | Premium re-engagement offers, concierge |
| `At Risk`| Win-back | Feedback surveys, urgency coupons |
| `New Customers`   | Nurture | Welcome series, 2nd-order incentive |
| `Others` | Test Engagement | Discounted bundles, newsletter funneling |

---

## 📂 Deliverables
- ✅ Cleaned dataset for dashboard and analysis
- ✅ SQL logic for RFM scoring and segmentation
- ✅ Professional Tableau dashboard
- ✅ presentation slides

---

## 💼 Skills Demonstrated
- 🧮 SQL (NTILE, window functions, CASE logic)
- 📊 Tableau dashboard design and filters
- 📈 Behavioral segmentation and marketing analytics
- 📋 presentation slides

---

## 📌 Contact
Ahmed Ait Si Hamou
[Linkedin](https://www.linkedin.com/in/ahmedaitsihamou/)
[Tanleau Public](https://public.tableau.com/app/profile/ahmed.aitsihamou/vizzes)
📫 'Ahmedaitsihamou1@gmail.com'
