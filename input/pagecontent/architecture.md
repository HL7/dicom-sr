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

* [Imaging Qualitative Evaluation](StuctureDefinition-imaging-qualitative-evaluation.html) profiles the Observation resource representing qualitative evaluation content items

The above resource profiles depend on the following ImagingSelection resource profiles:
* [Image Region -- 2D](StructureDefinition-image-region-2d.html) profiles the ImagingSelection resource representing a referenced 2D image region content item [CID 111030 "Image Region"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_111030)
* [Image Region -- 3D](StructureDefinition-image-region-3d.html) profiles the ImagingSelection resource representing a referenced 3D image region content item [CID 111030 "Image Region"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_111030)
* [Referenced Segment](StructureDefinition-referenced-segment.html) profiles the ImagingSelection resource representing a referenced segment content item [CID 121191 "Referenced Segment"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_121191)
* [Referenced Segmentation Frame](StructureDefinition-referenced-segmentation-frame.html) profiles the ImagingSelection resource representing a referenced segmentation frame content item [CID 121214 "Referenced Segmentation Frame"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_121214)
* [Source Image For Segmentation](StructureDefinition-source-image-for-segmentation.html) profiles the ImagingSelection resource representing a referenced segmentation source image content item [CID 121233 "Source Image For Segmentation"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_121233)
* [Source Series For Segmentation](StructureDefinition-source-series-for-segmentation.html) profiles the ImagingSelection resource representing a referenced segmentation source series content item [CID 121232 "Source Series For Segmentation"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_121232)
* [Region In Space](StructureDefinition-region-in-space.html) profiles the ImagingSelection resource representing a referenced RT Structure Set content item [CID 130488 "Region in Space"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_130488)
* [Volume Surface](StructureDefinition-volume-surface.html) profiles the ImagingSelection resource representing a referenced volume surface content item [CID 121231 "Volume Surface"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_121231)
* [Real World Value Map](StructureDefinition-real-world-value-map.html) profiles the ImagingSelection resource representing a referenced real world value map content item [CID 126100 "Real World Value Map used for measurement"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_126100)
* [Illustration of ROI](StructureDefinition-illustration-of-roi.html) profiles the ImagingSelection resource representing a referenced ROI illustration content item [CID 121200 "Illustration of ROI"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_121200)
* [Visual explanation](StructureDefinition-visual-explanation.html) profiles the ImagingSelection resource representing a referenced visual explanation content item [CID 130401 "Visual explanation](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_130401)

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
