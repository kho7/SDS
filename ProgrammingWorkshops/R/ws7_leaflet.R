# Using leaflet and ESRI map library to create web map
# Package: ggmap, leaflet
# Geocode: Google Maps
preload("ggmap")
preload("leaflet")
geocode("New Taipei")
geocode("Taipei")
geocode("Taiwan")
geocode("Fu Hsing Kang College")
# Create object with FHK geocode information (i.e. lon, lat)
fhkgeo=geocode("Fu Hsing Kang College")

# Create object using leaflet setting the view at EPPS geo location)
fhkmap <- leaflet() %>% setView(fhkgeo$lon, fhkgeo$lat, zoom=14)
fhkmap
# Create object to acquire map data from ESRI
esri <- grep("^Esri", providers, value = TRUE)

for (provider in esri) {
  fhkmap <- fhkmap %>% addProviderTiles(provider, group = provider)
}


findmeat <- paste(sep = "<br/>",
                  "<b><a href='http://www.fhk.ndu.edu.tw' target='_blank'>FHK College</a></b>",
                  "11258 台北巿北投區中央北路二段70號")

# Use htmlwidget::onRender function to  add custom behavior to the leaflet map using native Javascript.

fhkmap %>%
  addLayersControl(baseGroups = names(esri),
                   options = layersControlOptions(collapsed = TRUE)) %>%
  # addMiniMap(tiles = esri[[1]], toggleDisplay = TRUE,
  #           position = "bottomleft") %>%
  addMarkers(fhkmap, lng=fhkgeo$lon, lat=fhkgeo$lat, popup=findmeat)  %>%
  htmlwidgets::onRender("
                        function(el, x) {
                        var myMap = this;
                        myMap.on('baselayerchange',
                        function (e) {
                        myMap.minimap.changeLayer(L.tileLayer.provider(e.name));
                        })  
                        }")
