# Prerequisites: Install BiocManager if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

# List of Bioconductor and CRAN packages to install
biocPkgs <- c(
    "Rhtslib",
    "geneplotter",
    "pheatmap", # Assuming pheatmap is from CRAN for this context
    "DESeq2",
    "edgeR",
    "limma",
    "QUBIC",
    "impute",
    "preprocessCore",
    "AnnotationDbi",
    "RUVSeq",
    "EDASeq",
    "WGCNA",
    "multtest",
    "biomaRt"
)

cranPkgs <- c(
    "xml2",
    "rvest",
    "ComplexHeatmap", # Assuming ComplexHeatmap is from Bioconductor, but leaving it here for illustration
    "MAST"
)

# Install Bioconductor packages
BiocManager::install(biocPkgs, update = FALSE, ask = FALSE)

# Install CRAN packages
install.packages(cranPkgs)

# Define specific versions of some Bioconductor packages
versionSpecificPkgs <- c(
  "org.Hs.eg.db" = "3.12",
  "org.Mm.eg.db" = "3.12",
  "GO.db" = "3.12"
)

# Attempt to install version-specific packages
sapply(names(versionSpecificPkgs), function(pkg) {
  pkgVersion <- versionSpecificPkgs[pkg]
  BiocManager::install(pkgs = pkg, update = FALSE, ask = FALSE, version = pkgVersion)
})
