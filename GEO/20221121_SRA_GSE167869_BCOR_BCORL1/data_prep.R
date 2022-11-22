library(tidyverse)

dat <- read.csv("/Users/sajesanaryal/Downloads/metadata.csv") %>%
  rename_all(., ~c("SRR", "sample")) %>%
  mutate(sample=gsub("; Homo sapiens; RNA-Seq", "", sub(".*:", "", dat$sample), "" )) %>%
  mutate(sample=gsub(" ", "", dat$sample)) %>%
  mutate(sample=gsub("RNA-seq", "", dat$sample)) %>%
  mutate(rep = case_when(as.numeric(gsub("SRR", "", dat$SRR)) > 13800736 ~2,
         TRUE~1)) 

dat.se <- dat[1:6,] %>%
  select(-rep) %>%
  mutate(fastq_1=paste0("./rawdata/",SRR, ".fastq.gz")) %>%
  add_column(fastq_2= "") %>%
  add_column(strandedness= "forward") %>%
  select(-SRR)

dat.pe <- dat[7:nrow(dat),] %>%
  select(-rep) %>%
  mutate(fastq_1=paste0("./rawdata/", SRR,"_", 1, ".fastq.gz")) %>%
  mutate(fastq_2=paste0("./rawdata/", SRR,"_", 2, ".fastq.gz")) %>%
  add_column(strandedness= "unstranded") %>%
  select(-SRR)

dat.nextflow <- rbind(dat.se, dat.pe)

write.csv(dat.nextflow, "samplesheet.csv", row.names = F, quote = F)
