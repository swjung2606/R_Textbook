##### Chapter 4. Import files #####
library(readxl)

# Load excel file (!!! It doesn't work when the file is opening. So, close the file first!)
df = read_excel("C:/Users/sunjung/OneDrive - KLA Corporation/Documents/R/ANOVAAvg.xlsx", sheet=1)

head(df)
names(df) # It shows all columns
dim(df) # It show the size of df

unique(df$`Wafer ID`) # It show type of Wafer ID
nid_waferID <- table(df$`Wafer ID`) # It makes a new table for Wafer ID based on its count
nid_flyerX <- table(df$`Is Flyer X`) # By doing this, we can easily see how many flyers are there

barplot(nid_waferID, main="Count for each Wafer ID")



# Make the same dataset as a data frame
df1 = data.frame(df)

# Find Flyer mark information!!
subset(df1, Is.Flyer.X == "True")[15:18]
subset(df1, Is.Flyer.Y == "True")[15:18]

