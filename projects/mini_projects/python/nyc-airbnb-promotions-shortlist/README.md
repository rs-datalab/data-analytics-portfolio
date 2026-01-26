# NYC Airbnb Promotions Shortlist (2019)
**Python + Pandas Data Cleaning & Filtering Project**

This project uses the NYC Airbnb 2019 dataset to identify listings that Airbnb could promote in a new social media campaign. The notebook focuses on practical data cleaning, filtering, and simple reporting using **Python** and **pandas**.

---

## Business Goal
Airbnb is planning a social media ad campaign in **New York City**. The goal is to identify listings that are likely to be attractive “best deals” and worth promoting.

---

## Promotion Rules (Shortlist Criteria)
A listing is considered **promotion-ready** if it meets **all** of the following:
- **Price:** $100/night or less  
- **Minimum stay:** 2 nights or fewer  
- **Reviews:** at least 100 reviews  
- **Availability:** available at least 180 days per year  

---

## What This Notebook Delivers
- A cleaned dataset (removing missing and duplicate records)
- A filtered **promotion shortlist**
- A borough breakdown of shortlisted listings
- A separate **luxury analysis** focused on **Brooklyn** and **Manhattan**

---

## Dataset
Source: Kaggle — **AB_NYC_2019.csv**  
Dataset link: https://www.kaggle.com/datasets/venkatreddykonasani/ab-nyc-2019csv

---

## Key Findings (from this run)
- Rows in dataset: **48,895**
- Rows remaining after dropping missing values: **38,821**
- Listings potentially missed due to incomplete data: **10,074**

### Promotion shortlist results
After cleaning and applying the promotion rules:
- Promotion-ready listings found: **554**

### Shortlist by borough
- Brooklyn: **231**
- Manhattan: **143**
- Queens: **133**
- Bronx: **29**
- Staten Island: **18**

### Bonus: Luxury analysis (Brooklyn + Manhattan)
Luxury definition used:
- **Price:** $1000/night or more  
- **Minimum stay:** 1–2 nights  
Luxury listings found (Brooklyn + Manhattan): **61**

---

## Outputs
Running the notebook creates these files:
- `nyc_airbnb_promotion_shortlist.csv` — final promotion candidates (sorted)
- `neighbourhood_counts.txt` — borough breakdown of the shortlist
- `nyc_airbnb_luxury_brooklyn_manhattan.csv` — luxury listings (Brooklyn + Manhattan)

---

## Tools Used
- Python
- pandas

---

## How to Run
1. Download the dataset (`AB_NYC_2019.csv`) from Kaggle and place it in the project folder.
2. Open the notebook in Jupyter Notebook / JupyterLab (or VS Code).
3. Run the notebook from top to bottom (or use **Run All**).

---

## Notes / Assumptions
- The shortlist uses `dropna()`, meaning listings with missing values in key columns are excluded.
- `last_review` is converted to datetime for sorting and readability.
