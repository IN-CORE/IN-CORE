## IN-CORE

The National Institute of Standards and Technology (NIST) funded the Center of Excellence for Risk-Based Community Resilience Planning ([CoE](http://resilience.colostate.edu/)) (Cooperative Agreement 70NANB15H044), to develop the measurement science to support community resilience assessment. The measurement science is implemented on a platform called **I**nterdependent **N**etworked **Co**mmunity **R**esilience Modeling **E**nvironment (**INCORE**). It incorporates a risk-based approach to decision-making that enables quantitative comparisons of alternative resilience strategies. On the IN-CORE platform, data from the community can be seamlessly integrated which allows users to optimize community disaster resilience planning and post-disaster recovery strategies intelligently using physics-based models of inter-dependent physical systems combined with socio-economic systems.

IN-CORE consists of multiple components as shown below:

![IN-CORE services](images/incore.jpg)

**pyIncore** is a Python package consisting of three primary components: 1) a set of service classes to interact with the IN-CORE web services described below, 2) IN-CORE analyses and 3) visualization. The pyIncore allows users to apply various hazards to infrastructure in selected areas, propagating the effect of physical infrastructure damage and loss of functionality to social and economic impacts. Refer to [pyIncore documentation](https://incore.ncsa.illinois.edu/doc/incore/pyincore.html) for detailed information. The source code is available at [GitHub IN-CORE/pyincore](https://github.com/IN-CORE/pyincore).

**IN-CORE Web Services** are written in Java with JAX-RS specification and are comprised of a Hazard Service, DFR3 (Damage, Functionality, Repair, Recovery, Restoration) Service, Data Service, Geospatial Visualization Service, Semantic Service, and Space Service. These services allow users to create and access hazards, fragilities and data. Users can access and utilize these services via pyIncore and IN-CORE Web Tools. For detailed information, please refer to the [technical reference document](https://incore.ncsa.illinois.edu/doc/api/). The source code is available at [GitHub IN-CORE/incore-services](https://github.com/IN-CORE/incore-services).

**IN-CORE Web Tools** is a set of web viewers for interacting with the different IN-CORE web services. The viewers enable users to browse, search **Datasets**, **Hazards**, **Fragility curves**, **Repair curves**, etc., view the metadata and visualizations, and download items allowed. For detailed information, please refer to the [IN-CORE Web Tools section](https://incore.ncsa.illinois.edu/doc/incore/webtools.html). The source code is available at [GitHub IN-CORE/incore-ui](https://github.com/IN-CORE/incore-ui).

**IN-CORE Lab** is a customized Jupyter Lab with **pyIncore** installed and hosted on a NCSA cloud system. It allows users to develop/run/test their scientific model with pyIncore in their own workspace. Example Jupyter notebooks are provided with each pyincore analysis to help users get started and to help them understand how to use the pyIncore. For detailed information, please refer to the [IN-CORE Lab section](https://incore.ncsa.illinois.edu/doc/incore/incore_lab.html). The source code is available at [GitHub IN-CORE/incore-lab](https://github.com/IN-CORE/incore-lab).

## Current Release

This is the list of releases for IN-CORE v4.1.0

| module | version |
| ------ | ------- |
| incore-auth | 1.6.0 |
| incore-docs | v4.1.0 |
| incore-helm | 1.16.0 |
| incore-lab | v0.6.1 |
| incore-services | v1.13.1 |
| incore-ui | v1.6.0 |
| plotting-service | v1.11.0 |
| pyincore | v1.10.0 |
| pyincore-data | v0.6.0 |
| pyincore-viz | v1.8.1 |
