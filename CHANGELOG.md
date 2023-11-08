# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

This repository links to each of the other repositories making up the IN-CORE code. You can find more details about the changes for  each of the components of IN-CORE in their respective repositories.

## [4.7.0] - 2023-11-09

## [4.6.0] - 2023-10-11

IN-CORE v4.6.0 has been released. This release includes the following updates:
- pyIncore v1.13.0
- IN-CORE Web services v1.21.0
- IN-CORE Web Tools v1.8.0
- IN-CORE Documentation v4.6.0
- IN-CORE lab v1.0.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Some highlights of this release are as follows:

- pyIncore v1.13.0
  - Added commercial building recovery analysis
  - Added a capability of local hazard with datasets (e.g. Geotiff)
  - Added support for multi-hazard fragility curves
  - Updated damage analyses to support local hazard
  - Refactored INDP analysis dislocation time to allow different parameters
- IN-CORE Web Services v.1.21.0
  - Added a capability to generate template dataset on semantic service
  - Added owner attribute in the metadata of dataset, hazard and dfr3 curves
  - Added quota management of IN-CORE Lab to user allocation endpoints
  - Added Sadigh et al 1997 attenuation model
- IN-CORE Web tools v1.8.0
  - Added Semantic type viewer
  - Added multi-hazard earthquake+tsunami selection to DFR3Viewer
  - Updated user IN-CORE lab quota to read from the allocations endpoint
- IN-CORE Documentation v4.6.0
  - Added an example notebook and documentation for commercial building recovery
  - Added local hazard tutorial
  - Updated INDP analysis documentation
- IN-CORE Lab v 1.0.0
  - Updated jupyter hub to version 3.0.2 and jupyter lab to 4.0.2
  - User quota read from the user’s service allocation

New Datasets:
- Delay impending factors for Joplin commercial buildings - 64ee0bcd553ecf0768e21e55

New Fragilities:
- Seaside Testbed Regular-Duration Earthquakes RC3 3D fragility - 65259acf62ba036575da5fcf


## [4.5.0] - 2023-08-16

IN-CORE v4.5.0 has been released. This release includes the following updates:
- pyIncore v1.12.0
- pyIncore-viz v1.8.3
- IN-CORE Web services v1.20.0
- IN-CORE Web Tools v1.7.0
- IN-CORE Documentation v4.5.0
- IN-CORE lab v0.8.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Some highlights of this release are as follows:

- pyIncore v1.12.0
  - Added Interdependent Network Design Problem (INDP) analysis
- pyIncore-viz v1.8.3
  - Fixed building process of conda package and changed testing to use micromamba
- IN-CORE Web Services v.1.20.0
  - Geotools upgraded to version 29
  - Jersey web services framework upgraded to version 3
  - OpenAPI upgraded to version 3
  - Upgraded related libraries for the upgrades of Geotools, Jersey, and OpenAPI
  - Initial implementation of Semantics Service to provide the information of dataset types
  - Added endpoint to return allowed demand types for each hazard in the Hazard service
- IN-CORE Web tools v1.7.0
  - Fixed close operation for all viewers so it correctly closes the view
  - Fixed user usage information display
- IN-CORE Documentation v4.5.0
  - Added an example notebook and documentation for Interdependent Network Design Problem analysis
  - Fixed tornado visualization example notebook
  - Upgraded swagger ui library
- IN-CORE Lab v 0.8.0
  - Updated the container definition to reduce the container size
  - Added ipopt and scip solvers for optimization analyses

New Datasets:
- Building inventory for Mobile testbed - 649361d8e435fd233fbbd1b3
- Seaside INDP
  - Powerline supply demand info - 64adbfdeae71103fb41906e6
  - EPF supply demand info - 64adc019e1b74b4e1582110d
  - Water facility supply demand info - 64adc051ae71103fb41906e7
  - Water pipeline supply demand info - 64adc08ee1b74b4e1582110e
  - Interdependency - 64adc0c4ae71103fb41906e8
  - Power Network - 64adbc47c36a346b1f3969f0
  - Water Network - 64adbed3e1b74b4e158210ed


## [4.2.0] - 2023-06-14

IN-CORE v4.2.0 has been released. This release includes the following updates:
- pyIncore v1.11.0
- pyIncore-viz v1.8.2
- IN-CORE Web services v1.11.0
- IN-CORE documentation v4.2.0
- IN-CORE Lab v0.7.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Some highlights of this release are as follows:
- pyIncore v1.11.0
  - Added Electric Power Facility Repair Cost analysis
  - Added Water Facility Repair Cost analysis
  - Added Pipeline Repair Cost analysis
  - Improved error handling regarding IN-CORE Web Services
  - Fixed issues related to the upgrade to Pandas 2.0
- pyIncore-viz v1.8.2
  - Updated ipyleaflet to version 0.17.2
- IN-CORE Web services v1.11.0
  - Added query parameters to sort results in ascending/descending order
  - Refactored to remove dependency on NCSA LDAP service
  - User groups are obtained from Keycloak request headers instead of LDAP query
- IN-CORE documentation v4.2.0
  - Added Electric Power Facility Repair Cost analysis documentation and example notebook
  - Added Water Facility Repair Cost analysis documentation and example notebook
  - Added Pipeline Repair Cost analysis documentation and example notebook
- IN-CORE Lab v0.7.0
  - Fixed map visualization issue by updating the jupyterlab 3.6.3

New Datasets:
- Electric Power Facility Repair Cost analysis
  - Electric power facility replacement cost - 647dff5b4dd25160127ca192
  - Electric power facility damage ratios - 6483354b41181d20004efbd7
- Water Facility Repair Cost analysis
  - Water facility replacement cost - 64833bcdd3f39a26a0c8b147
  - Water facility damage ratios - 647e423d7ae18139d9758607
- Pipeline Repair Cost analysis
  - Water pipeline replacement cost - 6480a2787ae18139d975e919
  - Water pipeline damage ratios - 6480a2d44dd25160127d2fcc
  - Seaside Water pipeline inventory - 6480a1d9c1a69260b196d9c6


## [4.1.0] - 2023-04-24

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion. 

Some highlights of this release are as follows:
- pyIncore v1.10.0
  - Added Galveston CGE analysis
  - Updated calculation method to count functional buildings
  - Fixed how Seaside and Joplin CGE analyses manage temporary files
  - Updated IN-CORE client to be configured with connection parameters including timeout.
- IN-CORE Web Tools v1.6.0
  - Changed how release tags are fetched from the central IN-CORE repository
- IN-CORE documentation v4.1.0
  - Added an example notebook for Galveston community app
  - Added documentation and example notebook for Galveston CGE analysis
  - Updated the notebook for Salt Lake City community app  corresponding to other fixes

New Datasets: 
- Social vulnerability analysis
  - National vulnerability averages - 63d178c2a011a9746c948115
  - Demographic factors - 63d17d89c4b5713b9c0bb8c1 
- Combined loss analysis for Galveston testbed
  - Structural Cost Ratios - 63ff7b2b5c35c0353d5edeeb
  - Content Cost Ratios - 63ff7b04a36332563d497cff 


## [4.0.0] - 2023-03-14

The currently released version of pyIncore and pyIncore-data has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion. 

Some highlights of this release are as follows:
- pyIncore v1.9.0
  - Updated combined wind, surge-wave and flood building damage to combine building damage probabilities
  - Added combined wind, surge-wave and flood building loss analysis
  - Added Salt Lake City CGE analysis
  - Updated Building Economic Loss to handle case when no occupancy multiplier is provided
  - Updated building clustering utility to allow user specified column for clustering
  - Parallelized Household-level housing sequential recovery (HHSR) analysis to improve performance
- pyIncore-data v0.6.0
  - Added CensusUtil functions to provide demographic data for HHSR analysis
  - Updated CensusUtil to provide pyIncore dataset object
- IN-CORE Web services v1.13.1
  - Updated Space service endpoint to get a space ID by space name
- IN-CORE Web Tools v1.5.0
  - Added a landing page for community playbook 
  - Improved build/deployment performance 
- IN-CORE documentation v4.0.0
  - Added documentation for Salt Lake City CGE Analysis and an example notebook
  - Added documentation for Combined wind, surge-wave and flood building loss and an example notebook
  - Added an example notebook for chained analyses of Salt Lake City community app 
  - Updated Housing Household Sequential Recovery notebook to use new CensusUtil functions
  - Update Lumberton testbed notebook with new pyincore-data update
  - Fixed the example notebook of Joplin retrofit plan to use public space hazards

New Datasets: 
- Salt Lake County (SLC) Liquefaction Susceptibility - 62fe9ab685ac6b569e372429
- SLC archetype mapping -  63dbca62a011a9746c95697f
- SLC Power Facility substations - 63daade962b9d001e6a16a0d
- SLC interdependency dictionary (buildings and substations) - 63daae5366818b21b82a07a4
- Housing Unit Allocation v2.0.0 data for SLC_UT 2010 - 6349cfb888a94f621d8fd5dd
- SLC Block Group Data - 63c9af5bc4b5713b9c0b559d
- Salt Lake City CGE model (for 2 regions) datasets
  - Salt Lake City 2 regions building to sectors table - 63ffd2c6a36332563d49a88d
  - Salt Lake City Two Regions Capital Comp - 6408c3ffc4841b26d143e77f
  - Salt Lake City Two Region Social Accounting Matrix - 6408c4a8475d895dfc2e5f05
  - Salt Lake City Two Regions MISCH - 6408c50718fd3853fb31d713
  - Salt Lake City Two Regions Employment - 6408c56cba377224eb7caa9a
  - Salt Lake City Two Regions Labor Supply - 6408c5c7c4841b26d143e786
  - Salt Lake City Two Regions Workers commute out - 6408c61d475d895dfc2e5f0d
- Combined Loss analysis structural loss ratios by archetype - 63ff7b2b5c35c0353d5edeeb
- Combined Loss analysis content loss ratios by damage state - 63ff7b04a36332563d497cff

New Hazards:
- SLC 6.7 Mw Earthquake - 64108b6373a164218026245f
- SLC 6.2 Mw Earthquake - 64108b5f86a52d419dd69a3f
- SLC 5.9 Mw Earthquake - 64108b5d73a164218026245d

## [3.7.0] - 2022-11-16

The currently released version of pyIncore, pyIncore-viz, and pyIncore-data has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion. 

Some highlights of this release are as follows:
- pyIncore v1.8.0
  - Enable liquefaction for bridge damage 
  - Added missing output spec description for EPF damage
  - Removed PEP 8 warnings
- pyIncore-viz v1.8.1
  - Deprecated inventory_to_geodataframe method from plotutil
  - Allow case insensitive matching between fragility curve parameter and demand types 
  - Fixed pypi build error
  - Fixed CRS error caused by rasterio
- IN-CORE Web services v1.12.0
  - Fixed keyword search for fragility mapping: not filtering properly by keyword
  - Fixed liquefaction null pointer bug when a location is below the hazard threshold and not exposed
  - Updated the hazard service to retrieve demand types and units from the database instead of fixed strings when determining if a request is valid
- IN-CORE Web Tools v1.4.0
  - Transitioning into Typescript, Functional Components and adopting React Hooks. Starting with the login component
- IN-CORE documentation v3.7.0
  - Updated pyincore installation with a note about a fiona error some users see when installing pyincore and how to fix it
  - Updated bridge damage documentation with new input parameter to include liquefaction in the damage output calculation

