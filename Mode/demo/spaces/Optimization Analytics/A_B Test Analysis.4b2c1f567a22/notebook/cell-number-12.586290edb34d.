confidence_interval = 0.95

ci95_0 = map(max, zip(st.t.interval(confidence_interval, len(df0.signup)-1, loc=np.mean(df0.signup), scale=st.sem(df0.signup))))
ci95_1 = map(max, zip(st.t.interval(confidence_interval, len(df1.signup)-1, loc=np.mean(df1.signup), scale=st.sem(df1.signup))))

ci80_0 = map(max, zip(st.t.interval(0.8, len(df0.signup)-1, loc=np.mean(df0.signup), scale=st.sem(df0.signup))))
ci80_1 = map(max, zip(st.t.interval(0.8, len(df1.signup)-1, loc=np.mean(df1.signup), scale=st.sem(df1.signup))))