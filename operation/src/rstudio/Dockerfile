FROM rocker/tidyverse

RUN mkdir -p /home/user/.rstudio/monitored/user-settings/

RUN R -e "install.packages('viridis',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('hrbrthemes',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('gghighlight',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('pander',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('showtext',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "library(devtools); install_github('https://github.com/olympique-de-marseille/om-theme', auth_token='b3072dc9db3703010ad7ecf095321add65a2f1fd')"

RUN cd /usr/share/fonts && git clone https://github.com/Ben8t/fonts.git
RUN fc-cache -f -v

COPY ./user-settings /home/user/.rstudio/monitored/user-settings/user-settings

