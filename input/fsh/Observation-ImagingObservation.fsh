Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingObservationProfile
Parent:         Observation
Id:             imaging-observation
Title:          "Observation - DICOM SR Imaging Observation"
Description:    "DICOM SR Base Observation for Imaging Measurement Groups, Imaging Measurements and Qualitative Evaluations. Not used directly."

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
* code MS

* subject only Reference(Patient)
* subject 1..1 MS

* focus ^slicing.discriminator.type = #profile
* focus ^slicing.discriminator.path = "resolve()"
* focus ^slicing.rules = #open
* focus ^slicing.ordered = false
* focus ^slicing.description = "Observation foci"

* focus contains trackingIdentifiers 0..* MS
* focus[trackingIdentifiers] only Reference(BodyStructureTrackingIdentifiers)

* focus contains imageRegion2d 0..* MS
* focus[imageRegion2d] only Reference(ImagingSelection2dImageRegion)
* focus[imageRegion2d] ^short = "2D Image Region"

* focus contains imageRegion3d 0..* MS
* focus[imageRegion3d] only Reference(ImagingSelection3dImageRegion)
* focus[imageRegion3d] ^short = "3D Image Region"

* focus contains referencedSegment 0..* MS
* focus[referencedSegment] only Reference(ImagingSelectionReferencedSegment)
* focus[referencedSegment] ^short = "Referenced Segment"

* focus contains referencedSegmentationFrame 0..* MS
* focus[referencedSegmentationFrame] only Reference(ImagingSelectionReferencedSegmentationFrame)
* focus[referencedSegmentationFrame] ^short = "Referenced Segmentation Frame"

* focus contains regionInSpace 0..* MS
* focus[regionInSpace] only Reference(ImagingSelectionRegionInSpace)
* focus[regionInSpace] ^short = "RegionInSpace"

* focus contains volumeSurface 0..* MS
* focus[volumeSurface] only Reference(ImagingSelectionVolumeSurface)
* focus[volumeSurface] ^short = "Volume Surface"

* focus contains realWorldValueMap 0..* MS
* focus[realWorldValueMap] only Reference(ImagingSelectionRealWorldValueMap)
* focus[realWorldValueMap] ^short = "Real World Value Map"

* focus contains illustrationOfRoi 0..* MS
* focus[illustrationOfRoi] only Reference(ImagingSelectionIllustrationOfROI)
* focus[illustrationOfRoi] ^short = "Illustration of ROI"

* focus contains visualExplanation 0..* MS
* focus[visualExplanation] only Reference(ImagingSelectionVisualExplanation)
* focus[visualExplanation] ^short = "VisualExplanation"

// Observation Date Time
* issued 1..1 MS
* issued ^short = "Observation Date Time"

* interpretation MS

* device 1..1 MS
* device only Reference(AlgorithmIdentification or GeneralEquipmentDevice)

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

* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)

// Test of all imaging selection profiles
* focus[illustrationOfRoi] = Reference(Example-ImagingSelection-IllustrationOfROI)
* focus[imageRegion2d] = Reference(Example-ImagingSelection-ImageRegion2D)
* focus[imageRegion3d] = Reference(Example-ImagingSelection-ImageRegion3D)
* focus[realWorldValueMap] = Reference(Example-ImagingSelection-RealWorldValueMap)
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[referencedSegmentationFrame] = Reference(Example-ImagingSelection-ReferencedSegmentationFrame)
* focus[regionInSpace] = Reference(Example-ImagingSelection-RegionInSpace)
* focus[visualExplanation] = Reference(Example-ImagingSelection-VisualExplanation)
* focus[volumeSurface] = Reference(Example-ImagingSelection-VolumeSurface)

* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-GeneralEquipment)
* valueCodeableConcept
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/snm"
    * code = #121071 "Nodule"
