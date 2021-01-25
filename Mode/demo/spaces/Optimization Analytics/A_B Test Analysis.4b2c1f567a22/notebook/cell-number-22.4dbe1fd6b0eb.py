confidence_interval = 0.95

ci95_0 = map(max, zip(st.t.interval(confidence_interval, len(df0.conversion)-1, loc=np.mean(df0.conversion), scale=st.sem(df0.conversion))))
ci95_1 = map(max, zip(st.t.interval(confidence_interval, len(df1.conversion)-1, loc=np.mean(df1.conversion), scale=st.sem(df1.conversion))))

ci80_0 = map(max, zip(st.t.interval(0.8, len(df0.conversion)-1, loc=np.mean(df0.conversion), scale=st.sem(df0.conversion))))
ci80_1 = map(max, zip(st.t.interval(0.8, len(df1.conversion)-1, loc=np.mean(df1.conversion), scale=st.sem(df1.conversion))))