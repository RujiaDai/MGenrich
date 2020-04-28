##marker genes enrichment analysis
##author: Rujia Dai
##date: 04/2020
##3-steps enrichment: 
##1)marker genes from CellMarker database(Zhang et al. 2018)
##2)commonly-used marker genes from databases, company, and literatures
##3)gold-standard marker genes evaluated by multiple datasets

load('cellmarker_list.Rdata')
# [1]cellmarker_mouse,[2]cellmarker_human
# [3]commonly_used_human,[4]commonly_used_mouse
# [5]gsm_mouse,[6]gsm_human


mger<-function(mlist,clist,n,setname){
    if(!is.list(clist)&&is.list(mlist)){
	print('iuput is not a list object!')
	}##make sure you're imputting is a list
	ptable<-data.frame()#pvalue of fisher test
	otable<-data.frame()#odds ratio
	ctable<-data.frame()#number of overlap genes
	for(i in 1:length(mlist)){
	  for(j in 1:length(clist)){
		x<-mlist[[i]]
		y<-clist[[j]]
		a1<-length(intersect(x,y))
		b1<-length(x)-a1
		c1<-length(y)-a1
		d1<-n-a1-b1-c1
		ptable[i,j]<-fisher.test(rbind(c(a1,b1),c(c1,d1)))$p.value
		ctable[i,j]<-a1
		otable[i,j]<-fisher.test(rbind(c(a1,b1),c(c1,d1)))$estimate
	}}

	colnames(otable)<-colnames(ptable)<-colnames(ctable)<-names(clist)
	rownames(otable)<-rownames(ptable)<-rownames(ctable)<-names(mlist)
	
	write.csv(ptable,paste0('mgEnrich_',setname,'_ptable.csv'))
	write.csv(ctable,paste0('mgEnrich_',setname,'_ctable.csv'))
    write.csv(otable,paste0('mgEnrich_',setname,'_otable.csv'))
}



mlist<- #marker genes list
clist<- #tested gene list
n<-  #background gene number
x<-"" #name of mlist you choose