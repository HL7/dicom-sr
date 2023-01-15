Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Logical:        DICOMCodedValue
Id:             dicom-code
Title:          "EXPERIMENTAL - DICOM Coded Value Representation"
Description:    "EXPERIMENTAL - DICOM representation of coded values"

* CodeValue 1..1 SU string "Code Value -- equivalent to FHIR coding.value"
* CodingSchemedesignator 1..1 SU string "Coding Scheme Designator -- equivalent to FHIR coding.system"
* CodeMeaning 1..1 SU string "Code Meaning -- equivalent to FHIR coding.display"

Logical:       DICOMSRContentItem
Id:             dicom-sr-content-item
Title:          "EXPERIMENTAL - DICOM SR Content Item Structure Definition"
Description:    "EXPERIMENTAL - Representing a DICOM SR Content Item as a FHIR Structure Definition"

* RelationshipType 0..1 SU code "Relationship to parent Content Item"
* ValueType 1..1 SU code "Content Item type"
* ConceptNameCodeSequence 0..1 SU DICOMCodedValue "Content Item Concept Name"
* TextValue 0..1 SU string "Content Item textual value"
* UID 0..1 SU string "Content Item UID value"
* ObservationUID 0..1 SU string "Content Item UID"
* SontentSequence 0..* SU DICOMSRContentItem "Child content items"
