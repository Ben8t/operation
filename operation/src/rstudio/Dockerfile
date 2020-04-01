FROM atavares/rocker-geospatial-magick

# Install R dependencies
RUN apt-get update -y && \
    apt-get install libssl-dev -y && \
    apt-get install libmagick++-dev -y && \
    apt-get install libcurl4-openssl-dev -y && \
    apt-get install cargo -y && \
    Rscript -e "install.packages('hrbrthemes', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('igraph', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('ggnetwork', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('intergraph', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('ggforce', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('gtable', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('gridExtra', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('grid', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('rayshader', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('gifski', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('gghighlight', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('pander', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('factoextra', repos='http://cran.rstudio.com/')" && \
    Rscript -e "install.packages('dendextend', repos='http://cran.rstudio.com/')" && \
    Rscript -e "devtools::install_github('thomasp85/gganimate')"
