df = datasets[0]

import numpy as np
table = pd.pivot_table(df, values='count', index='origin_airport',
                    columns='destination_airport')
table = table.fillna(0).astype(int)