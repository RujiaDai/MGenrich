# MGenrich 
This R tool can facilitate the brain-cell marker genes enrichment analysis. It can provide statistic of overrepresentation test (pvalue, OR and overlapped number). 

## The marker gene pool includes:
1)marker genes from CellMarker database(Zhang et al. 2018)
2)commonly-used marker genes from databases, company, and literatures
3)gold-standard marker genes evaluated by multiple datasets

## The corresponding marker genesets are:
[1]cellmarker_mouse,[2]cellmarker_human
[3]commonly_used_human,[4]commonly_used_mouse
[5]gsm_mouse,[6]gsm_human

## Usage：
source ('MGenrich.r')

mlist<- #marker genes list
clist<- #tested gene list
n<-  # number of background genes, such as # of all genes inputted into differential expression analysis or  # of genes profiled in your data... if you don't have such information, please use n=25000 as default. 
x<-"" #name of mlist you choose

mger(mlist,clist,n,x)
Example: mger(cellmarker_human,my_clist,20000,"cellmarker_human")

## Output:
--ptable #pvalue of fisher test 
--otable #odds ratio
--ctable #number of overlap genes
