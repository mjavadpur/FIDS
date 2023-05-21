
CREATE VIEW [dbo].[Air_view]
AS
SELECT ident, name, latitude_deg, longitude_deg, COUNT(CASE WHEN air_type = 'origin' THEN air_type ELSE NULL END) AS origin, COUNT(CASE WHEN air_type = 'destination' THEN air_type ELSE NULL END) AS destination
FROM     (SELECT dbo.FIDSAirports.ident, dbo.FIDSAirports.name, dbo.FIDSAirports.latitude_deg, dbo.FIDSAirports.longitude_deg, 'origin' AS air_type
                  FROM      dbo.FIDSAirports INNER JOIN
                                    dbo.FIDS ON dbo.FIDSAirports.ident = dbo.FIDS.origin
                  WHERE   (dbo.FIDSAirports.iso_country = 'IR')
                  UNION ALL
                  SELECT FIDSAirports_1.ident, FIDSAirports_1.name, FIDSAirports_1.latitude_deg, FIDSAirports_1.longitude_deg, 'destination' AS air_type
                  FROM     dbo.FIDSAirports AS FIDSAirports_1 INNER JOIN
                                    dbo.FIDS AS FIDS_1 ON FIDSAirports_1.ident = FIDS_1.destination
                  WHERE  (FIDSAirports_1.iso_country = 'IR')) AS derivedtbl_1
GROUP BY ident, name, latitude_deg, longitude_deg