europe<-read.table("europe.csv",dec=".",sep=";",quote="",header=TRUE)
summary(europe)
#boite � moustaches sous un format pdf
pdf(file="boxplot.pdf",width=6,height=6,onefile=TRUE,family="Helvetica",title="Europe boxplot",paper="special")
#boite � moustaches dans la fen�tre plots
boxplot(europe$X.Dur�e.heures..,ylab="Dur�e (heures)")
#afficher points moyenne heures de style triangle
points(1,mean(europe$X.Dur�e.heures..),pch=2)
dev.off()
