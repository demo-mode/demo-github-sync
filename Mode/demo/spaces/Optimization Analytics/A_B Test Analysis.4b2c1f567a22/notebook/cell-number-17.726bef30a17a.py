confidence_interval = 0.95

ci95_0 = map(max, zip(st.t.interval(confidence_interval, len(df0.trial)-1, loc=np.mean(df0.trial), scale=st.sem(df0.trial))))
ci95_1 = map(max, zip(st.t.interval(confidence_interval, len(df1.trial)-1, loc=np.mean(df1.trial), scale=st.sem(df1.trial))))

ci80_0 = map(max, zip(st.t.interval(0.8, len(df0.trial)-1, loc=np.mean(df0.trial), scale=st.sem(df0.trial))))
ci80_1 = map(max, zip(st.t.interval(0.8, len(df1.trial)-1, loc=np.mean(df1.trial), scale=st.sem(df1.trial))))