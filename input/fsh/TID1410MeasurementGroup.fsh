Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        TID1410PlanarROIMeasurementGroupProfile
Parent:         Observation
Id:             tid-1410-planar-roi-measurement-group
Title:          "Observation - DICOM SR TID 1410 Planar ROI Measurement Group Mapping"
Description:    "DICOM SR TID 1410 Planar ROI Measurement Group Mapping to Observation"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Identifiers for the measurement group"

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
* category = DCM#125007 "Measurement Group"

* code MS

* subject only Reference(Patient)
* subject 1..1 MS

* focus ^slicing.discriminator.type = #pattern
* focus ^slicing.discriminator.path = "type"
* focus ^slicing.rules = #open
* focus ^slicing.ordered = false
* focus ^slicing.description = "Observation foci"

* focus contains bodyStructure 0..* MS
* focus[bodyStructure] only Reference(BodyStructure)
* focus[bodyStructure].identifier.type 1..1
* focus[bodyStructure].identifier.type = DCMIdType#tracking-uid "Tracking UID"
* focus[bodyStructure].identifier.system = "urn:dicom:uid"
* focus[bodyStructure].identifier.value 1..1
* focus[bodyStructure].identifier ^short = "A unique identifier used for tracking a finding or feature, potentially across multiple reporting objects, over time"

* focus contains imageRegion2d 0..* MS
* focus[imageRegion2d] only Reference(ImagingSelection2dImageRegionProfile)
* focus[imageRegion2d] ^short = "2D Image Region"

* focus contains referencedSegmentationFrame 0..* MS
* focus[referencedSegmentationFrame] only Reference(ImagingSelectionReferencedSegmentationFrameProfile)
* focus[referencedSegmentationFrame] ^short = "Referenced Segmentation Frame"

* focus contains imageRegion3d 0..* MS
* focus[imageRegion3d] only Reference(ImagingSelection3dImageRegionProfile)
* focus[imageRegion3d] ^short = "3D Image Region"

* focus contains sourceImageForSegmentation 0..* MS
* focus[sourceImageForSegmentation] only Reference(ImagingSelectionSourceImageForSegmentationProfile)
* focus[sourceImageForSegmentation] ^short = "Source Image for Segmentation"

// Still TODO
// * focus contains regionInSpace 0..* MS
// * focus contains illustrationOfRoi 0..* MS
// * focus contains visualExplanation 0..* MS
// * focus contains realWorldValueMap 0..* MS

// Observation Date Time
* issued 1..1 MS
* issued ^short = "Observation Date Time"

* hasMember ^slicing.discriminator.type = #pattern
* hasMember ^slicing.discriminator.path = "type"
* hasMember ^slicing.rules = #open
* hasMember ^slicing.ordered = false
* hasMember ^slicing.description = "ROI Measurements"

// ROI Measurements
* hasMember contains roiMeasurement 0..* MS
* hasMember[roiMeasurement] only Reference(TID1419ROIMeasurementProfile)

* interpretation MS

* value[x] 0..0

Mapping: dicom-sr-for-TID1410PlanarROIMeasurementGroup
Id: dicom-sr
Title: "DICOM SR TID 1410 Planar ROI Measurement Group"
Source: TID1410PlanarROIMeasurementGroupProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The TID1410PlanarROIMeasurementGroup can be extracted from TID 1410 - Planar ROI Measurements and Qualitative Evaluations."
* -> "TID1410(Planar ROI Measurements and Qualitative Evaluations)"
* identifier[observationUID] -> "tag(0040,A171) [Observation UID]"
* subject -> "tag(0010,0020) [Patient ID]"
* code -> "TID1410.EV(121071, DCM, Finding)"
* issued -> "tag(0040,A032) [Observation DateTime]"
* interpretation -> "TID1410.$QualType, TID.1410QualModType$"
