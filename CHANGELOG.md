# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

This repository links to each of the other repositories making up the IN-CORE code. You can find more details about the changes for  each of the components of IN-CORE in their respective repositories.

## unreleased

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

