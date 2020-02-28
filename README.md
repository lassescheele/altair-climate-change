# Climate Change with [#Altair](https://altair-viz.github.io/)

This is a project for creating an interactive geospatial dataviz to visualize climate change as a global phenomenon. The dashboard is made entirely with [#Altair](https://altair-viz.github.io/) and shows the average monthly and yearly temperatures compared to the reference period 1961-1990 for selected countries. It has three linked components:

1. Global map with selectable points representing the available countries.
2. A line chart for yearly averages with a highlight for the selected country.
3. A heatmap showing the values for each year and month for the selected country.

[![Dashboard for Germany][image]][dashboard]

  [dashboard]: https://lassescheele.github.io/altair-climate-change/countries_centroids_tavg_1850-2013_ref1961-1990.html
  [image]: plots/countries_centroids_tavg_1850-2013_ref1961-1990.png "Dashboard for Germany"

The data comes from [Berkeley Earth](http://berkeleyearth.org/) and is made available via [Kaggle](https://www.kaggle.com/berkeleyearth/climate-change-earth-surface-temperature-data).
