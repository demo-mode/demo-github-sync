#converting coefficients from log odds to odds 
odds = np.exp(logReg_model.coef_[0])

df_odds = pd.DataFrame(odds, 
             X_train.columns, 
             columns=['coef'])\
            .sort_values(by='coef', ascending=False)

df_odds.style.background_gradient(cmap='RdYlBu_r',vmin=0)