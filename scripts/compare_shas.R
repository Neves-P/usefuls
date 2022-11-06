shas <- read_local_sha(path)

shas$sha256 <- apply(shas, 1, convert_sha_base64)

read_sha <- readRDS("shas.rds")

dirname(read_sha[1,2])
read_sha$path <- gsub(".*LIMS*", "LIMS", read_sha[, 2])

apply()
rdms_lines <- readLines("C:/Users/pedro/Desktop/shas/ichksum-rdms-27064068.log")
rdms_shas <- data.frame(sha256 = character(), path = character())
for (i in 3:length(rdms_lines)) {
  if (grepl("C- ", rdms_lines[i])) {
    rdms_file_data_path <- paste0(
      "LIMS",
      gsub(".*LIMS*|\\:", "", rdms_lines[i]),
      "/",
      regmatches(rdms_lines[i + 1], regexec("    (.*?)    ", rdms_lines[i + 1]))[[1]][2]
    )
    rdms_sha256 <- sub(".*sha2:", "", rdms_lines[i + 1])
    rdms_shas <- rbind(rdms_shas, data.frame(rdms_sha256, rdms_file_data_path))
  }
}
read_sha$path %in% rdms_shas$rdms_file_data_path # Why so many FALSE?
