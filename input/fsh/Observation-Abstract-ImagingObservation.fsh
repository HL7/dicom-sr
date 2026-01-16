Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingObservationProfile
Parent:         Observation
Id:             imaging-observation
Title:          "Observation - DICOM SR Imaging Observation"
Description:    "DICOM® SR Base Observation for Imaging Measurement Groups, Imaging Measurements and Qualitative Evaluations. Not used directly."

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Identifiers for the measurement group"

* identifier contains observationUID 0..* MS
* identifier[observationUID].type = DCMIdType#observation-uid "Observation UID"
* identifier[observationUID].system = "urn:dicom:uid"
* identifier[observationUID].value 1..1
* identifier[observationUID] ^short = "The unique identifier for the observation."

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
* code MS

* subject only Reference(Patient)
* subject 1..1 MS

* derivedFrom ^slicing.discriminator.type = #profile
* derivedFrom ^slicing.discriminator.path = "resolve()"
* derivedFrom ^slicing.rules = #open
* derivedFrom ^slicing.ordered = false
* derivedFrom ^slicing.description = "Observed imaging selection(s)"

* derivedFrom contains sourceSRContentItem 0..1 MS
* derivedFrom[sourceSRContentItem] only Reference(ImagingSelectionSourceSRContentItem)
* derivedFrom[sourceSRContentItem] ^short = "Source SR Content Item"

* derivedFrom contains imageRegion2d 0..1 MS
* derivedFrom[imageRegion2d] only Reference(ImagingSelection2dImageRegion)
* derivedFrom[imageRegion2d] ^short = "2D Image Region"

* derivedFrom contains imageRegion3d 0..1 MS
* derivedFrom[imageRegion3d] only Reference(ImagingSelection3dImageRegion)
* derivedFrom[imageRegion3d] ^short = "3D Image Region"

* derivedFrom contains referencedSegment 0..1 MS
* derivedFrom[referencedSegment] only Reference(ImagingSelectionReferencedSegment)
* derivedFrom[referencedSegment] ^short = "Referenced Segment"

* derivedFrom contains referencedSegmentationFrame 0..1 MS
* derivedFrom[referencedSegmentationFrame] only Reference(ImagingSelectionReferencedSegmentationFrame)
* derivedFrom[referencedSegmentationFrame] ^short = "Referenced Segmentation Frame"

* derivedFrom contains regionInSpace 0..1 MS
* derivedFrom[regionInSpace] only Reference(ImagingSelectionRegionInSpace)
* derivedFrom[regionInSpace] ^short = "RegionInSpace"

* derivedFrom contains volumeSurface 0..1 MS
* derivedFrom[volumeSurface] only Reference(ImagingSelectionVolumeSurface)
* derivedFrom[volumeSurface] ^short = "Volume Surface"

* derivedFrom contains realWorldValueMap 0..1 MS
* derivedFrom[realWorldValueMap] only Reference(ImagingSelectionRealWorldValueMap)
* derivedFrom[realWorldValueMap] ^short = "Real World Value Map"

* derivedFrom contains illustrationOfRoi 0..1 MS
* derivedFrom[illustrationOfRoi] only Reference(ImagingSelectionIllustrationOfROI)
* derivedFrom[illustrationOfRoi] ^short = "Illustration of ROI"

* derivedFrom contains visualExplanation 0..1 MS
* derivedFrom[visualExplanation] only Reference(ImagingSelectionVisualExplanation)
* derivedFrom[visualExplanation] ^short = "VisualExplanation"

// Observation Date Time
* issued 1..1 MS
* issued ^short = "Observation Date Time"

* interpretation MS

* device 1..1 MS
* device only Reference(AlgorithmIdentification or GeneralEquipmentDevice or ParticipantDevice)

* bodyStructure MS
* bodyStructure only Reference(BodyStructureFindingSite)

Instance: Example-Observation-ImagingObservation
InstanceOf: ImagingObservationProfile
Usage: #example
Description: "Example of the base Imaging Observation"

* id = "imaging-observation"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* partOf = Reference(Example-ImagingStudy)
* issued = "2024-07-24T08:23:42+00:00"
* effectiveDateTime = "2024-07-24T08:23:42+00:00"
* status = #final
* performer = Reference(Example-Practitioner)
* code
  * coding
    * system = "http://snomed.info/sct"
    * code = #241053004 "Radiographic measurement of lung volume"
    * display = "Radiographic measurement of lung volume"

// Test of all imaging selection profiles
* derivedFrom[illustrationOfRoi] = Reference(Example-ImagingSelection-IllustrationOfROI)
* derivedFrom[imageRegion2d] = Reference(Example-ImagingSelection-ImageRegion2D)
* derivedFrom[imageRegion3d] = Reference(Example-ImagingSelection-ImageRegion3D)
* derivedFrom[realWorldValueMap] = Reference(Example-ImagingSelection-RealWorldValueMap)
* derivedFrom[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* derivedFrom[referencedSegmentationFrame] = Reference(Example-ImagingSelection-ReferencedSegmentationFrame)
* derivedFrom[regionInSpace] = Reference(Example-ImagingSelection-RegionInSpace)
* derivedFrom[visualExplanation] = Reference(Example-ImagingSelection-VisualExplanation)
* derivedFrom[volumeSurface] = Reference(Example-ImagingSelection-VolumeSurface)

* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-GeneralEquipment)
* valueCodeableConcept
  * coding
    * system = "http://snomed.info/sct"
    * code = #427359005 "Solitary nodule of lung"
    * display = "Solitary nodule of lung"
