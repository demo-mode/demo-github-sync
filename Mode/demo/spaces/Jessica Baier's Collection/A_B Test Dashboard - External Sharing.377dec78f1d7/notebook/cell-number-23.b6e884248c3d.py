confidence = [
         {'variation': 'Original', 'ci': min(ci95_0)},
         {'variation': 'Original', 'ci': max(ci95_0)},
         {'variation': 'Variation #1', 'ci': min(ci95_1)},
         {'variation': 'Variation #1', 'ci': max(ci95_1)},
         {'variation': 'Original', 'ci': min(ci80_0)},
         {'variation': 'Original', 'ci': max(ci80_0)},
         {'variation': 'Variation #1', 'ci': min(ci80_1)},
         {'variation': 'Variation #1', 'ci': max(ci80_1)}
         ]
df_c = pd.DataFrame(confidence)
df_c = df_c[np.isfinite(df_c['ci'])]