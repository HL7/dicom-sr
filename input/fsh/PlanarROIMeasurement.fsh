Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        DICOMSRROIMeasurementProfile
Parent:         Observation
Id:             dicom-sr-planar-roi-measurement
Title:          "DICOM SR Planar ROI Measurements and Qualitative Evaluations Mapping to Observation"
Description:    "DICOM SR Planar ROI Measurements and Qualitative Evaluations Mapping to Observation"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Identifiers for the planar ROI measurement"

* identifier contains observationUID 0..1 and trackingUID 0..1 and trackingID 0..1
* identifier[observationUID].type = DCMIdType#observation-uid "Observation UID"
* identifier[observationUID].system = "urn:dicom:uid"
* identifier[observationUID].value 1..1
* identifier[observationUID] ^short = "Unique identifier for the observation value (and its subsidiary observations, if any)"
* identifier[trackingUID].type = DCMIdType#tracking-uid "Tracking UID"
* identifier[trackingUID].system = "urn:dicom:uid"
* identifier[trackingUID].value 1..1
* identifier[trackingUID] ^short = "A unique identifier used for tracking a finding or feature, potentially across multiple observations, over time."
* identifier[trackingID].type = DCMIdType#tracking0id "Tracking ID"
* identifier[trackingID].value 1..1
* identifier[trackingID] ^short = "A text label used for tracking a finding or feature, potentially across multiple observations, over time"


// Associated Procedure/Exam
* partOf ^slicing.discriminator.type = #type
* partOf ^slicing.discriminator.path = "reference"
* partOf ^slicing.rules = #open
* partOf ^slicing.description = "Description of the related ImagingStudy"

* partOf contains imagingStudyRef 1..1
* partOf[imagingStudyRef] only Reference(ImagingStudy)
* partOf[imagingStudyRef] ^short = "Related ImagingStudy"


* code ^short = "EV (121071, DCM, 'Finding')"
* subject only Reference(Patient)
* subject 1..1
* subject ^short = "Subject of the observation"
