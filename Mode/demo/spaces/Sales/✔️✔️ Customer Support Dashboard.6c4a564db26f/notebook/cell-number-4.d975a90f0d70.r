time_df <- time_df %>%
mutate(DATE = ymd_hms(DATE),
DATE_BY_WEEK = floor_date(DATE, unit = "week", week_start = getOption("lubridate.week.start", 1)))