library("labdsv")

otu2<-read.csv("/home/agustin/workspace/laura_metagenomica/analisis/figuras_taxonomia/genus.csv", header=TRUE, comment.char="#")
#otu2<-read.csv("/home/agustin/workspace/laura_metagenomica/analisis/figuras_taxonomia/family.csv", header=TRUE, comment.char="#")

SpringAguaFamily_t <- t(as.matrix(otu2[,2:9]))
colnames(SpringAguaFamily_t) <- otu2$Genus
SpringAguaFamily_t <- as.data.frame(SpringAguaFamily_t)
SpringAguaFamily_t[SpringAguaFamily_t==0]<-0.1
#Haceos lo mismo para estacion y locacion

#estacion
Status2<-c(1,2,1,2,1,2,1,2)
FamilySeason<-indval(SpringAguaFamily_t,Status2)

gr2<-FamilySeason$maxcls[FamilySeason$pval <= 0.05]
iv2<-FamilySeason$indcls[FamilySeason$pval <= 0.05]
pv2<-FamilySeason$pval[FamilySeason$pval <= 0.05]

indval_season_Family<-data.frame(group=gr2,indval=iv2,pvalue=pv2)
write.csv(indval_season_Family,"indval_season_Genus.csv")

summary(FamilySeason)

#locacion
Status3<-c(1,1,1,1,2,2,2,2)
FamilyLoc<-indval(SpringAguaFamily_t,Status3)

gr3<-FamilyLoc$maxcls[FamilyLoc$pval <= 0.05]
iv3<-FamilyLoc$indcls[FamilyLoc$pval <= 0.05]
pv3<-FamilyLoc$pval[FamilyLoc$pval <= 0.05]

indval_Loc_Family<-data.frame(group=gr3,indval=iv3,pvalue=pv3)
write.csv(indval_Loc_Family,"indval_Site_Genus.csv")

summary(FamilyLoc)
