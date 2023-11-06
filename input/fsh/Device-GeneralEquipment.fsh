Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        GeneralEquipmentProfile
Parent:         Device
Id:             dicom-general-equipment
Title:          "Device - DICOM General Equipment"
Description:    "DICOM General Equipment to Device"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* identifier 0..1 MS
* displayName 0..1 MS

Mapping: dicom-sr-for-GeneralEquipmentProfile
Id: dicom-sr
Title: "DICOM SR General Equipment"
Source: GeneralEquipmentProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.7.5.html#sect_C.7.5.1"
Description: "The GeneralEquipmentProfile can be extracted from DICOM PS 3.3 Sect C.7.5  General Equipment Module."
* -> "DICOM PS 3.3 C.7.5.1 (General Equipment)"
* identifier -> "tag(0018,1002) [Device UID]"
* displayName -> "tag(0008,1090) [Manufacturer's Model Name]"
