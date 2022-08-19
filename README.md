# immune
Tumor immune infiltration analysis


使用immunedeconv估算免疫细胞比例
immunedeconv 整合了多种免疫浸润分析方法，包括quantiseq, timer, cibersort, cibersort_abs, mcp_counter, xcell, epic, abis, consensus_tme, estimate等。


下载安装immunedeconv软件包

https://github.com/icbi-lab/immunedeconv

conda install -c bioconda r-immunedeconv
或者

install.packages("remotes")
remotes::install_github("omnideconv/immunedeconv")


列出所有方法：

> deconvolution_methods
      MCPcounter             EPIC        quanTIseq            xCell 
   "mcp_counter"           "epic"      "quantiseq"          "xcell" 
       CIBERSORT CIBERSORT (abs.)            TIMER     ConsensusTME 
     "cibersort"  "cibersort_abs"          "timer"  "consensus_tme" 
            ABIS         ESTIMATE 
          "abis"       "estimate" 



Usage:
Rscript immune.R quantiseq GRCH38P14M.txt cell_type.txt image_output.pdf
