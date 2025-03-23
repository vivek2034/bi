import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Sample Sales Data (You can replace this with a CSV file)
data = {
    'Month': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    'Sales': [5000, 7000, 8000, 7500, 6200, 9000, 11000, 10500, 9500, 9700, 11500, 12000],
}

# Convert data to DataFrame
df = pd.DataFrame(data)

# Create a figure with subplots
fig, axes = plt.subplots(1, 3, figsize=(20, 5))

# Line Plot for Monthly Sales
sns.lineplot(ax=axes[0], x='Month', y='Sales', data=df, marker='o', linestyle='-', color='b')
axes[0].set_title('Monthly Sales Trend (Graph)')
axes[0].set_xlabel('Month')
axes[0].set_ylabel('Sales')
axes[0].grid(True)

# Bar Chart for Sales per Month
sns.barplot(ax=axes[1], x='Month', y='Sales', data=df, palette='viridis')
axes[1].set_title('Monthly Sales Distribution (Bar Graph)')
axes[1].set_xlabel('Month')
axes[1].set_ylabel('Sales')
axes[1].set_xticklabels(df['Month'], rotation=45)

# Pie Chart to Show Sales Contribution
axes[2].pie(df['Sales'], labels=df['Month'], autopct='%1.1f%%', colors=sns.color_palette('pastel'))
axes[2].set_title('Sales Contribution per Month (Pie Chart)')

# Adjust layout and show the plots
plt.tight_layout()
plt.show()
