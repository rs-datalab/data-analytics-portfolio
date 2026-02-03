# Python Automation, Validation & Data Structuring (Python)

This project combines three core foundations used in real data work:
**iteration for automation**, **string validation/parsing**, and **lightweight data structuring**.

## What this notebook covers

### 1) Automation with loops
- Using `while` loops for repetition and milestone alerts
- Building a reservation countdown timer with conditional warning messages

### 2) Basic analytics patterns with `for` loops
- Binning 1–10 feedback scores into **negative / neutral / positive**
- Validating feedback IDs against a list of verified IDs
- Using a nested loop to count customers whose baskets total **$100+**

### 3) String validation & parsing
- Converting numeric-looking values (IDs, ZIPs) into strings safely
- Validating and normalizing ZIP codes using string rules
- Extracting store IDs from URLs using slicing and splitting
- Validating URL protocol + store ID length with clear `if/elif/else` logic

### 4) Data structuring with lists & tuples
- Building row-like records from aligned lists using tuples
- Converting tuple records into lists when edits are needed
- Filtering records using unpacking and list comprehensions

## Files
- `python_automation_validation_data_structuring.ipynb` — the main notebook  
  *(Rename this line to match your actual notebook filename if different.)*

## Key functions

### `reservation_timer(start_mins=10, pause_seconds=0)`
Simulates a seat reservation countdown:
- prints minutes remaining
- prints special warnings at 5 and 2 minutes
- prints a timeout message at 0

### `score_counter(score_list)`
Counts how many scores fall into:
- Negative (1–5)
- Neutral (6–8)
- Positive (9–10)

### `id_validator(verified_ids, feedback_ids)`
Cross-checks feedback IDs against verified IDs and prints:
- how many are unverified
- the percent unverified

### `purchases_100(sales)`
Counts how many customers have total purchases **>= 100**, where `sales` is a list of customer baskets.

### `zip_checker(zipcode)`
Validates ZIP codes with simple rules:
- Accepts 4–5 character ZIP codes
- Pads a leading zero for valid 4-character ZIP codes
- Rejects invalid ZIP codes (including 5-digit ZIPs starting with `"00"`)

### `url_checker(url)`
Checks whether:
- the URL protocol is valid (`https:` only), and
- the store ID at the end of the URL is exactly 7 characters

If invalid, it prints the required message(s). If valid, it returns the store ID.

## How to run
1. Open the `.ipynb` notebook in Jupyter Notebook / JupyterLab (or VS Code).
2. Run cells top to bottom, or use **Run All**.

## Why this matters
These patterns show up constantly in analytics and data cleaning:
- loops for automation and repeated checks
- basic validation logic for messy real-world inputs
- string parsing for identifiers in URLs/logs/files
- lightweight structuring and filtering of small datasets before moving to pandas
