Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingMeasurementProfile
Parent:         Observation
Id:             imaging-measurement
Title:          "Observation - DICOM SR Imaging Measurement Mapping to Observation"
Description:    "DICOM SR Imaging Measurement Mapping to Observation"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Identifiers for the measurement"

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

// Observation Date Time
* issued 1..1 MS
* issued ^short = "Observation Date Time"

* method 0..1 MS

* device 1..1 MS
* device only Reference(AlgorithmIdentificationProfile or GeneralEquipmentProfile)
* device ^short = "Algorithm Identification or General Equipment Device"

* interpretation MS
* referenceRange MS

* bodyStructure MS
* bodyStructure only Reference(BodyStructureFindingSite)

* valueQuantity MS

Mapping: dicom-sr-for-TID300MeasurementProfile
Id: dicom-sr-tid-300
Title: "DICOM SR TID 300 Measurement"
Source: ImagingMeasurementProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_300"
Description: "The TID300Measurement can be extracted from TID 300 - Measurement."
* -> "TID300(Measurement)"
* identifier[observationUID] -> "tag(0040,A171) [Observation UID]"
* subject -> "tag(0010,0020) [Patient ID]"
* code -> "TID300.$Measurement.tag(0040,A043) [Concept Name Code Sequence]"
* issued -> "tag(0040,A032) [Observation DateTime]"
* method -> "TID1501.EV(370129005, SCT, Measurement Method)"
* device -> "TID1501.EV(121071, DCM, Finding)"
* valueQuantity -> "TID300.$Measurement.tag(0040,A300) [Measured Value Sequence]"

Mapping: dicom-sr-for-TID1419MeasurementProfile
Id: dicom-sr-tid-1419
Title: "DICOM SR TID 1419 Measurement"
Source: ImagingMeasurementProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1419"
Description: "The TID1419Measurement can be extracted from TID 1419 - ROI Measurements."
* -> "TID1419(ROIMeasurement)"
* identifier[observationUID] -> "tag(0040,A171) [Observation UID]"
* subject -> "tag(0010,0020) [Patient ID]"
* code -> "TID1419.$Measurement.tag(0040,A043) [Concept Name Code Sequence]"
* issued -> "tag(0040,A032) [Observation DateTime]"
* method -> "TID1501.EV(370129005, SCT, Measurement Method)"
* device -> "TID1501.EV(121071, DCM, Finding)"
* valueQuantity -> "TID1419.$Measurement.tag(0040,A300) [Measured Value Sequence]"

Instance: Example-Observation-ImagingMeasurement-001
InstanceOf: ImagingMeasurementProfile
Usage: #example
Description: "Example of Observation representing a DICOM SR Measurement Imaging Measurement."

* id = "imaging-measurement-001"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* partOf = Reference(Example-ImagingStudy)
* issued = "2024-07-24T08:23:42+00:00"
* status = #final
* code
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/snm"
    * code = #G-D705 "Volume"
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)
* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-AlgorithmIdentification)
* valueQuantity
  * value = 6705.54990898997
  * unit = "cubic millimeter"
  * system = "http://unitsofmeasure.org"
  * code = #mm3

Instance: Example-Observation-ImagingMeasurement-002
InstanceOf: ImagingMeasurementProfile
Usage: #example
Description: "Example of Observation representing a DICOM SR Measurement Imaging Measurement."

* id = "imaging-measurement-002"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* partOf = Reference(Example-ImagingStudy)
* issued = "2024-07-24T08:23:42+00:00"
* status = #final
* code
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/snm"
    * code = #M-02550 "Diameter"
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)
* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-AlgorithmIdentification)
* valueQuantity
  * value = 6705.54990898997
  * unit = "millimeter"
  * system = "http://unitsofmeasure.org"
  * code = #mm

Instance: Example-Observation-ImagingMeasurement-003
InstanceOf: ImagingMeasurementProfile
Usage: #example
Description: "Example of Observation representing a DICOM SR Measurement Imaging Measurement."

* id = "imaging-measurement-003"
* subject = Reference(Example-Patient)
* basedOn = Reference(Example-ServiceRequest)
* partOf = Reference(Example-ImagingStudy)
* issued = "2024-07-24T08:23:42+00:00"
* status = #final
* code
  * coding
    * system = "https://ibsi.readthedocs.io/en/latest/"
    * code = #C0JK "Surface area of mesh"
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)
* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-GeneralEquipment)
* valueQuantity
  * value = 9.026567E+03
  * unit = "square millimeter"
  * system = "http://unitsofmeasure.org"
  * code = #mm2
