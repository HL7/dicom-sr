This Implementation Guide defines the use of FHIR resources to convey measurements, derived measurements and  Qualitative Evaluations extracted from a DICOM SR Measurement Report.

### Organization of this implementation guide

This IG is organized into three main sections:

* [Chapter I](background.html): Background - Introduction and overview
    * [Problem](background.html#problem) - Description of the problem
    * [Scope](background.html#scope) - Scope of the IG
    * [Intended Readers](background.html#readers) - Intended readers of the IG
    * [Use cases](background.html#use-cases) - Key use cases covered by the IG
    * [Glossary](background.html#glossary) - Glossary
    * [References](background.html#references) - References
* [Chapter II](architecture.html): Architecture & Implementation
    * [Profiles & Extensions](architecture.html#profiles) - FHIR Profiles and extensions defined in the IG
      * [Resources](architecture.html#resources) - FHIR Resource Profiles
        * [Observation](architecture.html#resource-observation) - Observation
        * [ImagingSelection](architecture.html#resource-imagingselection) - ImagingSelection
        * [Device](architecture.html#resource-device) - Device
        * [BodySite](architecture.html#resource-bodysite) - BodySite
      * [Data Types](architecture.html#data-types) - FHIR Data Type Profiles
      * [Extensions](architecture.html#extensions) - FHIR Extensions
      * [Profile Relationships](architecture.html#relationships) - Relationships between profiled FHIR resources and other standards
        * [DICOM SR Basics](architecture.html#dicom-sr) - Overview of DICOM SR and terminology
        * [Relationship to DICOM SR TID 1500 Measurement Report](architecture.html#tid-1500) - Mapping of content from DICOM SR Measurement Report
          * [Imaging Measurement Group Relationship](architecture.html#imaging-measurement-group) - Mapping of imaging measurement groups
          * [Derived Imaging Measurements Relationship](architecture.html#derived-imaging-measurement) - Mapping of derived imaging measurements
          * [Imaging Qualitative Evaluations Relationship](architecture.html#imaging-qualitative-evalutation) - Mapping of imaging qualitative evaluations
        * [Device Relationship](architecture.html#relationship-device) - Mapping of devices from a DICOM SR Measurement Report
    * [Actors](architecture.html#actors) - Actors participating in the IG
    * [Terminology](architecture.html#terminology) - Value Sets defined and used
    * [Security Consideration](architecture.html#sec) - Security aspects to be taken in consideration
* [Chapter III](mapping.html): Measurement Report Processing Mapping
    * [DICOM SR Measurement Report Instance Mapping](mapping.html#sr_instance)
    * [DICOM SR Document Mapping](mapping.html#sr_document)
    * [Imaging Measurements Container Mapping](mapping.html#imaging_measurements_container)
    * [Imaging Measurement Group Mapping](mapping.html#imaging_measurement_group)
* [Chapter IV](testing.html): Testing & Conformance
    * [Test Plan](testing.html#testplan) - Test plans for the different actors
    * [Test Data](testing.html#testdata) - Test data that can be used
    * [Resources Samples](testing.html#samples) - Samples of resources profiled following this IG

### Copyrights and acknowledgments

This document is licensed under Creative Commons "No Rights Reserved" (CC0).

#### Value Sets
Value Sets in this guide include:

* Vocabulary Content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organization (IHTSDO) and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement
* Vocabulary Content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at LOINC/license.

#### Trademarks
LOINC® is a registered United States trademark of Regenstrief Institute, Inc.

SNOMED® and "SNOMED CT" are registered trademarks of the IHTSDO.

HL7®, HEALTH LEVEL SEVEN®, FHIR® and the FHIR® Logo are trademarks owned by Health Level Seven International, registered with the United States Patent and Trademark Office.

DICOM® is a registered trademark of the National Electrical Manufacturers Association for its standards publications relating to digital communications of medical information.

IHE® is a registered trademark of the Healthcare Information Management Systems Society in the United States and trademarks of IHE Europe in the European Community.


### Sponsors Working Groups
* [Imaging Integration Work Group](http://www.hl7.org/Special/committees/imagemgt/index.cfm)

### Contributors

| Name        |      Organization       |  Role |
|--------------------------|-----------------------|--------------|
| Jonathan Whitby | Canon Medical | Author |
| Christopher Lindop | GE Healthcare | Author |
