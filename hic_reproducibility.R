##move all 2500000 resolution Hi-C matrices into one directory
hic_file_dir = "/home/imxman/Xray/Reproducibility"
hic_files = list.files(hic_file_dir)

rep_matrix = c()
for (f in hic_files) {
  hic = read.table(paste(hic_file_dir,f,sep = "/"),header = TRUE,sep = "\t",row.names = 1)
  hic[is.na(hic)]=0
  hic = log(hic+1)
  ##get correlation matrix
  hic = cor(hic,method = "spearman")#,use = "pairwise.complete.obs")
  hic[is.na(hic)]=0
  hic[lower.tri(hic)]=NA
  hic=unlist(hic)
  hic=hic[!is.na(hic)]
  rep_matrix = cbind(rep_matrix,hic)
}

rep_matrix = data.frame(rep_matrix)
colnames(rep_matrix)=gsub("__hg19__genome__C-2500000-iced.matrix.gz","",hic_files)

cor_matrix = cor(rep_matrix,method="spearman")

library(pheatmap)
pheatmap(cor_matrix)
