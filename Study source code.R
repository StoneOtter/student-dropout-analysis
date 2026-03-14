# Set file Directory ----
# Change this code file path with your own
setwd("C:/Users/joeyg/Documents/School/2cd yr Standing/DM 1/Research/MidTerm-Groupings/DataSet/predict+students+dropout+and+academic+success")

# Check files in the folder
# It should have the only file data.csv
list.files()


# Load Dataset ----
# Import dataset using semicolon separator since the dataset uses ";" instead of ","
data <- read.csv("data.csv", sep=";", header=TRUE)

# Inspect dataset structure and summary statistics to understand variable types and values
# Display first rows of the dataset
head(data)
# Display structure of dataset (data types and variables)
str(data)
# Generate summary statistics for all variables
summary(data)

# Show column names
colnames(data)


# Convert categorical variables ----
# (R automatically replaces spaces with dots, Annoying)
# Convert categorical variables to factor type so R treats them as categories instead of numbers
data$Gender <- as.factor(data$Gender)
data$Target <- as.factor(data$Target)
data$Marital.status <- as.factor(data$Marital.status)
data$Course <- as.factor(data$Course)
data$Daytime.evening.attendance. <- as.factor(data$Daytime.evening.attendance.)
data$International <- as.factor(data$International)
data$Scholarship.holder <- as.factor(data$Scholarship.holder)


# Data Normalization ----
# Apply Z-score normalization to Admission Grade
# This standardizes the values so the mean becomes 0 and standard deviation becomes 1
data$Admission.grade.z <- scale(data$Admission.grade)


# Descriptive statistics ----
# Numeric Variable - Admission Grade
mean(data$Admission.grade, na.rm=TRUE)
median(data$Admission.grade, na.rm=TRUE)
sd(data$Admission.grade, na.rm=TRUE)
IQR(data$Admission.grade, na.rm=TRUE)
summary(data$Admission.grade)


# Histogram Original Grade ----
hist(data$Admission.grade,
     main="Histogram of Admission Grade",
     xlab="Admission Grade",
     col="skyblue",
     border="black")


# Histogram of Z-score normalized Admission Grade ----
hist(data$Admission.grade.z,
     main="Histogram of Z-Score Normalized Admission Grade",
     xlab="Z-score Admission Grade",
     col="lightgreen",
     border="black")


# Boxplot by gender (Group Comparison) ----
boxplot(Admission.grade ~ Gender,
        data=data,
        main="Admission Grade by Gender",
        xlab="Gender",
        ylab="Admission Grade",
        col=c("pink","lightblue"))


# Boxplot of Z-score normalized Admission Grade ----
boxplot(data$Admission.grade.z,
        main="Boxplot of Z-Score Normalized Admission Grade",
        ylab="Z-score Admission Grade",
        col="lightgreen")


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

# Parametric Test: Pearson Correlation ----
# Test the relationship between Age at Enrollment and Admission Grade
cor.test(data$Age.at.enrollment,
         data$Admission.grade,
         method="pearson")

# Non-Parametric Test: Chi-Square Test ----
# Test the association between Gender and Student Outcome
chisq.test(table(data$Gender, data$Target))

# Interpretation ----
# If p-value > 0.05
# Data is normally distributed

# If p-value < 0.05
# Data is NOT normally distributed

# Since p-value < 0.05, we reject the null hypothesis of normality.
# Therefore, Admission Grade is not normally distributed.