This chapter describes the architecture of this implementation guide.

### Profiles & Extensions
#### Resource Profiles
<figure>
  {% include dicom_sr_resource_relationships.svg %}
  <figcaption><b>Figure: IG Resource Relationships</b></figcaption>
  <p></p>
</figure>

##### Observation
The mapping of the core DICOM SR measurement groups, measurements, and qualitative analysis content items are covered by the following resource profiles:

* [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html) profiles the Observation resource representing DICOM SR measurement group templates:
    * [DTID 1410 “Planar ROI Measurements and Qualitative Evaluations”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410)
    * [DTID 1411 “Volumetric ROI Measurements and Qualitative Evaluations”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411)
    * [DTID 1501 “Measurement and Qualitative Evaluation Group”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1501)

* [Imaging Measurement](StructureDefinition-imaging-measurement.html) profiles the Observation resource representing imaging measurements extracted from DICOM SR measurement templates:
    * [DTID 300 “Measurement”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_300)
    * [DTID 1419 “ROI Measurements”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1419)
    
* [Derived Imaging Measurement](StructureDefinition-derived-imaging-measurement.html) profiles the Observation resource representing the DICOM SR-derived measurement template [DTID 1420 “Measurements Derived From Multiple ROI Measurements”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1420)

* [Imaging Qualitative Evaluation](StructureDefinition-imaging-qualitative-evaluation.html) profiles the Observation resource representing qualitative evaluation content items extracted from DICOM SR measurement templates:
    * [DTID 1500 “Measurement Report”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1500)
        * Children of Content Item with Concept Name UMLS#C0034375 "Qualitative Evaluations" 
    * [DTID 1501 “Measurement and Qualitative Evaluation Group”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1501)
        * Select `CODE` and `TEXT` children of Content Item with Concept Name DCM#125007 "Measurement Group"

The above resource profiles depend on the following resource profiles:
##### ImagingSelection
* [Image Region -- 2D](StructureDefinition-image-region-2d.html) profiles the ImagingSelection resource representing a referenced 2D image region content item with concept name [DCM#111030 "Image Region"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_111030) and a VT of SCOORD
* [Image Region -- 3D](StructureDefinition-image-region-3d.html) profiles the ImagingSelection resource representing a referenced 3D image region content item with concept name [DCM#111030 "Image Region"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_111030) and a VT of SCOORD3D
* [Referenced Segment](StructureDefinition-referenced-segment.html) profiles the ImagingSelection resource representing a referenced segment content item with concept name [DCM#121191 "Referenced Segment"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_121191)
* [Referenced Segmentation Frame](StructureDefinition-referenced-segmentation-frame.html) profiles the ImagingSelection resource representing a referenced segmentation frame content item with concept name [DCM#121214 "Referenced Segmentation Frame"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_121214)
* [Region In Space](StructureDefinition-region-in-space.html) profiles the ImagingSelection resource representing a referenced RT Structure Set content item with concept name [DCM#130488 "Region in Space"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_130488)
* [Volume Surface](StructureDefinition-volume-surface.html) profiles the ImagingSelection resource representing a referenced volume surface content item with concept name [DCM#121231 "Volume Surface"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_121231)
* [Real World Value Map](StructureDefinition-real-world-value-map.html) profiles the ImagingSelection resource representing a referenced real world value map content item with concept name [DCM#126100 "Real World Value Map used for measurement"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_126100)
* [Illustration of ROI](StructureDefinition-illustration-of-roi.html) profiles the ImagingSelection resource representing a referenced ROI illustration content item with concept name [DCM#121200 "Illustration of ROI"](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_121200)
* [Visual explanation](StructureDefinition-visual-explanation.html) profiles the ImagingSelection resource representing a referenced visual explanation content item with concept name [DCM#130401 "Visual explanation](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_D.html#DCM_130401)

##### Device
* [Algorithm Identification](StructureDefinition-algorithm-identification.html) profiles the Device resource representing the DICOM SR template [DTID 4019 “Algorithm Identification”](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_TID_4019.html)
* [General Equipment](StructureDefinition-dicom-general-equipment.html) profiles the Device resource representing the DICOM General Equipment Module [DICOM PS3.3 C.7.5.1 General Equipment Module](https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.7.5.html#sect_C.7.5.1)

##### BodyStructure
* [Finding Site](StructureDefinition-dicom-sr-finding-site.html) profiles the BodyStructure resource representing a finding site content item with concept name [SCT#363698007 "Finding Site"](http://snomed.info/id/363698007)

#### Supporting DataType Profiles
There are no special supporting DataType profiles defined by this IG.

#### Supporting Extensions
There are no special supporting extensions defined by this IG.

#### Profile Relationships
##### DICOM SR Basics
The content of a DICOM SR is a tree of "content items." Each content item has:
* a coded "Concept Name" describing the content item
* a "Value Type"
* a value (for most value types)
* zero or more children, each of which is also a content item[^1]

The content item value types relevant to this implementation guide are:
* `CONTAINER`: a container with children but no value
* `NUM`: a numerical value with units
* `TEXT`: a textual value
* `CODE`: a coded value
  * Note that a `CODE` content item has a coded concept name *and* a coded value

##### Relationship to DICOM SR TID 1500 Measurement Report
This implementation guide maps content items contained within the DICOM TID 1500 Measurement Report to FHIR resources.

All mapped content items are children of the following `CONTAINER` content items:

| Container Concept Name                    | Child FHIR Resource Profile                                                               | Notes                                                                                             |
|-------------------------------------------|-------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| DCM#126010 "Imaging Measurements"         | [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html)           | See [Imaging Measurement Group relationship](#imaging-measurement-group-relationship)             | 
| DCM#126011 "Derived Imaging Measurements" | [Derived Imaging Measurements](StructureDefinition-derived-imaging-measurement.html)      | See [Derived Imaging Measurements relationship](#derived-imaging-measurements-relationship)       |
| UMLS#C0034375 "Qualitative Evaluations"   | [Imaging Qualitative Evaluation](StructureDefinition-imaging-qualitative-evaluation.html) | See [Imaging Qualitative Evaluations relationship](#imaging-qualitative-evaluations-relationship) |

e.g., the children of the `CONTAINER` with a Concept Name of DCM#126010 "Imaging Measurements" are mapped to [Measurement Group](StructureDefinition-imaging-measurement-group.html) Observations.

<figure>
  {% include tid_1500_measurement_report.svg %}
  <figcaption><b>Figure: TID 1500 Measurement Report and its children Overview</b></figcaption>
  <p></p>
</figure>

###### Imaging Measurement Group Relationship
An Imaging Measurement Group `CONTAINER` contains 0-n `NUM` content items representing numerical measurements. Each of these is mapped to an [Imaging Measurement](StructureDefinition-imaging-measurement.html) Observation.

An Imaging Measurement Group `CONTAINER` contains 0-n `TEXT` or `CODE` content items representing qualitative evaluations. Each of these is mapped to an [Imaging Qualitative Evaluation](StructureDefinition-imaging-qualitative-evaluation.html) Observation. 

The Imaging Measurement Group `CONTAINER` is mapped to an [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html) Observation. 

The [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html) Observation `hasMember` element references the child [Imaging Measurement](StructureDefinition-imaging-measurement.html) and [Imaging Qualitative Evaluation](StructureDefinition-imaging-qualitative-evaluation.html) Observations.

**Note:** Not all `TEXT` or `CODE` content items contained within the Imaging Measurement Group represent qualitative evaluations. 

A `TEXT` or `CODE` child content item should only be interpreted as a qualitative evaluation if it does **not** have a Concept Name from the following list:

* DCM#112039 "Tracking Identifier"
* DCM#121071 "Finding"
* DCM#130400 "Geometric purpose of region"
* NCIt#C67447 "Activity Session"
* SCT#276214006 "Finding Category"
* SCT#363698007 "Finding Site"
* SCT#370129005 "Measurement Method"

The mapping of relevant child items in this list is described in Imaging Measurement Group Mapping (see [Imaging Measurement Group Mapping](mapping.html#imaging-measurement-group-mapping)).


###### Derived Imaging Measurements Relationship
A Derived Imaging Measurement `CONTAINER` contains 0-n `NUM` content items representing derived numerical measurements. Each of these is mapped to a [Derived Measurement](StructureDefinition-derived-imaging-measurement.html) Observation.

A Derived Imaging Measurement `CONTAINER` contains 0-n Imaging Measurement Group `CONTAINER` content items. Each of these is mapped to an [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html) Observation (see [Imaging Measurement Group relationship](#imaging-measurement-group-relationship)).

The [Derived Imaging Measurements](StructureDefinition-derived-imaging-measurement.html) Observation `derivedFrom` element references the child [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html) Observations. 


###### Imaging Qualitative Evaluations Relationship
An Imaging Qualitative Evaluations `CONTAINER` contains 0-n `TEXT` or `CODE` content items representing qualitative evaluations. Each of these is mapped to an [Imaging Qualitative Evaluation](StructureDefinition-imaging-qualitative-evaluation.html) Observation.


##### Device Relationship
A FHIR Observation can only have a single `device` value. However, a DICOM SR can have two types of devices:
* The equipment that created the SR
* An algorithm used to create the Observation
  
The DICOM SR General Equipment Module attributes are mapped to a [General Equipment](StructureDefinition-dicom-general-equipment.html) Device.

If an [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html), [Imaging Measurement](StructureDefinition-imaging-measurement.html), [Imaging Qualitative Evaluation](StructureDefinition-imaging-qualitative-evaluation.html) or [Derived Imaging Measurement](StructureDefinition-derived-imaging-measurement.html) has a child with Concept Name DCM#111001 "Algorithm Name" then it is mapped to an [Algorithm Identification](StructureDefinition-algorithm-identification.html) Device.

All algorithm devices will use the [General Equipment](StructureDefinition-dicom-general-equipment.html) Device to populate the `parent` element.

If an [Imaging Measurement Group](StructureDefinition-imaging-measurement-group.html), [Imaging Measurement](StructureDefinition-imaging-measurement.html), [Imaging Qualitative Evaluation](StructureDefinition-imaging-qualitative-evaluation.html) or [Derived Imaging Measurement](StructureDefinition-derived-imaging-measurement.html) does not have a defined device then the `device` element will reference the [General Equipment](StructureDefinition-dicom-general-equipment.html) Device.

<figure>
  {% include dicom_sr_device.svg %}
  <figcaption><b>Figure: DICOM SR Device relationships Overview</b></figcaption>
  <p></p>
</figure>
e.g. 
* If an Imaging Qualitative Evaluation is part of an Imaging Measurement Group:
  * If both have a defined Algorithm Identification Device, both devices will be created and each will have the Equipment Device as its parent.
  * If the Imaging Qualitative Evaluation does not have a defined Algorithm Identification Device it's `device` element will reference the Equipment Device

##### Other Resource Relationships

All DICOM SOP Instances include information relating to the patient, service request, procedure, etc.

Typically, these resources are managed by the EMR, and the imaging system is not able to create or update these resources in the FHIR server.

Therefore, this implementation guide assumes that these resources already exist in the destination FHIR server and does not include a full mapping between their DICOM representation and their FHIR representation.

Instead, it specifies the identifier mapping to allow newly created resources to be associated with the appropriate existing FHIR resources.

See [DICOM SR Information Object Definition (IOD) Mapping to FHIR](ConceptMap-dicom-sr-measurement-report-to-fhir.html) and [DICOM SR Document Information Entity (IE) Mapping to FHIR](ConceptMap-dicom-document-ie-to-fhir.html).

### Actors

### Terminology
#### Code Systems Used
This implementation guide draws on a number of formal code systems.

The following table presents the external code systems used in this implementation guide:

|Code System|Code System Name|Code System URL|Description|
|-----------|----------------|---------------|-----------|
| SCT       | SNOMED CT      | http://snomed.info/sct | A comprehensive clinical terminology used for clinical concepts including body structures, findings, procedures, and qualitative evaluations|
| DCM       | DICOM Controlled Terminology | http://dicom.nema.org/resources/ontology/DCM | A controlled terminology defined by the DICOM Standards Committee for use in DICOM Information Object Definitions (IODs) and Service-Object Pair (SOP) Classes. |
| UMLS      | Unified Medical Language System (UMLS) | https://www.nlm.nih.gov/research/umls/ | A compendium of many controlled vocabularies in the biomedical sciences, created by the U.S. National Library of Medicine. |
| NCIt      | NCI Thesaurus  | https://ncithesaurus.nci.nih.gov/ncitbrowser/ | A reference terminology and biomedical ontology used in cancer research and clinical care, developed by the National Cancer Institute. |
| LOINC     | Logical Observation Identifiers Names and Codes | http://loinc.org | A universal standard for identifying medical laboratory observations, clinical measurements, and documents. |
| UCUM      | Unified Code for Units of Measure | http://unitsofmeasure.org | A code system for unambiguously representing units of measure. |



#### Value Sets Used
These Value Sets are used in this implementation guide.

* [Concrete FHIR Resource Types](http://hl7.org/fhir/valueset-resource-types.html)
* 




### Security Consideration
Exchanging imaging measurement report resources makes use of patient-specific information which could be exploited by malicious actors resulting in exposure of patient data. For these reasons, all data exchange between the different actors must be secured appropriately with access to limited authorized individuals, data protected in transit, and appropriate audit measures taken. 

Implementers SHOULD be aware of these [security considerations](http://hl7.org/fhir/R5/security.html){:target="_blank"} associated with FHIR transactions, particularly those related to:

* [Communications](http://hl7.org/fhir/R5/security.html#http){:target="_blank"}
* [Authentication](http://hl7.org/fhir/R5/security.html#authentication){:target="_blank"}
* [Authorization/Access Control](http://hl7.org/fhir/R5/security.html#binding){:target="_blank"}
* [Audit Logging](http://hl7.org/fhir/R5/security.html#audit){:target="_blank"}
* [Digital Signatures](http://hl7.org/fhir/R5/signatures.html){:target="_blank"}
* [Security Labels](http://hl7.org/fhir/R5/security-labels.html){:target="_blank"}
* [Narrative](http://hl7.org/fhir/R5/security.html#narrative){:target="_blank"}

These security requirements are highlighted in the context of this IG:
* Systems **SHALL** keep audit logs of the various transactions. Some auditing workflows can be used like IHE ATNA or Restful ATNA.
* Systems **SHALL** use TLS version 1.2 or higher for all transmissions not taking place over a secure network connection. IHE ATNA may be followed for the TLS usage.
* Systems **SHALL** conform to FHIR [Communications Security requirements](http://hl7.org/fhir/R5/security.html#http){:target="_blank"}.
* Systems **SHALL** implement consent requirements per their country, state, local, and institutional policies.

[^1]: D. Clunie, DICOM Structured Reporting, PixelMed Publishing, 2000, p. 32 [E-book](http://www.pixelmed.com/srbook.html)