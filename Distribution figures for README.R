library(ggplot2)
library(lubridate)
library(dplyr)
library(scales)

df <- arrow::read_feather("amazon_com_reviews_trustpilot_20261026_anon.feather")
head(df)

df$Review_Date <- as_datetime(df$Review_Date, tz = "UTC")

df$year <- year(df$Review_Date)

year <- df$year

year <- factor(year, levels = sort(unique(year)))

suma <- summary(year)

df_y <- data.frame(
  Year = names(suma),
  Count = unname(suma)
)

ggplot(df_y, aes(x = Year, y = Count)) +
  geom_col(color = "black", fill = alpha("deepskyblue3", 0.5)) +
  theme_minimal() +
  xlab("Year") +
  ylab("Number") +
  ggtitle("Yearly review counts") +
  scale_y_continuous(labels = label_comma()) +
  geom_text(inherit.aes = FALSE, data = df_y, aes(x = Year, y = Count, label = comma(Count)),
            nudge_y = +150)

ggsave("year_review_distribution.png", units = "cm", width = 24, height = 12,
       dpi = 900)


##########

scores <- df$Review_Score
scores <- factor(scores, levels = sort(unique(scores)))
suma <- summary(scores)
suma

df_s <- data.frame(
  Score = names(suma),
  Count = unname(suma)
)

ggplot(df_s, aes(x = Score, y = Count)) +
  geom_col(color = "black", fill = alpha("deepskyblue3", 0.5)) +
  theme_minimal() +
  xlab("Score") +
  ylab("Number") +
  ggtitle("Score distribution") +
  scale_y_continuous(labels = label_comma()) +
  geom_text(inherit.aes = FALSE, data = df_s, aes(x = Score, y = Count, label = comma(Count)),
            nudge_y = +700)

ggsave("score_distribution.png", units = "cm", width = 24, height = 12,
       dpi = 900)

#############################

countries <- df$User_Country
countries[!(countries %in% c("US", "GB", "CA"))] <- "Other"

countries <- factor(countries, levels = c("US", "GB", "CA", "Other"))

suma <- summary(countries)

df_c <- data.frame(
  Country = factor(names(suma), levels = c("US", "GB", "CA", "Other")),
  Count = unname(suma)
)

ggplot(df_c, aes(x = Country, y = Count)) +
  geom_col(color = "black", fill = alpha("deepskyblue3", 0.5)) +
  theme_minimal() +
  xlab("Country") +
  ylab("Number") +
  ggtitle("Review counts by country") +
  scale_y_continuous(labels = label_comma()) +
  geom_text(inherit.aes = FALSE, data = df_c, aes(x = Country, y = Count, label = comma(Count)),
            nudge_y = +500)

ggsave("country_review_distribution.png", units = "cm", width = 24, height = 12,
       dpi = 900)


######################

score <- df$Review_Score

mean(score)
n <- length(score)
sqrt(var(score) * (n - 1) / n)
min(score)
max(score)
quantile(score, prob = 0.25)
quantile(score, prob = 0.75)
median(score)
