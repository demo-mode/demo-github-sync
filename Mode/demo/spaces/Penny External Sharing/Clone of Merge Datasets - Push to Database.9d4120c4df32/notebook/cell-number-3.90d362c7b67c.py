
# Install the Google Cloud library
! pip install google.cloud -t "/tmp" > /dev/null 2>&1
# Import the BigQuery methods from Google
from google.cloud import bigquery

# Merge the dataframes listed above on the order_id 
new_df = pd.merge(postgresql_data, bigQuery_data, on='order_id')

# Call the bigquery.Client method along with the the JSON key listed in credentials
bigqueryClient = bigquery.Client(project="jontestproject2", credentials=credentials)\
# Add the dataset and table name that will receive the dataset. 
tableRef = bigqueryClient.dataset("customer_1").table("notebook2")


dataTypeSeries = new_df.dtypes

df3 = pd.DataFrame(new_df)

bigqueryJob = bigqueryClient.load_table_from_dataframe(df3, tableRef)
bigqueryJob.result()