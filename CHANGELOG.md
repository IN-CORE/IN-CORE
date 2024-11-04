# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

This repository links to each of the other repositories making up the IN-CORE code. You can find more details about the changes for  each of the components of IN-CORE in their respective repositories.

## [5.5.1] - 2024-11-04

IN-CORE v5.5.1 has been released. This release includes the following updates:

- pyIncore v1.20.1
- IN-CORE Web services v1.27.1
- IN-CORE lab v1.9.1

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion. 

Some highlights of this release are as follows:

- pyIncore v1.20.1
  - Fixed core CGE ML bug and updated base values for Joplin
- IN-CORE Web services v1.27.1
  - Fixed issue with earthquake visualization raster envelope
- IN-CORE Lab v1.9.1
  - Updated to use pyIncore v1.20.1, pyIncore-viz v1.11.0, and pyIncore-data v0.7.0

## [5.5.0] - 2024-10-23

IN-CORE v5.5.0 has been released. This release includes the following updates:

- pyIncore v1.20.0
- pyIncore-viz v1.11.0
- pyIncore-data v0.7.0
- IN-CORE Web services v1.27.0
- IN-CORE Documentation v4.14.0
- IN-CORE Web Tools v1.13.1
- IN-CORE lab v1.9.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion. 

Some highlights of this release are as follows:

- pyIncore v1.20.0
  - Added Equity Metric analysis
  - Updated Residential building recovery to support Interdependent recovery analysis for residential buildings and households
  - Fixed bug with hazard raster upload not respecting the order of the files
  - Fixed sphinx autodoc skipping class methods with custom decorators
  - Added automatic formatting and linting
  - Fixed bug with publishing to pypi
- pyIncore-viz v1.11.0
  - Fixed Matplotlib version incompatibility
  - Added automatic formatting and linting
  - Fixed GitHub action for publishing to pip package to pypi
- pyIncore-data v0.7.0
  - Added automatic formatting and linting
  - Fixed GitHub action for publishing to pip package to pypi
- IN-CORE Web services v1.27.0
  - Upgraded dependent Java libraries
- IN-CORE Documentation v4.14.0
  - Added Equity Metric documentations
  - Updated residential building recovery documentation based on the changes to support interdependent recovery analysis
- IN-CORE Web Tools  v1.13.1
  - Fixed registration and reset password link
  - Fixed typo in DFR3 mapping that caused deleting mappings to fail
- IN-CORE Lab v1.9.0
  - Updated to use pyIncore v1.20.0, pyIncore-viz v1.11.0, and pyIncore-data v0.7.0


## [5.4.1] - 2024-08-21

In this release, the NCSA LDAP user management system has been shifted to the new IN-CORE user management system.
Accounts have been migrated to the new system and users will need to reset their passwords to re-enable their account.

This release includes the changes and improvements regarding the new IN-CORE user management system.

IN-CORE v5.4.1 has been released. This release includes the following updates:
- IN-CORE Documentation v4.13.0
- IN-CORE lab v1.8.0
- IN-CORE Web Tools v1.13.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Note: this release shifts IN-CORE to a new user management system as announced previously.

Some highlights of this release are as follows:

- IN-CORE Documentation v4.13.0
  - Updated Account registration instructions
- IN-CORE Lab v1.8.0
  - Updated base image for Jupyter Lab to 4.1
  - Removed LDAP UID dependency
- IN-CORE Web Tools v1.13.0
  - Replaced LDAP registration links with new registration page
  - Added landing page announcement informing user management change


## [5.4.0] - 2024-06-12

IN-CORE v5.4.0 has been released. This release includes the following updates:
- pyIncore v1.19.0
- pyIncore-viz 1.10.1
- pyIncore-data 0.6.3
- IN-CORE Documentation v4.12.0
- IN-CORE lab v1.7.0
- IN-CORE Web Tools v1.12.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Some highlights of this release are as follows:

- In this release, we added google analytics to all static pages including user manual, API documentation, and
auto-generated technical documentation in pyIncore, pyIncore-viz, and pyIncore-data.
- pyIncore v1.19.0
  - Added buyout decision analysis
  - Added gas facility damage analysis
  - Renamed building damage to building structural damage
  - Renamed nonstructural damage to building nonstructural damage
  - Renamed social vulnerability to social vulnerability score
  - Renamed transportation recovery to traffic flow recovery
  - Renamed monte carlo failure probability to monte carlo limit state probability
  - Renamed housing recovery to housing valuation recovery
  - Renamed building portfolio to building cluster recovery
  - Added flood hazard support to building non structural damage
  - Updated flood input type to be non structural damage for combined wind, wave, surge building damage analysis
- IN-CORE Documentation v4.12.0
  - Updated documentation for renamed analyses including building structural damage, building non structural damage,
  - social vulnerability score, traffic flow recovery, monte carlo limit state probability, housing valuation
    recovery, and building cluster recovery.
  - Added buyout analysis documentation and example notebook
  - Added gas facility analysis documentation and example notebook
- IN-CORE lab v1.7.0
  - Updated to use pyIncore v1.19.0, pyIncore-viz v1.10.1, and pyIncore-data v0.6.3
- IN-CORE Web Tools  v1.12.0
  - Replaced login page with keycloak native login page
  - Added google analytics


## [5.3.1] - 2024-04-30

IN-CORE v5.3.1 has been released. This release includes the following updates:
- pyIncore v1.18.1
- IN-CORE Documentation v4.11.0
- IN-CORE lab v1.6.0
- IN-CORE Web Tools v1.11.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Some highlights of this release are as follows:

- pyIncore v1.18.1
  - Added support for choice dislocation and unsafe occupancy in the population dislocation analysis
  - Renamed Joplin Empirical Restoration analysis to Joplin Empirical Building Restoration
  - Fixed pip installation by cleaning up dependencies
  - Fixed permission error when cleaning up datasets on windows platform
- IN-CORE Documentation v4.11.0
  - Upgraded Jupyter Book to 0.15.1
  - Updated IN-CORE logo
- IN-CORE lab v1.6.0
  - Updated to use pyIncore 1.18.1
- IN-CORE Web Tools  v1.11.0
  - Updated IN-CORE logo and matching color palette

New hazards

- Hurricane Katrina - surge
  - Water level for natural hurricane Katrina in 200: 6420c6e6d9ae37665ff0d5f2
  - Water level for natural hurricane Katrina coupled with NOAA intermediate SLR: 64222491d9ae37665ff0d5f3
  - Water level for natural hurricane Katrina coupled with NOAA extreme SLR: 6422253cd9ae37665ff0d5f4
  - Water level for shifted hurricane Katrina: 642d387bfde0f316c3493530
  - Water level for shifted hurricane Katrina coupled with NOAA intermediate SLR: 642d38f1fde0f316c3493531
  - Water level for shifted hurricane Katrina coupled with NOAA extreme SLR: 642d3c7763601e1e19241468


## [5.3.0] - 2024-04-12

IN-CORE v5.3.0 has been released. This release includes the following updates:
- pyIncore v1.18.0
- IN-CORE Web services v1.26.1
- IN-CORE Documentation v4.10.0
- IN-CORE lab v1.5.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Some highlights of this release are as follows:

- pyIncore v1.18.0
  - Added the core engine for Machine Learning (ML) enabled CGE
  - Added an analysis of ML enabled CGE for Salt Lake City
  - Added more math library support for DFR3 expressions
  - Fixed the timeout issue of IN-CORE client 
- IN-CORE Web Services v.1.26.1
  - [Data service] Fixed quota issue for hazard data types
- IN-CORE Documentation v4.10.0
  - Added Salt Lake City community app notebook with retrofit example
  - Added citation for social vulnerability analysis
  - Added documentation and example notebook for ML enabled CGE for Salt Lake City
- IN-CORE lab v1.5.0
  - Updated to use pyincore 1.18.0

## [5.2.0] - 2024-03-29

IN-CORE v5.2.0 has been released. This release includes the following updates:
- IN-CORE Web services v1.26.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Some highlights of this release are as follows:
- IN-CORE Web Services v.1.26.0
  - [Data service] Fixed missing values in uploaded joined shapefile to geoserver


## [5.1.0] - 2024-02-22

IN-CORE v5.1.0 has been released. This release includes the following updates:
- pyIncore v1.17.0
- IN-CORE Web services v1.25.0
- IN-CORE Documentation v4.9.0
- IN-CORE lab v1.4.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Some highlights of this release are as follows:

- pyIncore v1.17.0
  - Added a method to convert IN-CORE damage states to FEMA damage states for Galveston community
  - Fixed tornado EPN damage according to update on tornado hazard
  - Changed how retrofit mappings are used in building damage analysis according to mapping set update
- IN-CORE Web Services v.1.25.0
  - [Data service] Improved performance of joining a CSV and a Shapefile
  - [DFR3 service] Added retrofit information to mapping set
  - [Semantics service] Fixed broken semantics data type links
- IN-CORE Documentation v4.9.0
  - Updated 2023 ASCE Inspire workshop material; notebooks with creating local hazard and with pyincore-viz example
  according to update on tornado hazard
- IN-CORE Lab v1.4.0
  - Updated to use pyincore 1.17.0


## [5.0.0] - 2024-02-07

IN-CORE v5.0.0 has been released. This release includes the following updates:
- pyIncore v1.16.0
- pyIncore-viz v1.10.0
- pyIncore-data v0.6.2
- IN-CORE Web services v1.24.0
- IN-CORE Web Tools v1.10.0
- IN-CORE Documentation v4.8.2
- IN-CORE lab v1.3.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Some highlights of this release are as follows:

- pyIncore v1.16.0
  - Added a method to create GUID for GeoPackage file
  - Updated model classes of tornado and earthquake according to the improvement of Hazard service
  - Added python decorator to indicate if a method requires a service connection
- pyIncore-viz v1.10.0
  - Added a method for plotting local hazards
  - Updated methods of visualizing tornado and earthquake according to pyIncore change
  - Fixed build script issue for sphinx documentation
- pyIncore-data v0.6.2
  - Fixed build script issue for sphinx documentation
- IN-CORE Web Services v.1.24.0
  - Updated model classes of tornado and earthquake to be consistent with other hazard models
  - Added support for GeoPackage file
  - Changed semantic types to use Java models
  - Added sorting capability for semantic definitions
- IN-CORE Web tools v1.10.0
  - Improved the landing page
  - Updated hazard viewer based on Hazard service changes
- IN-CORE Documentation v4.8.2
  - Fixed a link issue with the ASCE INSPIRE 2023 workshop material
  - Fixed Pandas warnings in testbed notebooks
- IN-CORE Lab v1.3.0
  - Updated to use pyincore 1.16.0, pyincore-viz 1.10.0 and pyincore-data 0.6.2

New Datasets:
- MMSA Shelby county Building to Sectors mapping - 656727dfdc70057a752b6b35


## [4.8.1] - 2023-12-20

IN-CORE v4.8.1 has been released. This release includes the following updates:
- pyIncore v1.15.1
- IN-CORE Documentation v4.8.1
- IN-CORE lab v1.2.1

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Some highlights of this release are as follows:

- pyIncore v1.15.1
  - Updated NCI functionality analysis to include electric power damage as an input since it was no longer part of
  the MCS output
- IN-CORE Documentation v4.8.1
  - Updated NCI functionality analysis documentation with electric power damage input and updated the example notebook
- IN-CORE Lab v1.2.1
  - Updated to use pyincore v1.15.1


## [4.8.0] - 2023-12-13

IN-CORE v4.8.0 has been released. This release includes the following updates:
- pyIncore v1.15.0
- pyIncore-viz v1.9.0
- pyIncore-data v0.6.1
- IN-CORE Web services v1.23.0
- IN-CORE Web Tools v1.9.1
- IN-CORE Documentation v4.8.0
- IN-CORE lab v1.2.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion.

Some highlights of this release are as follows:

- pyIncore v1.15.0
  - Removed redundant output data (e.g. damage) from output of MCS analysis
  - Updated commercial building recovery to include building damage as an input since it was no longer part of the
    MCS output
  - Fully enabled offline mode for pyincore
- pyIncore-viz v1.9.0
  - Added local hazard visualization
- pyIncore-data v0.6.1
  - Cleaned up dependencies to simplify installation and updated python to 3.9
- IN-CORE Web Services v.1.23.0
  - Refactored allocation and usage endpoints to use Java models
- IN-CORE Web tools v1.9.1
  - Updated library dependencies to fix GitHub dependabot security warnings
- IN-CORE Documentation v4.8.0
  - Added ASCE INSPIRE 2023 workshop materials
  - Added semantic data type URL links to analysis page documentation
  - API documentation page redirects to login page if the user is not logged in
  - Updated Seaside testbed notebook to use damage output from damage analysis instead of the MCS output
- IN-CORE Lab v1.2.0
  - Updated build file to use Mamba to install python dependencies
  - Added configuration file for controlling component versions of pyincore, pyincore-viz, and pyincore-data and
    updated it to use the latest releases


## [4.7.0] - 2023-11-09

IN-CORE v4.7.0 has been released. This release includes the following updates: 
- pyIncore v1.14.0
- pyIncore-viz v1.8.4
- IN-CORE Web services v1.22.0
- IN-CORE Web Tools v1.9.0
- IN-CORE Documentation v4.7.0
- IN-CORE lab v1.1.0

Please visit https://incore.ncsa.illinois.edu for detailed information on changes to each component.

The currently released version of pyIncore has been published at PyPi. Note that it is not officially supported by the IN-CORE dev team and is only tested on the Linux platform. Please use it at your discretion. 

Some highlights of this release are as follows:

- pyIncore v1.14.0
  - Updated building damage analysis to support local hazard object
  - Dropped support for Python 3.8 and set minimum version to Python 3.9 (for pyincore-viz and pyincore-data, too)
  - Fixed DFR3 mapping to allow for local repair curves
- pyIncore-viz v1.8.4
  - Changed basemap API to use Open Street Map
  - Fixed issue of centering map with ipyleaflet
- IN-CORE Web Services v.1.22.0
  - Fixed missing filters by user access on semantics service
- IN-CORE Web tools v1.9.0
  - Added links to the Slack workspace and mailing list to the landing page
  - Renamed Semantics viewer to Dataset Type Viewer
  - Added missing a filter title for both Data Viewer and Dataset Type Viewer
  - Added description in Dataset Type viewer
- IN-CORE Documentation v4.7.0
  - Added Slack workspace information to pages of contact information and getting started pages
  - Updated documentation of building damage analysis 
  - Fixed missing links of analysis at table of contents in the sidebar menu
  - Updated python minimum version references to Python 3.9
- IN-CORE Lab v1.1.0
  - INCORE-Lab now uses pyIncore version 1.14.0
  - INCORE-Lab now uses pyIncore-viz version 1.8.4


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

