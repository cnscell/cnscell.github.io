#!/usr/bin/env R

# Author:		kai WANG
# Email:		charles.k.w@aliyun.com
# Version:	V2022.08.19

# options(echo = TRUE) # print commands in output file

args <- commandArgs(trailingOnly = TRUE)
if(length(args) != 4){
	print ("Usage: Rscript immune.R method gene_expression_matrix.txt cell_type.txt image_output.pdf")
	print ("       methods: mcp_counter, epic, quantiseq, xcell, cibersort, cibersort_abs, timer, consensus_tme, abis, estimate")
	quit()
}

c_frc_method = args[1];
g_exp_matrix = args[2];
c_out_types  = args[3];
f_out_image  = args[4];

library(ggplot2)
library(immunedeconv)
library(tidyr)

exprMatrix <- read.table(file = g_exp_matrix, header = TRUE, sep = "\t", row.names = 1)
#exprMatrix[1:4,1:4]

#method可选: quantiseq, timer, cibersort, cibersort_abs, mcp_counter, xcell, epic, abis, consensus_tme, estimate
result <- deconvolute(exprMatrix, method = c_frc_method, tumor = TRUE)
write.table(x = result, file = c_out_types, sep = "\t", col.names = T, row.names = F, quote = F)

dat <- result %>% gather(sample, fraction, -cell_type)

p <- ggplot(data = dat, mapping = aes(x = sample, y = fraction, fill = cell_type)) + 
	geom_bar(stat = 'identity') +
	coord_flip() +
	scale_fill_brewer(palette = "Paired") +
	scale_x_discrete(limits = rev(levels(result)))
  
#ggsave(filename = f_out_image, plot = p, device = "pdf", width = 17, height = 18, units = "cm")
ggsave(filename = f_out_image, plot = p, device = "pdf")

