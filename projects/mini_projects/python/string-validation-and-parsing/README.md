# String Validation & Parsing Mini Project (Python)

This mini project is a beginner-friendly practice notebook focused on working with **strings** in Python — a common skill for data cleaning and basic validation tasks.

## What this notebook covers
- Converting values between data types (e.g., `int` → `str`)
- Validating and formatting ZIP codes using string rules
- Extracting IDs from URLs using slicing and splitting
- Validating URL protocol + store ID length with clear, readable branching logic (`if/elif/else`)

## Files
- `string_validation_and_parsing.ipynb` — the main notebook

## Key functions
### `zip_checker(zipcode)`
Validates ZIP codes based on simple rules:
- Accepts 4–5 character ZIP codes
- Pads a leading zero for valid 4-character ZIP codes
- Rejects invalid ZIP codes (e.g., starting with `"00"` in the 5-digit case)

### `url_checker(url)`
Checks whether:
- the URL protocol is valid (`https:` only), and
- the store ID at the end of the URL is exactly 7 characters

Depending on what’s invalid, it prints the required message(s). If both are valid, it returns the store ID.

## How to run
1. Open the notebook file (`.ipynb`) in Jupyter Notebook / JupyterLab (or VS Code).
2. Run cells from top to bottom, or use **Run All**.

## Why this matters
String validation and parsing shows up everywhere in analytics and data work — from cleaning user inputs to extracting identifiers from logs, URLs, or filenames. This notebook demonstrates the fundamentals (slicing, splitting, and conditionals) in a clear way.