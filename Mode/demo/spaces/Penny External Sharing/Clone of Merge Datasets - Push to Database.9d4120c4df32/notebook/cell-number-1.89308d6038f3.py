datasets

! pip install pandas-gbq -t "/tmp" > /dev/null 2>&1

import pandas_gbq 
pd.options.display.max_rows = 20

print(pd.DataFrame.to_gbq)

from google.oauth2 import service_account
