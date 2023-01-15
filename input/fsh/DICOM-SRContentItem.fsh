Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Logical:        DICOMCodedValue
Id:             dicom-code
Title:          "DICOM Coded Value Representation"
Description:    "DICOM representation of coded values"

* codevalue 1..1 SU string "Code Value -- equivalent to FHIR coding.value"
* codingschemedesignator 1..1 SU string "Coding Scheme Designator -- equivalent to FHIR coding.system"
* codemeaning 1..1 SU string "Code Meaning -- equivalent to FHIR coding.display"

Logical:       DICOMSRContentItem
Id:             dicom-sr-content-item
Title:          "DICOM - SR Content Item Structure Definition"
Description:    "Representing a DICOM SR Content Item as a FHIR Structure Definition"

* relationshiptype 0..1 SU code "Relationship to parent Content Item"
* valuetype 1..1 SU code "Content Item type"
* conceptnamecodesequence 0..1 SU DICOMCodedValue "Content Item Concept Name"
* textvalue 0..1 SU string "Content Item textual value"
* uid 0..1 SU string "Content Item UID value"
* observationuid 0..1 SU string "Content Item UID"
* contentSequence 0..* SU DICOMSRContentItem "Child content items"
