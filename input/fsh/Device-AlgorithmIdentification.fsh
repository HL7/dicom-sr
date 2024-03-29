Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        AlgorithmIdentificationProfile
Parent:         Device
Id:             algorithm-identification
Title:          "Device - DICOM SR TID 4019 Algorithm Identification Mapping"
Description:    "DICOM SR Algorithm Identification to Device"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* displayName 0..1 MS
* type 0..* MS
* version 0..* MS
* property 0..* MS
* parent 0..1 MS

Mapping: dicom-sr-for-AlgorithmIdentificationProfile
Id: dicom-sr
Title: "DICOM SR TID 4019 Algorithm Identification"
Source: AlgorithmIdentificationProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_4019"
Description: "The TID4019AlgorithmIdentification can be extracted from TID 4019 - Algorithm Identification."
* -> "TID4019(Algorithm Identification)"
* displayName -> "TID4109.EV(111001, DCM, Algorithm Name)"
* version -> "TID4109.EV(111003, DCM, Algorithm Version)"
* property -> "TID4109.EV(111002, DCM, Algorithm Parameters)"
* type -> "TID4109.EV(111000, DCM, Algorithm Family)"
