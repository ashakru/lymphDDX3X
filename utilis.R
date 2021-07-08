require(RColorBrewer)
# # Colour palettes
divergingPal <- c(brewer.pal(11, "Spectral"), "grey")
divergingPal_long <- c("grey",
                       brewer.pal(9, "YlOrRd")[c(3,5,7,9)],
                       brewer.pal(9, "YlGnBu")[c(2,3,4,5,6,7,8,9)],
                       brewer.pal(9, "YlGn")[c(8,7,5)],
                       brewer.pal(9, "PuRd")[c(3,5,6,7)],
                       brewer.pal(9, "BuPu")[c(9,8,7,6,5,4,3,2)])

divergingPalFull <- divergingPal_long[c(5,4,3,2,6,7,16:14,13:8,17:30)]
divergingPalMed <- divergingPal_long[c(5,4,3,2,13:8,7,16:14,17:28)]

# # Vectrorized strsplit  
splitvec <- function(vector, split, select, merge = "_"){
  processed <- sapply(vector, function(x){
    separated <- unlist(strsplit(x, split = split))[select]
    if (length(separated) > 1){
      return(paste(separated, collapse = merge))
    } else
      return(separated)
    })
  processed <- unname(processed)
  return(processed)
}

# # Style for barplots
nature_barplot <- function(base_size = 11,
                           base_family = "",
                           base_line_size = base_size / 170,
                           base_rect_size = base_size / 170){
  theme_classic(base_size = base_size, 
                base_family = base_family,
                base_line_size = base_line_size) %+replace%
    theme(panel.border= element_blank(),
          axis.title.x = element_text(color="black", size=15, margin = margin(t=0, r=5, b=0, l=0)),
          axis.title.y = element_text(color="black", size=15, angle = 90, margin = margin(t=0, r=5, b=0, l=0)),
          axis.text.y = element_text(color="black", size=15, hjust=0.95,vjust=0.2),
          axis.text.x = element_text(color="black", size=15),
          #axis.line.x = element_line(color="black", size = 0.5),
          #axis.line.y = element_line(color="black", size = 0.5, hjust = 1),
          axis.ticks.y = element_blank(),
          #axis.ticks.x = element_blank(),
          legend.title = element_text(color="black", size=15),
          legend.text = element_text(color="black", size=15),
          legend.position = "right",
          strip.text = element_text(color="black", size=15, margin = margin(2,0,2,0, "mm")))
} 

nature_point <- function(base_size = 11,
                         base_family = "",
                         base_line_size = base_size / 22,
                         base_rect_size = base_size / 22){
  theme_classic(base_size = base_size, 
                base_family = base_family,
                base_line_size = base_line_size) %+replace%
    theme(panel.grid.major = element_line(colour = "grey",size=0.2),
          panel.grid.minor = element_line(colour = "grey",size=0.1),
          strip.text = element_text(color="black", size=11, margin = margin(2,0,2,0, "mm")))
} 

# # TMM normalization
tmm <- function(counts_matrix){
  require(edgeR)
  DGE <- edgeR::DGEList(counts_matrix)
  tmmTab <- edgeR::calcNormFactors(DGE, method="TMM")
  tmmTab <- edgeR::cpm(tmmTab)
  return(tmmTab)
}

# # Function to compute TPM  
tpm <- function(counts, lengths) {
  density <- counts/lengths
  tpm <- t( t(density) * 10^6 / colSums(density, na.rm = T))
  return(tpm)
}


# # Low counts filtering  
remove_low <- function(counts, min_counts, min_samples, annotcolumns=c()){
  cols <- (1:ncol(counts))[!(1:ncol(counts) %in% annotcolumns)]
  select <- rowSums(counts[,cols] > min_counts) > ceiling(min_samples*dim(counts[,cols])[2])
  counts_df <- as.data.frame(counts[select,])
  return(counts_df)
}

# # Wraper for Gene Ontology Anlaysis (simple case scenario)
# Functions 
doGO <- function(signifList, universeList, name){
  
  toSave <- c()
  ontologies <- c("BP","CC", "MF")
  ontologyTab <- tibble()
  
  for (o in 1:3){
    goTab<- enrichGO(gene = as.character(signifList),
                     universe = as.character(universeList),
                     OrgDb = org.Hs.eg.db,
                     ont = ontologies[o],
                     pAdjustMethod = "BH",
                     pvalueCutoff = 0.1,
                     qvalueCutoff = 0.2,
                     readable = T, minGSSize = 5)
    
    goTab <- as.data.frame(goTab) %>%
      separate(GeneRatio, c("n", "N"), "/", remove = F) %>%
      separate(BgRatio, c("b", "B"), "/", remove = F) %>%
      mutate(n = as.numeric(n),
             N = as.numeric(N),
             b = as.numeric(b),
             B = as.numeric(B),
             EnrichmentScore = (n/N)/(b/B))  %>%
      # filter(n > 10,
      #         b > 20)  %>% 
      arrange(desc(EnrichmentScore)) %>%
      mutate(group = paste("GO", ontologies[o]),
             status = name,
             sample = "U2932") 
    
    toSave <- goTab
    
    if(nrow(ontologyTab) == 0){
      ontologyTab <- toSave
    } else {
      ontologyTab <- ontologyTab %>%
        full_join(toSave)
    }      
  }
  return(ontologyTab)
}

tableOrder <- function(vector, decreasing = F){
  tab <- table(vector)
  order <- names(tab)[order(as.numeric(tab), 
                            decreasing = decreasing)]
  return(order)
}
