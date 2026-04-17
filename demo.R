# RWT Qlax Bootcamp — R Demo Script
# Run this in RStudio during the live session.
# Usage: Click "Source" button or Ctrl+Shift+Enter

library(tidyverse)

# Load the practice dataset
data <- read_csv("rwt_qlax_health_survey.csv")

# 1. Quick overview
cat("==================================================\n")
cat("DATASET OVERVIEW\n")
cat("==================================================\n")
cat("Rows:", nrow(data), "\n")
cat("Columns:", ncol(data), "\n\n")
glimpse(data)

# 2. Descriptive statistics
cat("\n==================================================\n")
cat("DESCRIPTIVE STATISTICS\n")
cat("==================================================\n")
summary(data)

# 3. Frequency counts
cat("\n==================================================\n")
cat("SCREENING RESULTS\n")
cat("==================================================\n")
table(data$screening_result)

cat("\n==================================================\n")
cat("FACILITIES BY REGION\n")
cat("==================================================\n")
table(data$region)

# 4. Data quality check
cat("\n==================================================\n")
cat("DATA QUALITY CHECK\n")
cat("==================================================\n")
cat("Missing values per column:\n")
colSums(is.na(data))
cat("\nDuplicate IDs:", sum(duplicated(data$patient_id)), "\n")
cat("Unique sex values:", unique(data$sex), "\n")

# 5. Visualizations

# Age distribution
p1 <- ggplot(data, aes(x = age)) +
  geom_histogram(bins = 20, fill = "#e94560", color = "#1a1a2e") +
  labs(title = "Age Distribution", x = "Age", y = "Count") +
  theme_minimal()

# BMI vs Hemoglobin scatter
p2 <- ggplot(data, aes(x = bmi, y = hb_level, color = screening_result)) +
  geom_point(size = 2, alpha = 0.7) +
  scale_color_manual(values = c("#f39c12", "#e94560", "#2ecc71")) +
  labs(title = "BMI vs Hemoglobin", x = "BMI", y = "Hb Level (g/dL)") +
  theme_minimal()

# Screening by region
p3 <- ggplot(data, aes(x = region, fill = screening_result)) +
  geom_bar(position = "dodge") +
  scale_fill_manual(values = c("#f39c12", "#e94560", "#2ecc71")) +
  labs(title = "Screening Results by Region", x = "", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Simple regression
model <- lm(hb_level ~ age + bmi, data = data)
cat("\n==================================================\n")
cat("REGRESSION: hb_level ~ age + bmi\n")
cat("==================================================\n")
summary(model)

# Display plots
print(p1)
print(p2)
print(p3)

cat("\nDone!\n")
