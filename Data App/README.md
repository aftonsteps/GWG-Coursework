
# Readme
This is a quick little example app that was created for a student discussion on how front-end fits into data applications.

The videoGames folder contains everything you need to run the app. server.R and ui.R provide the back- and front-end for the app, respectively. The www folder contains the styles.css file and the color sets which determin the app appearance. The dataset is in stream-200k.csv. Data were downloaded from the <a href="https://www.kaggle.com/tamber/steam-video-games/version/1">Steam data Kaggle competition dataset</a>.

To students from the GWG Front-End Web Development course:
- You can edit the style using the www/style.css file
- You can edit the chart colors using  www/barChartColors.csv and www/histogramColor.csv.
- If you would like to change the underlying analysis, you will need to edit the ui.R and server.R files. If you want to do this, keep reading.

What you need to make changes to the analysis:
- Download and install <a href="https://www.r-project.org/">R</a>.
- Download and install the open source edition of <a href="https://www.rstudio.com/products/rstudio/#Desktop">R Studio</a>.
- Open the ui and server files in R Studio.
- Check out <a href="https://shiny.rstudio.com/">Shiny</a> for tutorials and inspiration.
- If you'd like to upload your app, sign up for a free tier account at <a href="https://www.shinyapps.io/">shinyapps.io</a>.
