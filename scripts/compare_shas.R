shas <- read_local_sha(path)

shas$sha256 <- apply(shas, 1, convert_sha_base64)

