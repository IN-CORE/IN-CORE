# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

This repository links to each of the other repositories making up the IN-CORE code. You can find more details about the changes for  each of the components of IN-CORE in their respective repositories.

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

