library(tidyverse)
library(ggplot2)

# Read the data from the CSV file
my_data <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vRpgoPFkcgMeJ_m-1rKnenuMSFnGRyaG8TGaTg8QQN_xJhkipGZ2kINQ35gtkyIRqMfSFjYVI3pXukR/pub?output=csv")

# Rename the columns
my_data <- my_data %>%
  rename(
    filling_time = 1,
    age_group = 2,
    fav_streaming_platform = 3,
    total_weekly_consumption = 4,
    device_used = 5,
    duration_of_music = 6,
    genre = 7
  )

# Defining custom color palettes
platform_colors <- c("Spotify" = "#1DB954", "Apple Music" = "#141111", "Yt Music" = "#FF0000", "Amazon Music" = "#3e08da", "Gaana" = "#ff5b00")
age_group_colors <- c("Under 18" = "#FFA07A", "18 - 21" = "#20B2AA", "22 - 30" = "#FF69B4", "31 - 45" = "#8A2BE2", "46 - 64" = "#00CED1", "65 and above" = "#FFD700")

# Barplot for the Streaming Platform Preference Distribution
plot1 <- my_data %>%
  ggplot() +
  geom_bar(aes(x = fav_streaming_platform, fill = fav_streaming_platform), stat = "count") +
  scale_fill_manual(values = platform_colors) +
  labs(
    title = "Streaming Platform Preference Distribution",
    subtitle = "My visualization shows that the most preferred streaming platforms among respondents are Spotify, Apple Music, and YT Music, with Spotify being the most popular.",
    x = "Streaming Platform",
    y = "Count",
    fill = "Platform"
  ) +
  theme_minimal()
ggsave("plot1.png", dpi = 100, width = 1200, height = 400, units = "px")

# Histogram of total weekly music consumption
plot2 <- my_data %>%
  ggplot() +
  geom_histogram(aes(x = total_weekly_consumption), binwidth = 5, fill = "skyblue", color = "black") +
  labs(
    title = "Weekly Viewing Habits",
    subtitle = "My visualization reveals that the majority of respondents consume music between 6 and 50 hours of content per week.",
    x = "Total Weekly Consumption (hours)",
    y = "Count"
  ) +
  theme_minimal()
ggsave("plot2.png", dpi = 110, width = 1200, height = 400, units = "px")

# Scatterplot to show the relationship between age group and duration of music
plot3 <- my_data %>%
  ggplot() +
  geom_jitter(aes(x = age_group, y = duration_of_music, color = age_group), width = 0.2, height = 0) +
  scale_color_manual(values = age_group_colors) +
  labs(
    title = "Duration of Musical Content Preference vs. Age Group",
    subtitle = "This visualization shows the relationship between musical content duration preferences and age groups.",
    x = "Age Group",
    y = "Duration of Music (seconds)",
    color = "Age Group"
  ) +
  theme_minimal()
ggsave("plot3.png", dpi = 110, width = 1200, height = 400, units = "px")

# Density Plot to show the distribution of music duration by age group
plot4 <- my_data %>%
  ggplot() +
  geom_density(aes(x = duration_of_music, fill = age_group), alpha = 0.5) +
  scale_fill_manual(values = age_group_colors) +
  labs(
    title = "Distribution of Music Duration",
    subtitle = "This visualization reveals that different age groups have varied preferences for the duration of music they consume.",
    x = "Duration of Music (seconds)",
    y = "Density",
    fill = "Age Group"
  ) +
  theme_minimal()
ggsave("plot4.png", dpi = 110, width = 1200, height = 400, units = "px")

# Boxplot to compare the duration of music across streaming platforms
plot5 <- my_data %>%
  ggplot() +
  geom_boxplot(aes(x = fav_streaming_platform, y = duration_of_music, fill = fav_streaming_platform)) +
  scale_fill_manual(values = platform_colors) +
  labs(
    title = "Duration of Music across Streaming Platforms",
    subtitle = "This visualization compares the duration of music consumption across different streaming platforms.",
    x = "Streaming Platform",
    y = "Duration of Music (seconds)",
    fill = "Platform"
  ) +
  theme_minimal()
ggsave("plot5.png", dpi = 110, width = 1200, height = 400, units = "px")

