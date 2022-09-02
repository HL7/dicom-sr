This chapter describes the architecture of this implementation guide.

1. [Profiles & Extensions](#profiles) - FHIR Profiles and extensions defined in the IG

<a name="profiles"></a>

### Profiles & Extensions
#### Resource Profiles<a name="resources"></a>
The mapping of the core DICOM SR measurement groups, measurements and qualitative analysis content items are covered by the following resource profiles:

* [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html) profiles the Observation resource representing DICOM SR measurment group templates:
    * [DTID 1410 “Planar ROI Measurements and Qualitative Evaluations”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410)
    * [DTID 1411 “Volumetric ROI Measurements and Qualitative Evaluations”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411)
    * [DTID 1501 “Measurement and Qualitative Evaluation Group”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1501)

* [Imaging Measurement](StructureDefinition-imaging-measurement.html) profiles the Observation resource representing imaging measurements extracted from DICOM SR measurement templates:
    * [DTID 300 “Measurement”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_300)
    * [DTID 1419 “ROI Measurements”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1419)
    
* [Derived Imaging Measurement](StructureDefinition-derived-imaging-measurement.html) profiles the Observation resource representing the DICOM SR derived measurement template [DTID 1420 “Measurements Derived From Multiple ROI Measurements”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1420)

* [Imaging Qualitative Evaluation](StuctureDefinition-imaging-qualitative-evaluation.html) profiles qualitative evaluation content items

The above resource profiles depend on the following ImagingSelection resource profiles:
* 

and the following Device resource profile:
* [Algorithm Identification](StructureDefinition-algorithm-identification.html) profiles DICOM SR template [DTID 4019 “Algorithm Identification”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_TID_4019.html)

#### Supporting DataType Profiles <a name="datatypes"></a>
There is no special supporting DataType profiles defined by this IG.

#### Supporting Extensions<a name="extensions"></a>
There is no special supporting extensions defined by this IG.

#### Profiles relationship
##### Relationship to DICOM SR TID 1500 Measurement Report
This implementation guide maps content items contained within the DICOM TID 1500 Measurement Report to FHIR resources.

All mapped content items are children of the following `CONTAINER` content items:

| Container Concept Name | Child FHIR Resource Profile | Notes |
| ----------------- | --------------------- | ----- |
| (126010, DCM, "Imaging Measurements") | [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html) | See [Imaging Measurement Group relationship](#measurementgroup) | 
| (126011, DCM, "Derived Imaging Measurements") | [Derived Imaging Measurements](StructureDefinition-derived-imaging-measurements.html) | See [Derived Imaging Measurements relationship](#derivedmeasurements) |
| (C0034375, UMLS, "Qualitative Evaluations") | [Imaging Qualitative Evaluation](StuctureDefinition-imaging-qualitative-evaluation.html) | See [Imaging Qualitative Evaluations relationship](#qualitativeevaluations) |

e.g. the children of the `CONTAINER` with a Concept Name of (126010, DCM, "Imaging Measurements") are mapped to [Measurement Group](StructureDefinition-imaging-measurement-group.html) Observations.

![TID 1500 Measurement Report and its children](./tid_1500_measurement_report.svg){: width="110%"}

<a name="measurementgroup"></a>
##### Imaging Measurement Group relationship
An Imaging Measurement Group `CONTAINER` contains 0-n `NUM` content items representing numerical measurements. Each of these is mapped to a [Imaging Measurement](StructureDefinition-imaging-measurement.html) Observation.

An Imaging Measurement Group `CONTAINER` contains 0-n `TEXT` or `CODE` content items representing qualitative evaluations. Each of these is mapped to a [Imaging Qualitative Evaluation](StuctureDefinition-imaging-qualitative-evaluation.html) Observation. 

The Imaging Measurement Group `CONTAINER` is mapped to a [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html) Observation. 

The [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html) Observation `hasMember` element references the child [Imaging Measurement](StructureDefinition-imaging-measurement.html) and [Imaging Qualitative Evaluation](StuctureDefinition-imaging-qualitative-evaluation.html) Observations.

<a name="derivedmeasurements"></a>
##### Derived Imaging Measurements relationship
A Derived Imaging Measurement `CONTAINER` contains 0-n `NUM` content items representing derived numerical measurements. Each of these is mapped to a [Derived Measurements](StructureDefinition-derived-imaging-measurements.html) Observation.

A Derived Imaging Measurement `CONTAINER` contains 0-n Imaging Measurement Group `CONTAINER` content items. Each of these is mapped to a [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html) Observation (see [Imaging Measurement Group relationship](#measurementgroup)).

The [Derived Imaging Measurements](StructureDefinition-derived-imaging-measurements.html) Observation `derivedFrom` element references the child [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html) Observations. 

<a name="qualitativeevaluations"></a>
##### Imaging Qualitative Evaluations relationship
A Imaging Qualitative Evaluations `CONTAINER` contains 0-n `TEXT` or `CODE` content items representing qualitative evaluations. Each of these is mapped to a [Imaging Qualitative Evaluation](StuctureDefinition-imaging-qualitative-evaluation.html) Observation.
