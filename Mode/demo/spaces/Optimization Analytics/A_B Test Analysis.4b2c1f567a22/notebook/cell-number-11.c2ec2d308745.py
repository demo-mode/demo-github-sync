    if p > .05:
        title = ("No significant difference"); color = ("#ff4848")
    elif p <= .05 and np.mean(a) > np.mean(b):
        title = ("Original sample mean is greater"); color = ("#ff4848")
    elif p <= .05 and np.mean(a) < np.mean(b):
        title = ("Variation #1 sample mean is greater"); color = ("#13c257")
    else: 
        title = ("Something went amiss"); color = ("#c9cad1")