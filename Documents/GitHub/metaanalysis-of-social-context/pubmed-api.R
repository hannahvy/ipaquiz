# Import easyPubMed library

library(easyPubMed)
new_PM_query <- "(ANXIETY [TI]
AND SOCIAL ANXIETY [TI]
AND PERFORMANCE ANXIETY [TI]
AND (2010[PDAT]:2013[PDAT])"
out.B <- batch_pubmed_download(pubmed_query_string = new_PM_query, dest_file_prefix = "socialanxiety_sample_new")
# Retrieve the full name of the XML file downloaded in the previous step
new_PM_file <- out.B[1]
new_PM_df <- table_articles_byAuth(pubmed_data = new_PM_file, included_authors = "first", max_chars = 0)

# Print resulting data frame
new_PM_df$address <- substr(new_PM_df$address, 1, 28)
new_PM_df$jabbrv <- substr(new_PM_df$jabbrv, 1, 9)
new_PM_df[1:10, c("pmid", "year", "jabbrv", "lastname", "address")] %>%
  kable() %>% kable_styling(bootstrap_options = 'striped')

