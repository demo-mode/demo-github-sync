#investigating coefficients 

log_odds = logReg_model.coef_[0]

df = pd.DataFrame(log_odds, 
             X_train.columns, 
             columns=['coef'])\
            .sort_values(by='coef', ascending=False)
            
df.style.background_gradient(cmap='RdYlBu_r',vmin=0)


