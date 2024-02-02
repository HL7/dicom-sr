Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingQualitativeEvaluationProfile
Parent:         Observation
Id:             imaging-qualitative-evaluation
Title:          "Observation - DICOM SR Imaging Qualitative Evaluation Mapping to Observation"
Description:    "DICOM SR Imaging Qualitative Evaluation Mapping to Observation"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* identifier ^slicing.discriminator.type = value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Identifiers for the qualitative evaluation"

* identifier contains observationUID 0..* MS
* identifier[observationUID].type = DCMIdType#observation-uid "Observation UID"
* identifier[observationUID].system = "urn:dicom:uid"
* identifier[observationUID].value 1..1
* identifier[observationUID] ^short = "The unique identifier for the measurement group."

// Associated ServiceRequest
* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = "reference"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Description of the related ServiceRequest"

* basedOn contains serviceRequestRef 0..1 MS
* basedOn[serviceRequestRef] only Reference(ServiceRequest)
* basedOn[serviceRequestRef] ^short = "Description of the related ServiceRequest"
* basedOn[serviceRequestRef].identifier.type 1..1
* basedOn[serviceRequestRef].identifier.type = HL7IdType#ACSN "Accession ID"
* basedOn[serviceRequestRef].identifier.value 1..1
* basedOn[serviceRequestRef].identifier ^short = "The accession number related to the performed study"

// Associated Imaging Study
* partOf ^slicing.discriminator.type = #type
* partOf ^slicing.discriminator.path = "reference"
* partOf ^slicing.rules = #open
* partOf ^slicing.description = "Description of the related ImagingStudy" 

* partOf contains imagingStudyRef 1..1 MS
* partOf[imagingStudyRef] only Reference(ImagingStudy)
* partOf[imagingStudyRef] ^short = "Related ImagingStudy"
* partOf[imagingStudyRef].identifier.type 1..1
* partOf[imagingStudyRef].identifier.type = DCMIdType#study-instance-uid "Study Instance UID"
* partOf[imagingStudyRef].identifier.system = "urn:dicom:uid"
* partOf[imagingStudyRef].identifier.value 1..1
* partOf[imagingStudyRef].identifier ^short = "Identifier related to Study Instance UID"

* category MS
* category = http://terminology.hl7.org/CodeSystem/umls#C0034375 "Qualitative Evaluations"

* code MS

* subject only Reference(Patient)
* subject 1..1 MS

// Observation Date Time
* issued 1..1 MS
* issued ^short = "Observation Date Time"

* device 1..1 MS
* device only Reference(AlgorithmIdentificationProfile or GeneralEquipmentProfile)
* device ^short = "Algorithm Identification or General Equipment Device"

* valueCodeableConcept MS

Mapping: dicom-sr-for-TID1500MeasurementReportProfile
Id: dicom-sr-tid-1500
Title: "DICOM SR TID 1500 Measurement Report"
Source: ImagingQualitativeEvaluationProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1500"
Description: "The Qualitative Evaluation can be extracted from TID 1500 - Measurement Report."
* -> "TID1500(MeasurementReport)"
* identifier[observationUID] -> "tag(0040,A171) [Observation UID]"
* subject -> "tag(0010,0020) [Patient ID]"
* code -> "TID1500.EV(C0034375, UMLS, Qualitative Evaluations)[n].tag(0040,A043) [Concept Name Code Sequence]"
* issued -> "tag(0040,A032) [Observation DateTime]"
* valueCodeableConcept -> "TID1500.EV(C0034375, UMLS, Qualitative Evaluations)[n].tag(0040,A160) [Text Value]"
* valueCodeableConcept -> "TID1500.EV(C0034375, UMLS, Qualitative Evaluations)[n].tag(0040,A168) [Concept Code Sequence]"
