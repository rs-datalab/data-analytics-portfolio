# Supermarket Sales EDA (Python)

## Overview
This project explores supermarket transaction data to understand profitability patterns and evaluate whether customer satisfaction (Rating) is related to gross income.

It includes:
- Data loading + inspection
- Data cleaning (duplicates + missing values)
- Univariate and bivariate analysis
- Time series aggregation by date
- Pairwise numeric relationships and correlation analysis
- A short written report
## Dataset
Supermarket Sales (Kaggle): https://www.kaggle.com/aungpyaeap/supermarket-sales  
Time: Jan–Mar 2019  
Branches: A/B/C

## Key Results (high level)
- Ratings are broadly uniform; no strong skew.
- Rating vs gross income: correlation ≈ -0.04 → no meaningful relationship.
- Branch C shows a slightly higher median gross income, but distributions overlap heavily.
- Payment method and gender show minimal differences in gross income distributions.
- Financial variables (Tax/Total/cogs/gross income) are highly correlated because they’re derived.

See the notebook for plots and supporting analysis.

## Figures (selected outputs)

Below are a few key visuals from the EDA (saved in the `figures/` folder):

### Rating distribution
![Rating distribution](figures/rating_distribution.png)

### Rating vs gross income (with regression)
![Rating vs gross income](figures/rating_vs_gross_income_regression.png)

### Correlation heatmap (numeric features)
![Correlation heatmap](figures/correlation_heatmap.png)

### Average gross income over time
![Average gross income over time](figures/avg_gross_income_over_time.png)


## Project Structure 
```text
├── data/
│   └── supermarket_sales.csv
├── figures/
│   ├── avg_gross_income_over_time.png
│   ├── correlation_heatmap.png
│   ├── gross_income_by_branch.png
│   ├── gross_income_by_gender.png
│   ├── rating_distribution.png
│   └── rating_vs_gross_income_regression.png
├── notebooks/
│   └── supermarket_sales_eda.ipynb
├── report.md
└── README.md
```

## How to Run
1. Clone the repo and place the dataset in `data/` (or update the path in the notebook).
2. Create/activate a Python environment.
3. Install dependencies (see below).
4. Open the notebook and run all cells.

## Dependencies
- pandas
- numpy
- matplotlib
- seaborn
- scipy
- ydata-profiling (optional)
- calmap (optional)

Example:
```bash
pip install pandas numpy matplotlib seaborn scipy
