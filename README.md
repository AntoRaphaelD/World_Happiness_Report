# World_Happiness_Report

## Datasets:
[2015 Global Open Data Index](https://www.kaggle.com/datasets/okfn/open-data)

[World Happiness Report](https://www.kaggle.com/datasets/unsdsn/world-happiness)

## Visualizing the Top 10 Most Open Countries
This code snippet creates a visually enhanced table to showcase the top 10 most open countries using the merged dataset open_data_happiness. The goal is to analyze how openness correlates with other well-being indicators like happiness, GDP, health, and freedom.

### Key Steps:
- **Sorting:** The dataset is sorted in descending order by the Openness score to rank countries based on their openness to the world.

- **Rounding:** All numeric variables (except Country, Region, and Openness) are rounded to 2 decimal places for better readability.

- **Top 10 Selection:** Only the top 10 countries are selected for display.

- **Visualization:** The formattable package is used to create an interactive, color-enhanced table:

- **Openness:** Yellow bar

- **Happiness:** Light green bar

- **Other metrics (GDP, Health, Freedom, etc.):** Deep sky blue bars

- **Alignment:** All columns are left-aligned for consistency.

This formatted output provides a clear visual comparison of openness with other social and economic metrics, useful for exploratory data analysis and presentations.

![image](https://github.com/user-attachments/assets/1a48a3f6-aa88-491e-9ff0-c791d145d33d)

## Visualizing the Relationship Between Openness and Happiness
This R code uses ggplot2, along with ggthemes and viridis, to create a scatter plot that explores the relationship between data openness and happiness across countries.

### What It Does:
- Plot Axes:

  - X-axis: Openness score (from open data)

  - Y-axis: Happiness score (from the World Happiness Report)

- **Data Points:**

  - Each country is represented as a point.

  - Points are colored by Region to distinguish geographical groups.

- **Trend Line:**

  - A linear regression line (geom_smooth(method="lm")) shows the overall trend between openness and happiness.

### Visual Enhancements:

- **Color palette:** Uses the viridis palette for colorblind-friendly regional coloring.

- **Theme:** Clean and minimal theme (theme_minimal()) with larger text (element_text(size=16)).

- **Labels:** Clear axis labels, title, and subtitle make the plot easy to interpret.

### Insight:
The plot aims to answer: **"Are open data–friendly countries happier?"**

By visualizing this correlation, it gives a quick overview of how transparency or openness may relate to national well-being.

![image](https://github.com/user-attachments/assets/b798d9fd-1f1a-4dbc-b026-2da65a03623c)

## Correlation Analysis: Openness vs. Well-being Metrics

This code block computes and visualizes the correlation matrix between a country’s openness and various happiness-related indicators using Pearson correlation.

### steps Performed:
- **Data Selection:**

  - Subsets the merged dataset (open_data_happiness) to include only numerical variables relevant to the analysis:

  - Openness, Happiness, GDP, Family, Health, Freedom, Trust, Generosity, DystopiaResidual.

- **Type Conversion:**

  - Ensures that the Openness column is treated as numeric to enable correlation computation.

- **Correlation Matrix:**

  - Uses the cor() function with:

  - use = **"complete"**: Excludes rows with missing values.

  - method = **"pearson"**: Computes Pearson correlation coefficients.

### Visualization:

- corrplot() generates a correlation plot showing the strength and direction of relationships between variables:
  
- Positive values indicate direct relationships.

- Negative values indicate inverse relationships.

- Color and size represent correlation strength.

### Purpose:
To examine how data openness correlates with happiness factors such as economic prosperity, health, freedom, and generosity. This helps identify which indicators are most strongly associated with openness across countries.

![image](https://github.com/user-attachments/assets/ea7a4491-433e-4710-a60a-be421252cfcc)

