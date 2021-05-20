 # Add histogram data
x1 = np.random.randn(200) + 2
x2 = np.random.randn(200) + 4

# Group data together
hist_data = [x1, x2]

group_labels = ['Control', 'Variant #1']

# Create distplot with custom bin_size
fig = ff.create_distplot(hist_data, group_labels, bin_size=.2)

fig.layout.update(
    title="Distribution of Outcomes by Test Group",
    font=dict(
        family="Courier New, monospace",
        size=14,
        color="#7f7f7f"
    ),
    autosize=False,
    width=900,
    height=500,
)

iplot(fig)