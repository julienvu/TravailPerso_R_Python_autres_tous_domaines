
#europe.csv exercice
#Nombre d'heures travaill�es par semaine dans les pays U.E
#personnes ayant un emploi � plein temps(Open Data de l'office statistique de l'UE)
#lien de l'Open Data :https://ec.europa.eu/eurostat/web/products-datasets/-/tps00071

#nettoyer les objets et les graphiques 
rm(list=objects())
graphics.off()
europe<-read.table("europe.csv",dec=".",sep=";",quote="",header=TRUE)
#statistiques de base avec summary pour europe
summary(europe)
#6 premi�res lignes du tableau europe
head(europe)
payseurope<-europe$X.Pays.
#moyenne temps de travail hebdomadaire de tous les pays de l'UE
moydureeue<-mean(europe$X.Dur�e.heures..)
#med temps de travail hebdomadaire de tous les pays de l'UE
meddureeue<-median(europe$X.Dur�e.heures..)
#affichage table europe
print(europe)
#affichage colonne pays u.e
print(payseurope)
tempstravaileurope<-europe$X.Dur�e.heures..
#affichage colonne temps travail u.e
print(tempstravaileurope)
#variance 
var(europe$X.Dur�e.heures..)#1.23: petite variance 

#temps de travail maximal de europe
maxtempstravail<-max(europe$X.Dur�e.heures..)
print(maxtempstravail)

#temps minimal de europe
mintempstravail<-min(europe$X.Dur�e.heures..)
print(mintempstravail)

#�tendue de europe
diffheure<-maxtempstravail-mintempstravail
print(diffheure)

#renvoyer les lignes de europe ayant la valeur maximale du temps de travail
subset(europe,X.Dur�e.heures..==maxtempstravail)
#Les autrichienn.e.s et les grecqu.e.s ont la dur�e du temps de travail hebdomadaire la plus �lev�e
#renvoyer les lignes de europe ayant la valeur minimale du temps de travail
subset(europe,X.Dur�e.heures..==mintempstravail)
#Les lithuanien.nes ont la dur�e de temps de travail  la plus faible


#faire un damier en faisant une matrice � 2 lignes et 3 �crans
m<-matrix(0:3,nrow=2,byrow=TRUE)
layout(m)
#r�glage des marge mar et oma(outer margin area)
par(oma=rep(2,4),mar=rep(2,4))
#boite � moustaches dans la fen�tre plots
boxplot(europe$X.Dur�e.heures..,ylab="Temps de travail dans l'UE (en heures)", main="Distribution des donn�es")
#afficher points moyenne heures de style triangle
points(1,mean(europe$X.Dur�e.heures..),pch=2)
payseurope<-europe$X.Pays.
neweuropeclassement<-europe[order(europe$X.Dur�e.heures..,decreasing=TRUE),]
print(neweuropeclassement)
tempstravaileuropetri<-neweuropeclassement$X.Dur�e.heures..
#histogramme temps de travail UE avec bordure noire/bleue et couleur des donn�es violette
barplot(europe$X.Dur�e.heures..,ylim=c(0,50),border="dark blue",col="green",ylab="Temps de travail dans l'UE(en heures)",names.arg=row.names(europe),main="Repr�sentation du temps de travail /pays")
#tracer ligne horizontale au niveau de la moyenne de la dur�e de travail en couleur orange
abline(h=mean(tempstravaileurope),col="purple")
#histogramme tri� par temps de travail d�croissant
barplot(neweuropeclassement$X.Dur�e.heures..,ylim=c(0,50),border="dark blue",col="green",ylab="Temps de travail dans l'UE(en heures)",names.arg=row.names(neweuropeclassement),main="Repr�sentation tri�e selon la dur�e du travail")
#tracer ligne horizontale au niveau de la moyenne de la dur�e de travail en couleur orange
abline(h=mean(tempstravaileuropetri),col="purple")


#donn�es europe class�es selon le temps de travail par ordre d�croissant
neweuropeclassement<-europe[order(europe$X.Dur�e.heures..,decreasing=TRUE),]
print(neweuropeclassement)
#extraire pays dont la dur�e du temps de travail inf�rieure � la moyenne de temps de travail
inflistepaysmoy<-subset(europe,X.Dur�e.heures..<moydureeue)
print(inflistepaysmoy)
#nombre de pays en dessous de la moyenne de dur�e de travail hebdomadaire U.E
nrow(inflistepaysmoy)#15 pays comptabilis�s
#extraire pays dont la dur�e du temps de travail est inf�rieure � la m�diane
inflistepaysmed<-subset(europe,X.Dur�e.heures..<meddureeue)
print(inflistepaysmed)
#nombre de pays en dessous de la mediane de dur�e de travail hebdomadaire U.E
nrow(inflistepaysmed)#12 pays comptabilis�s
