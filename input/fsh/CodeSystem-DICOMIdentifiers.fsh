CodeSystem: DicomIdentifierType
Id: dicom-identifier-type
Title: "Identifiers - DICOM Identifier Type"
Description: "Identifier types related to DICOM® UIDs"

* ^caseSensitive = true
* ^content = #complete
* ^hierarchyMeaning = #is-a
* ^experimental = false
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/imagemgt"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[0].valueCode = #ii
* #observation-uid "Observation UID" "Uniquely identifies the observation"
