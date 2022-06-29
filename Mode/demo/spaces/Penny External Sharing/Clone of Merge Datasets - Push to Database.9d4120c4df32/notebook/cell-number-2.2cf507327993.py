credentials =  service_account.Credentials.from_service_account_info(
{
  "type": "service_account",
  "project_id": "jontestproject2",
  "private_key_id": "85a90a39e1e62c49bab843549cc8f16a19b867eb",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCswGK709VsKmCf\npEK2+4NyQGkWP4VLaidWUSVR2LlAINo61EnzukNWQQH2194Ukc8JSV30l6PXGTg7\nUJUpSo45c6j787dR1aZZeRrjVAxEigyCw+KaSW63CvAR1guckxBFLasNGRnKTZIU\nmgRKX6a5VBxG5dPOqOVniLw0u39gdSGRnGkidsiIr4OBoVrMKJM+EaTBjEGZ1Dhe\nDUSrlWQ2xri4ZRS0FS61W+e/TkWPpsr/lZlZS/MKDyiVRvmGkWV4m9SI0KgfRuRY\nQEMUh4KTNKy1XSFJw1ebBYTvstPxUZlaaKEN7YzEEf0nfxcqNV+dtskkSEFGYaFG\n8Xhum7xfAgMBAAECggEATChUXrG4uQLFrhtgPgMLo+a5bVF7lg+qX+dOKJL+uELD\ncoP8RjKrVO87ynLIORE+0L1Dan0fgchgfeW8nIN9x94xdUGwY6dourElJWr8LYse\nkNeCoroU0SVFSNewLsq2tYi4jAGw2Prxl5t+oLsiaTmnbaoMgmL7H3WsYyL1uLOw\nWBDukwmPU7J8CPDZAO1bfFtGWirQgQXlBPv662peNrIQvAxwEjK53jyKviNScnPT\nlPCSsQp5YNjJeqOzm5OtzdYxDlEcR6cvdV5INbVWPiIwyYH/RqceVfI3UKNcklEr\nsf6TaxfJ+Cnzj3HfMXnfYYGemnQzaYRIN9PRADJSoQKBgQDny6/44dx3pt7PFZR+\n11pPTDiWTwOhP1TT4A4BdkUi0Gk7eqZXBmooneS2ix4MHkjKlTSGvpbwT4527Zxv\nXM0Po9NIsu89RntdEXDprty3qWhPspKLLnTfStm28wDiqJnYVIjJLEwoG7T4AwS4\nPfI3P6GIm950UUHZBYN/8QN9HQKBgQC+yley9IHE1plz2enlVTAeOAjhLLzGGd1w\nO8gvnS7/AccBkGvyUoViKY4mcOsSOlctvVAZXAjhmJCxe5nTkhR+XSFNvGnrEgoF\naTWD9qXm6tuT4NkugMG4PeDDFLyZlbfy5dB79vA1IUID9eTjF9jStXmWnyR1eHnl\nkL/MuB2yqwKBgAyLlqOWvdLwAiEdHuNajnW6P1nLPvwMLHAnMTrdBtLiir+AXN5a\n54X5PbavgtnPDcuBFc2xJQQumhxPsebJFAQjrrzBinc7iFO6LO1I3ININPATTyEf\nS44GRBBFyKd7zo/Jy3lv31NQZJQDvc6m86QP2pNFNF4BQ9oWFU7oYXL1AoGAXUz0\nQDZj84+CcW4ifJ0BL/X1GbDYDASADq+dgPNcFSaYXEJ1F4aVZeCufEwCGOLg2SRY\nNF6WlUQXlkO8gQNR9E20yKAYJ/WlYuoFWqhWjytQ/+sYKi6bDW9tJ9lPNchKsYUD\nRGwJIeJGt0sbiJaT2M8YS7k9ihjFe6citIlhNIsCgYEAigXdHxUQHGEq79qxwT4g\nVGLeyezpowC2uPqB5CC9kKS3I30wjJ9GQvVy41+D/JFO2ASIM0giCbbNbD9+ObL2\nwVs36+K4TDMaM0eeX21tkSspD1+iOt7s7oMNWwMcvXpqVR0UTB8Elp4CtYmGMbBX\nuH+dRfdVgQXY4RdFpSOfQnM=\n-----END PRIVATE KEY-----\n",
  "client_email": "python-script@jontestproject2.iam.gserviceaccount.com",
  "client_id": "108475862784593099012",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/python-script%40jontestproject2.iam.gserviceaccount.com"
}
)


# You can use bracket notion with the name of the query 
postgresql_data = datasets["Query 1"]
# Or you can use index position to return the results of the queries. Bracket Notion is more accurate but can break if the query name does not exist or if the query is excluded
# from the most recent run of a report. Index position will work if the targeted query does not change index positions. A query can change index positions when another query is 
# added or removed. Highly recommended to use bracket notion
bigQuery_data = datasets[1]



