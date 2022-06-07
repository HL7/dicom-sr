Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        DICOMSRFindingSiteBodyStructureProfile
Parent:         BodyStructure
Id:             dicom-sr-finding-site-body-structure
Title:          "Body Structure - DICOM SR Finding Site Mapping"
Description:    "DICOM SR Finding Site Mapping to BodyStrucutre"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent
* includedStructure.laterality MS

Mapping: dicom-sr-for-findingSiteProfile
Id: dicom-sr
Title: "DICOM SR Finding Site"
Source: DICOMSRFindingSiteBodyStructureProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_300"
Description: "The FindingSiteBodyStructure can be extracted from TID 300 EV(363698007, SCT, Finding Site) and EV (272741003, SCT, Laterality)."
* -> "TID300(FindingSite)"
* includedStructure.structure.coding -> "TID300.EV(363698007, SCT, Finding Site)"
* includedStructure.structure.laterality -> "TID300.EV(272741003, SCT, Laterality)"
