confidence_interval = 0.95

ci95_0 = map(max, zip(st.t.interval(confidence_interval, len(df0.outcome)-1, loc=np.mean(df0.outcome), scale=st.sem(df0.outcome))))
ci95_1 = map(max, zip(st.t.interval(confidence_interval, len(df1.outcome)-1, loc=np.mean(df1.outcome), scale=st.sem(df1.outcome))))

ci80_0 = map(max, zip(st.t.interval(0.8, len(df0.outcome)-1, loc=np.mean(df0.outcome), scale=st.sem(df0.outcome))))
ci80_1 = map(max, zip(st.t.interval(0.8, len(df1.outcome)-1, loc=np.mean(df1.outcome), scale=st.sem(df1.outcome))))