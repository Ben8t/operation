# syntax=docker/dockerfile:experimental
FROM rocker/tidyverse

RUN mkdir -p /home/user/.rstudio/monitored/user-settings/

RUN apt-get update &&  \
    apt-get install -y libmagick++-dev

RUN R -e "install.packages('viridis',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('hrbrthemes',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('gghighlight',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('pander',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('showtext',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('reactable',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggridges',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('magick', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggimage', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "devtools::install_github('ThinkR-open/remedy')"
RUN R -e "install.packages('odbc',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('RPostgres',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('RPostgreSQL',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dpblyr',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('aws.signature',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('aws.s3',dependencies=TRUE, repos='http://cran.rstudio.com/')"

RUN cd /usr/share/fonts && git clone https://github.com/Ben8t/fonts.git
RUN fc-cache -f -v

RUN apt-get -yqq install ssh
# Download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
# Clone private repository
RUN --mount=type=ssh,id=github_ssh_key git clone git@github.com:olympique-de-marseille/om-theme.git om-theme
RUN R -e "install.packages('om-theme', repos=NULL, type='source')"

RUN --mount=type=ssh,id=github_ssh_key git clone git@github.com:olympique-de-marseille/ranalytics.git ranalytics
RUN R -e "install.packages('ranalytics', repos=NULL, type='source')"

COPY ./user-settings /home/user/.rstudio/monitored/user-settings/user-settings

