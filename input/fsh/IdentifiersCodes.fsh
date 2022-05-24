CodeSystem: DicomIdentifierType
Id: dicom-identifier-type
Title: "DICOM Identifier Type"
Description: "Identifier types related to DICOM UIDs"

* ^caseSensitive = true
* ^content = #complete
* ^hierarchyMeaning = #is-a
* #study-instance-uid "Study Instance UID" "Unique identifier for the Study"
* #sop-instance-uid "SOP Instance UID" "Uniquely identifies the SOP Instance"
* #observation-uid "Observation UID" "Uniquely identifies the observation"
* #tracking-id "Tracking ID" "Identifies a finding or feature over time"
* #tracking-uid "Tracking UID" "Uniquely identifies a finding or feature over time"
