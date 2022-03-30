# Credentials from a service account used to write to tables/datasets
credentials =  service_account.Credentials.from_service_account_info(
# ADD JSON KEY FROM SERVICE ACCOUNT HERE. YOU CAN GET THE JSON KEY BY FOLLOWING THESE INSTRUCTIONS
# https://cloud.google.com/iam/docs/creating-managing-service-account-keys
)

# The service account will need the following permissions

# BigQuery Job User
# Job Editor


# You can use bracket notion with the name of the query 
postgresql_data = datasets["Query 1"]
# Or you can use index position to return the results of the queries. Bracket Notion is more accurate but can break if the query name does not exist or if the query is excluded
# from the most recent run of a report. Index position will work if the targeted query does not change index positions. A query can change index positions when another query is 
# added or removed. Highly recommended to use bracket notion
bigQuery_data = datasets[1]



