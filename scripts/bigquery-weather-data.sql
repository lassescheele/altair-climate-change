# Select weather stations
WITH inventory AS (
  SELECT id, element, firstyear, lastyear
  FROM `bigquery-public-data.ghcn_d.ghcnd_inventory`
  WHERE element = 'TAVG'),
stations AS (
  SELECT id, wmoid, latitude, longitude, elevation, name, SUBSTR(id,1,2) AS country_code, state
  FROM `bigquery-public-data.ghcn_d.ghcnd_stations`
  WHERE id IN (SELECT DISTINCT id FROM inventory))
SELECT inventory.*, stations.* EXCEPT(id), countries.name AS country_name
FROM inventory
LEFT JOIN stations
ON inventory.id = stations.id
LEFT JOIN `bigquery-public-data.ghcn_d.ghcnd_countries` AS countries
ON country_code = countries.code




# Select daily weather data
SELECT *
FROM `bigquery-public-data.ghcn_d.ghcnd_19*`
WHERE ( CAST(_TABLE_SUFFIX AS INT64) >= 50) AND element = 'TAVG' AND id IN ('USW00025501', # Kodiak, Alaska, USA, 1945
    'CA002401200', # EUREKA, Canada, 1947
    'USW00023237', # Stockton, California, USA, 1941
    'USW00022521', # Honululu, Hawaii, USA, 1939
    'FP000091929', # BORA-BORA/MOTU-MUTE, French Polynesia, 1943
    'USW00014939', # Lincoln Muni AP, Nebraska, USA, 1942
    'USW00094702', # Bridgeport, Conneticut, USA, 1942
    'COM00080028', # Ernesto Cortissoz, Colombia, 1941
    'BR00E4-1230', # Campinas, Brazil, 1951
    'CIM00085577', # Quinta Normal (Santiago de Chile), Chile, 1946
    'GLM00004390', # IKERASASSUAQ, Greenland, 1943
    'GM000010147', # Hamburg, Germany, 1939
    'RSM00027612', # Moscow, Russia, 1936
    'KZ000035188', # Astana, Kazakhstan, 1881
    'RSM00021921', # KJUSJUR, Russia, 1909
    'RSM00032618', # NIKOLSKOYE/BERINGA OSTROV, Russia, 1899
    'TSM00060715', # CARTHAGE, Tunisia, 1943
    'SG000061641', # Dakar, Senegal, 1943
    'SU000062770', # Genina, Sudan, 1943
    'MUM00041316', # SALALAH, Oman, 1943
    'SF001344780', # Calvinia, South Africa, 1957
    'SE000063980', # SEYCHELLES INTERNAT, Seychelles, 1957
    'IN022021900', # New Delhi, India, 1942
    'CHM00054511', # Beijing, China, 1945
    'JA000047759', # Kyoto, Japan, 1945
    'RP000098429', # Manila, Philippines, 1945
    'FJ000091680', # NADI AIRPORT, Fiji, 1942
    'ASN00003003', # BROOME AIRPORT, Australia, 1939
    'ASN00066037', # Sydney Airport, Australia, 1943
    'AYM00089022', # Halley, Antarctica, 1956
    'SXM00088903', # GRYTVIKEN, South Georgia and the South Sandwich Islands [United Kingdom], 1953
    'AYM00089542', # MOLODEZNAJA, Antarctica, 1973
    'AYM00089606')