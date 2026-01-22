# Supermarket Sales EDA Report

## Objective
Explore supermarket transaction data to understand profitability patterns (gross income) and evaluate whether customer satisfaction (Rating) relates to profitability.

## Dataset
Supermarket Sales (Kaggle): https://www.kaggle.com/aungpyaeap/supermarket-sales  
Time coverage: January–March 2019  
Scope: 3 branches (A/B/C), multiple cities, product lines, and payment methods.

## Approach
1. **Loaded and inspected data**: schema, data types, summary statistics.
2. **Prepared time index**: converted `Date` to datetime and used it as the index for time-based aggregation.
3. **Data quality checks**:
   - Removed duplicate rows.
   - Assessed missingness and applied simple imputations:
     - numeric columns → mean
     - categorical columns → mode
4. **Exploratory analysis**:
   - Univariate distributions (ratings + numeric feature histograms)
   - Category comparisons (branch counts, payment counts)
   - Bivariate analysis (rating vs gross income; boxplots by branch, gender, payment)
   - Time series view of average daily gross income
   - Pairwise numeric relationships (scatter matrix)
   - Correlation analysis (numeric-only)

## Key Findings (Supported by Notebook Visuals)
1. **Customer ratings are broadly uniform** across the observed range (roughly 4–10). The rating distribution shows no strong left/right skew.
2. **Rating does not meaningfully explain gross income**:
   - Scatter shows high dispersion.
   - Regression overlay is nearly flat.
   - Correlation ≈ **-0.04** (very weak).
3. **Branch gross income distributions overlap strongly**, suggesting similar per-transaction profitability across branches.  
   - Branch **C** appears to have a slightly higher median gross income than A and B, though differences are modest.
4. **Gender differences are minimal**.  
   - Female median gross income is slightly higher, but distributions overlap heavily.
5. **Payment method shows minimal differences** in gross income distribution.  
   - Cash, Credit card, and Ewallet appear similar in medians/spreads.
6. **Strong correlations among financial variables are expected by design**:
   - `Tax 5%`, `Total`, `cogs`, and `gross income` are derived from shared calculations and are near-perfectly correlated (≈ 1.00).
   - This reflects dataset construction rather than independent behavioral relationships.
7. **Average gross income over time fluctuates day-to-day** with occasional spikes/dips and **no clear trend** across the 3-month period.

## Business Interpretation
- Profitability appears driven more by **transaction mechanics** (pricing and quantity) than customer rating in the observed period.
- Since branches look similar overall, meaningful comparisons likely require **segmenting by product line, customer type, and city**.
- Derived financial columns are redundant for modeling; they should be treated carefully to avoid misleading conclusions.

## Recommendations
- Avoid using Rating alone as a profitability indicator; focus analysis on variables like Unit price and Quantity.
- Compare branches using **profit per transaction** and **product mix** rather than volume alone.
- For any predictive modeling, avoid including multiple derived financial columns simultaneously (Tax/Total/cogs/gross income).

## Limitations
- Only **three months** of data; seasonal trends and longer-term behavior cannot be inferred.
- Missing contextual information (promotions, holidays, staffing, marketing) limits interpretation of time fluctuations.
- Mean/mode imputation is a baseline approach; median imputation may be more robust for skewed numeric variables.

## Next Steps (Optional Enhancements)
- Segment gross income and total sales by:
  - product line
  - customer type (Member vs Normal)
  - city and branch
  - payment method
- Add time-based features (day-of-week, hour-of-day) to identify peak demand patterns.
- (Optional) Build a lightweight predictive model using independent features (exclude redundant derived columns).

## Deliverables
- **Notebook:** `notebooks/supermarket_sales_eda.ipynb`
- **Report:** `report.md`