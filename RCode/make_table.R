library(MetaComp)
#
# make a metacomp filelist
ll <- list.files("../data/", pattern = "*.tsv", full.names = T)
files <- data.frame(names = gsub(".*/(.*)_gottcha2-speDB-refseq.tsv$", "\\1", ll), files = ll)
write.table(files, file="../file_list.txt", col.names = F, row.names = F, quote = F)
#
#
dd <- load_gottcha2_assignments("../data/file_list.txt")
#
#
merged <- merge_gottcha_assignments(dd)
#
#
str(merged)
unique(merged$LEVEL)
#
plot_merged_assignment(assignment = merged,
                       taxonomy_level = "genus",
                       plot_title = "HMP subset, GOTTCHA2 genus assignment", filename = "test")
#
#
write.table(merged, file="../merged_assignment.txt", col.names = T, row.names = F, quote = T)
