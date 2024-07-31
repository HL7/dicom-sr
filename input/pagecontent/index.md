This Implementation Guide defines the use of FHIR resources to convey measurements, derived measurements and  Qualitative Evaluations extracted from a DICOM SR Measurement Report.

### Organization of this implementation guide

This IG is organized into three main sections:

* [Chapter I](background.html): Background - Introduction and overview
    * [Problem](background.html#problem) - Description of the problem
    * [Scope](background.html#scope) - Scope of the IG
    * [Intended Readers](background.html#intended-readers) - Intended readers of the IG
    * [Use cases](background.html#use-cases) - Key use cases covered by the IG
    * [Excluded use cases](background.html#excluded-use-cases) - Excluded use cases
    * [FHIR Version 4 compatibility](background.html#fhir-version-4-compatibility) - FHIR Version 4 compatibility
    * [Glossary](background.html#glossary) - Glossary
    * [References](background.html#references) - References
    * [IG Dependencies](background.html#ig-dependencies) - Dependencies on other IGs
    * [Global Profiles](background.html#global-profiles) - Global profiles used in this IG
    * [Copyrights](background.html#copyrights) - Copyrights and acknowledgments
* [Chapter II](architecture.html): Architecture & Implementation
    * [Profiles & Extensions](architecture.html#profiles--extensions) - FHIR Profiles and extensions defined in the IG
      * [Resources](architecture.html#resource-profiles) - FHIR Resource Profiles
        * [Observation](architecture.html#observation) - Observation
        * [ImagingSelection](architecture.html#imagingselection) - ImagingSelection
        * [Device](architecture.html#device) - Device
        * [BodyStructure](architecture.html#bodystructure) - BodyStructure
      * [Data Types](architecture.html#supporting-datatype-profiles) - FHIR Data Type Profiles
      * [Extensions](architecture.html#supporting-extensions) - FHIR Extensions
      * [Profile Relationships](architecture.html#profile-relationships) - Relationships between profiled FHIR resources and other standards
        * [DICOM SR Basics](architecture.html#dicom-sr-basics) - Overview of DICOM SR and terminology
        * [Relationship to DICOM SR TID 1500 Measurement Report](architecture.html#relationship-to-dicom-sr-tid-1500-measurement-report) - Mapping of content from DICOM SR Measurement Report
          * [Imaging Measurement Group Relationship](architecture.html#imaging-measurement-group-relationship) - Mapping of imaging measurement groups
          * [Derived Imaging Measurements Relationship](architecture.html#derived-imaging-measurements-relationship) - Mapping of derived imaging measurements
          * [Imaging Qualitative Evaluations Relationship](architecture.html#imaging-qualitative-evaluations-relationship) - Mapping of imaging qualitative evaluations
        * [Device Relationship](architecture.html#device-relationship) - Mapping of devices from a DICOM SR Measurement Report
        * [Other Resource Relationships](architecture.html#other-resource-relationships) - Relationships to other FHIR resources
    * [Actors](architecture.html#actors) - Actors participating in the IG
    * [Terminology](architecture.html#terminology) - Value Sets defined and used
    * [Security Consideration](architecture.html#security-consideration) - Security aspects to be taken in consideration
* [Chapter III](mapping.html): Measurement Report Processing Mapping
    * [DICOM SR Measurement Report Mapping Overview](mapping.html#dicom-sr-measurement-report-mapping-overview) - Overview of the mapping process
    * [DICOM SR Measurement Report Instance Mapping](mapping.html#dicom-sr-measurement-report-instance-mapping)
    * [DICOM SR Document Mapping](mapping.html#document-ie-mapping)
    * [Imaging Measurements Container Mapping](mapping.html#imaging-measurements-container-mapping)
    * [Imaging Measurement Group Mapping](mapping.html#imaging-measurement-group-mapping)
    * [Imaging Measurement Mapping](mapping.html#imaging-measurement-mapping)
    * [Imaging Qualitative Evaluation Mapping](mapping.html#imaging-qualitative-evaluation-mapping)
    * [Derived Imaging Measurements Mapping](mapping.html#derived-imaging-measurement-mapping)
* [Chapter IV](example.html): Example DICOM SR Measurement Report Mapping
    * [Patient Mapping](example.html#example-patient-mapping) - Patient Mapping Example
    * [Service Request Mapping](example.html#example-service-request-mapping) - Service Request Mapping Example
    * [Imaging Study Mapping](example.html#example-imaging-study-mapping) - Imaging Study Mapping Example
    * [Device Mapping](example.html#example-device-mapping) - Device Mapping Example
    * [Document Mapping](example.html#example-document-mapping) - Document Mapping Example
    * [Imaging Measurements Container Mapping](example.html#example-imaging-measurement-container-mapping) - Imaging Measurements Container Mapping Example
    * [Imaging Measurement Group Mapping](example.html#example-imaging-measurement-group-mapping) - Imaging Measurement Group Mapping Example
    * [Imaging Measurement Mapping](example.html#example-imaging-measurement-mapping) - Imaging Measurement Mapping Example
    * [Imaging Qualitative Evaluation Mapping](example.html#example-imaging-qualitative-evaluation-mapping) - Imaging Qualitative Evaluation Mapping Example
    * [Example Instance](example.html#example-measurement-report) - Complete Example DICOM SR Measurement Report

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
* [Imaging Integration Work Group](http://www.hl7.org/Special/committees/imagemgt)

### Contributors

| Name | Organization | Role |
| ---- | ---- | ---- |
| Jonathan Whitby | Canon Medical | Author |
| Christopher Lindop | GE Healthcare | Author |
