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

* identifier ^slicing.discriminator.type = #value
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
* partOf[imagingStudyRef].identifier.type = DCM#110180 "Study Instance UID"
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

* focus ^slicing.discriminator.type = #profile
* focus ^slicing.discriminator.path = "resolve()"
* focus ^slicing.rules = #open
* focus ^slicing.ordered = false
* focus ^slicing.description = "Observation foci"

* focus contains trackingIdentifiers 0..* MS
* focus[trackingIdentifiers] only Reference(BodyStructureTrackingIdentifiers)

* focus contains imageRegion2d 0..* MS
* focus[imageRegion2d] only Reference(ImagingSelection2dImageRegionProfile)
* focus[imageRegion2d] ^short = "2D Image Region"

* focus contains imageRegion3d 0..* MS
* focus[imageRegion3d] only Reference(ImagingSelection3dImageRegionProfile)
* focus[imageRegion3d] ^short = "3D Image Region"

* focus contains referencedSegment 0..* MS
* focus[referencedSegment] only Reference(ImagingSelectionReferencedSegmentProfile)
* focus[referencedSegment] ^short = "Referenced Segment"

* focus contains referencedSegmentationFrame 0..* MS
* focus[referencedSegmentationFrame] only Reference(ImagingSelectionReferencedSegmentationFrameProfile)
* focus[referencedSegmentationFrame] ^short = "Referenced Segmentation Frame"

* focus contains sourceImageForSegmentation 0..* MS
* focus[sourceImageForSegmentation] only Reference(ImagingSelectionSourceImageForSegmentationProfile)
* focus[sourceImageForSegmentation] ^short = "Source Image for Segmentation"

* focus contains sourceSeriesForSegmentation 0..* MS
* focus[sourceSeriesForSegmentation] only Reference(ImagingSelectionSourceSeriesForSegmentationProfile)
* focus[sourceSeriesForSegmentation] ^short = "Source Series for Segmentation"

* focus contains regionInSpace 0..* MS
* focus[regionInSpace] only Reference(ImagingSelectionRegionInSpaceProfile)
* focus[regionInSpace] ^short = "RegionInSpace"

* focus contains volumeSurface 0..* MS
* focus[volumeSurface] only Reference(ImagingSelectionVolumeSurfaceProfile)
* focus[volumeSurface] ^short = "Volume Surface"

* focus contains realWorldValueMap 0..* MS
* focus[realWorldValueMap] only Reference(ImagingSelectionRealWorldValueMapProfile)
* focus[realWorldValueMap] ^short = "Real World Value Map"

* focus contains illustrationOfRoi 0..* MS
* focus[illustrationOfRoi] only Reference(ImagingSelectionIllustrationOfROIProfile)
* focus[illustrationOfRoi] ^short = "Illustration of ROI"

* focus contains visualExplanation 0..* MS
* focus[visualExplanation] only Reference(ImagingSelectionVisualExplanationProfile)
* focus[visualExplanation] ^short = "VisualExplanation"

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
* valueCodeableConcept -> "TID1500.EV(C0034375, UMLS, Qualitative Evaluations)[n].tag(0040,A160) [Text Value] or .tag(0040,A168) [Concept Code Sequence]"

Instance: Example-Observation-ImagingQualitativeEvaluation-001
InstanceOf: ImagingQualitativeEvaluationProfile
Usage: #example
Description: "Example of Observation representing a DICOM SR Measurement Qualitative Evaluation."

* id = "qualitative-evaluation-001"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* partOf = Reference(Example-ImagingStudy)
* issued = "2024-07-24T08:23:42+00:00"
* status = #final
* code
  * coding
    * system = "https://ncit.nci.nih.gov"
    * code = #C45992 "Subtlety score"
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)
* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-GeneralEquipment)
* valueCodeableConcept
  * coding
    * system = "http://cancerimagingarchive.net"
    * code = #105 "5 out of 5 (Obvious)"

Instance: Example-Observation-ImagingQualitativeEvaluation-002
InstanceOf: ImagingQualitativeEvaluationProfile
Usage: #example
Description: "Example of Observation representing a DICOM SR Measurement Qualitative Evaluation."

* id = "qualitative-evaluation-002"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* partOf = Reference(Example-ImagingStudy)
* issued = "2024-07-24T08:23:42+00:00"
* status = #final
* code
  * coding
    * system = "http://radlex.org"
    * code = #RID36042 "Malignancy"
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)
* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-GeneralEquipment)
* valueCodeableConcept
  * coding
    * system = "http://cancerimagingarchive.net"
    * code = #905 "5 out of 5 (Highly Suspicious for Cancer)"