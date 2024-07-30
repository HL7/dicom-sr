Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingQualitativeEvaluation
Parent:         ImagingObservationProfile
Id:             imaging-qualitative-evaluation
Title:          "Observation - DICOM SR Imaging Qualitative Evaluation Mapping to Observation"
Description:    "DICOM SR Imaging Qualitative Evaluation Mapping to Observation"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* category 1..* MS
* category = http://terminology.hl7.org/CodeSystem/umls#C0034375 "Qualitative Evaluations"

* valueCodeableConcept 1..1 MS

Mapping: dicom-sr-for-TID1500MeasurementReportProfile
Id: dicom-sr-tid-1500
Title: "DICOM SR TID 1500 Measurement Report"
Source: ImagingQualitativeEvaluation
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1500"
Description: "The Qualitative Evaluation can be extracted from TID 1500 - Measurement Report."
* -> "TID1500(MeasurementReport)"
* identifier[observationUID] -> "tag(0040,A171) [Observation UID]"
* subject -> "tag(0010,0020) [Patient ID]"
* code -> "TID1500.EV(C0034375, UMLS, Qualitative Evaluations)[n].tag(0040,A043) [Concept Name Code Sequence]"
* issued -> "tag(0040,A032) [Observation DateTime]"
* valueCodeableConcept -> "TID1500.EV(C0034375, UMLS, Qualitative Evaluations)[n].tag(0040,A160) [Text Value] or .tag(0040,A168) [Concept Code Sequence]"

Instance: Example-Observation-ImagingQualitativeEvaluation-001
InstanceOf: ImagingQualitativeEvaluation
Usage: #example
Description: "Example of Observation representing a DICOM SR Measurement Qualitative Evaluation."

* id = "qualitative-evaluation-001"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* partOf = Reference(Example-ImagingStudy)
* issued = "2024-07-24T08:23:42+00:00"
* effectiveDateTime = "2024-07-24T08:23:42+00:00"
* status = #final
* performer = Reference(Example-Practitioner)
* code
  * coding
    * system = "https://ncit.nci.nih.gov"
    * code = #C45992 "Subtlety score"
    * display = "Subtlety score"
* category = http://terminology.hl7.org/CodeSystem/umls#C0034375 "Qualitative Evaluations"
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)
* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-GeneralEquipment)
* valueCodeableConcept
  * coding
    * system = "http://cancerimagingarchive.net"
    * code = #105 "5 out of 5 (Obvious)"
    * display = "5 out of 5 (Obvious)"

Instance: Example-Observation-ImagingQualitativeEvaluation-002
InstanceOf: ImagingQualitativeEvaluation
Usage: #example
Description: "Example of Observation representing a DICOM SR Measurement Qualitative Evaluation."

* id = "qualitative-evaluation-002"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* partOf = Reference(Example-ImagingStudy)
* issued = "2024-07-24T08:23:42+00:00"
* effectiveDateTime = "2024-07-24T08:23:42+00:00"
* status = #final
* performer = Reference(Example-Practitioner)
* code
  * coding
    * system = "http://radlex.org"
    * code = #RID36042 "Malignancy"
    * display = "Malignancy"
* category = http://terminology.hl7.org/CodeSystem/umls#C0034375 "Qualitative Evaluations"
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)
* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-GeneralEquipment)
* valueCodeableConcept
  * coding
    * system = "http://cancerimagingarchive.net"
    * code = #905 "5 out of 5 (Highly Suspicious for Cancer)"
    * display = "5 out of 5 (Highly Suspicious for Cancer)"