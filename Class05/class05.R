#' ---
#' title: "Class 5: Data visualization and graphics in R"
#' author: "Jenny Waters"
#' date: "January 22nd, 2020"
#' output: github_document
#' ---

# Section 2A
# Read the data table into R
weight <- read.table("class5_data/weight_chart.txt", header = TRUE)
plot(weight$Age, weight$Weight, type = "o", pch = 15, lwd = 2, cex = 1.5, ylim = c(2, 10), xlab = "Age (months)", ylab = "Weight (kg)", main = "Baby weight with age", col = "blue")

# 2B: Dot Chart
mouse <- read.table("class5_data/feature_counts.txt", header = TRUE, sep = "\t")
dotchart(mouse$Count, labels = mouse$Feature)

#2B: Bar Chart
par(mar = c(5,11,4,2))
barplot(mouse$Count, col = "blue", names.arg = mouse$Feature, horiz = TRUE, las = 1, xlim = c(0, 80000), main = "Number of feature in the mouse GRCm38 genome")

# Colors in plots
par(mar = c(6, 5, 4, 2))
genders <- read.delim("class5_data/male_female_counts.txt")
barplot(genders$Count, col=rainbow(10), names.arg = genders$Sample, las=2, ylab = "Counts", ylim = c(0, 20), main = "Mouse counts by gender")