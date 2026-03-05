# Set file Directory ----
# Change this code file path with your own
setwd("C:/Users/joeyg/Documents/School/2cd yr Standing/DM 1/Research/MidTerm-Groupings/DataSet/predict+students+dropout+and+academic+success")

# Check files in the folder
# It should have the only file data.csv
list.files()


# Load Dataset ----
# Dataset uses semicolon separator
data <- read.csv("data.csv", sep=";", header=TRUE)

# Check dataset
head(data)
str(data)
summary(data)

# Show column names
colnames(data)


# Convert categorical variables ----
# (R automatically replaces spaces with dots, Annoying)
data$Gender <- as.factor(data$Gender)
data$Target <- as.factor(data$Target)
data$Marital.status <- as.factor(data$Marital.status)
data$Course <- as.factor(data$Course)
data$Daytime.evening.attendance. <- as.factor(data$Daytime.evening.attendance.)
data$International <- as.factor(data$International)
data$Scholarship.holder <- as.factor(data$Scholarship.holder)


# Descriptive statistics ----
# Numeric Variable - Admission Grade
mean(data$Admission.grade, na.rm=TRUE)
median(data$Admission.grade, na.rm=TRUE)
sd(data$Admission.grade, na.rm=TRUE)
IQR(data$Admission.grade, na.rm=TRUE)
summary(data$Admission.grade)


# Histogram ----
hist(data$Admission.grade,
     main="Histogram of Admission Grade",
     xlab="Admission Grade",
     col="skyblue",
     border="black")


# Boxplot (Group Comparison) ----
boxplot(Admission.grade ~ Gender,
        data=data,
        main="Admission Grade by Gender",
        xlab="Gender",
        ylab="Admission Grade",
        col=c("pink","lightblue"))


# Barchart (Categorical Counts) ----
barplot(table(data$Target),
        main="Student Outcome Distribution",
        xlab="Student Status",
        col="orange")


# Scatterplot ----
plot(data$Age.at.enrollment,
     data$Admission.grade,
     main="Age vs Admission Grade",
     xlab="Age at Enrollment",
     ylab="Admission Grade",
     pch=19,
     col="blue")


# Normality test ----
shapiro.test(data$Admission.grade)


# Interpretation ----
# If p-value > 0.05
# Data is normally distributed

# If p-value < 0.05
# Data is NOT normally distributed