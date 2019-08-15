setwd("~/Desktop/semester4/advanced issues 2/matt frank/class1/data_berka (1)")
rm(list=ls())
trans<-read.csv("trans.asc",sep=";")
colnames(trans)

#Q2a: Which transactions have amounts over $10,000 and in miltiples of $100?
ans2a<-subset(trans,(amount>=10000)&(amount%%100==0))

#Q3a: Which transactions have amounts between $9,000 and $10,000?
ans3a<-subset(trans,(amount>=9000)&(amount<=10000))
frequency2a<-table(ans2a$account_id)

#Q2b: Which users have at least 2 transactions with amounts over $10,000 and in multiples of $100?
ans2b<-subset(as.data.frame(frequency2a),Freq>=2)

#Q3b: Which users have at least 3 transactions with an amount between $9,000 and $10,000?
frequency3a<-table(ans3a$account_id)
ans3b<-subset(as.data.frame(frequency3a),Freq>=3)

#Q2c: Of the transactions identified in 2a, which ones had an account identified in 2b?
ana2c<-subset(ans2a,is.element(ans2a$account_id,ans2b$Var1))

#Q3c: Of the transactions identified in 3a, which ones had an account identified in 3b?
ans3c<-subset(ans3a,is.element(ans3a$account_id,ans3b$Var1))

#Q2d：Which are the transactions that have Both- 
# 1)amounts over $10,000 and in multiples of $100 from May 1998 and
# 2)a user id associated with at least two transactions of that type?
ans2dd<-subset(trans,(amount>=10000)&(amount%%100==0)&(date>=980501)&(date<=980531))#Question2d
ans2d<-subset(ans2dd,is.element(ans2dd$account_id,ans2b$Var1))

#Q3d: Which are the transactions that have Both-
#1)amnounts between $9,000 and $10,000 from May 1998 and
#2)a user id associated with at leat three transactions of that type?
ans3dd<-subset(trans,(amount>=9000)&(amount<=10000)&(date>=980501)&(date<=980531))#Question3d
ans3d<-subset(ans3dd,is.element(ans3dd$account_id,ans3b$Var1))
> 