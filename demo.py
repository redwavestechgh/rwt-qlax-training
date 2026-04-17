"""
RWT Qlax Bootcamp — Python Demo Script
Run this during the live session to see Python in action.

Usage: python demo.py
"""
import pandas as pd
import matplotlib.pyplot as plt

# Load the practice dataset
df = pd.read_csv("rwt_qlax_health_survey.csv")

# 1. Quick overview
print("=" * 50)
print("DATASET OVERVIEW")
print("=" * 50)
print(f"Rows: {len(df)}")
print(f"Columns: {len(df.columns)}")
print()
print(df.head(10))

# 2. Descriptive statistics
print("\n" + "=" * 50)
print("DESCRIPTIVE STATISTICS")
print("=" * 50)
print(df.describe())

# 3. Frequency counts
print("\n" + "=" * 50)
print("SCREENING RESULTS")
print("=" * 50)
print(df['screening_result'].value_counts())

print("\n" + "=" * 50)
print("FACILITIES BY REGION")
print("=" * 50)
print(df['region'].value_counts())

# 4. Data quality check
print("\n" + "=" * 50)
print("DATA QUALITY CHECK")
print("=" * 50)
print(f"Missing values:\n{df.isnull().sum()}")
print(f"\nDuplicate IDs: {df['patient_id'].duplicated().sum()}")
print(f"Unique sex values: {df['sex'].unique()}")

# 5. Visualization
fig, axes = plt.subplots(1, 3, figsize=(15, 5))

# Age distribution
axes[0].hist(df['age'], bins=20, color='#e94560', edgecolor='#1a1a2e')
axes[0].set_title('Age Distribution')
axes[0].set_xlabel('Age')

# BMI distribution
axes[1].hist(df['bmi'], bins=20, color='#0f3460', edgecolor='#1a1a2e')
axes[1].set_title('BMI Distribution')
axes[1].set_xlabel('BMI')

# Screening results
results = df['screening_result'].value_counts()
axes[2].bar(results.index, results.values, color=['#2ecc71', '#e94560', '#f39c12'])
axes[2].set_title('Screening Results')

plt.suptitle('RWT Qlax Bootcamp — Health Survey Analysis', fontsize=14, fontweight='bold')
plt.tight_layout()
plt.savefig('analysis_output.png', dpi=150)
plt.show()

print("\nChart saved to analysis_output.png")
print("Done!")
