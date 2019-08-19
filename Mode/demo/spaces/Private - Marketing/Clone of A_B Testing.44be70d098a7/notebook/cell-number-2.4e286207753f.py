import numpy as np, scipy.stats as st

df = datasets["Raw outcomes"]

df0 = df[df['variation_name'] == 'Original']
df1 = df[df['variation_name'] == 'Variation #1']