Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Invariant:   measurement-group-category
Description: "If Observation.code is 'measurement group' it should not also be the category"
Expression:  "code = 'DCM#125007' implies category.not().exists()"
Severity:    #error

Profile:        ImagingMeasurementGroupProfile
Parent:         Observation
Id:             imaging-measurement-group
Title:          "Observation - DICOM SR Imaging Measurement Group Mapping"
Description:    "DICOM SR TID Imaging Measurement Group Mapping to Observation"

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
* category = DCM#125007 "Measurement Group"

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

* hasMember ^slicing.discriminator.type = #pattern
* hasMember ^slicing.discriminator.path = "resolve()"
* hasMember ^slicing.rules = #open
* hasMember ^slicing.ordered = false
* hasMember ^slicing.description = "Child Imaging Measurements and Qualitative Evaluations"

// Imaging Measurements
* hasMember contains imagingMeasurement 0..* MS
* hasMember[imagingMeasurement] only Reference(ImagingMeasurementProfile)

// Imaging Qualitative Evaluations
* hasMember contains qualitativeEvaluation 0..* MS
* hasMember[qualitativeEvaluation] only Reference(ImagingQualitativeEvaluationProfile)

* interpretation MS

* value[x] MS
* value[x] only CodeableConcept
* value[x] ^short = "Observation finding"

* device 1..1 MS
* device only Reference(AlgorithmIdentificationProfile or GeneralEquipmentProfile)
* device ^short = "Algorithm Identification or General Equipment Device"

* bodyStructure MS
* bodyStructure only Reference(BodyStructureFindingSite)

Mapping: dicom-sr-for-TID1410PlanarROIMeasurementGroup
Id: dicom-sr-tid-1410
Title: "DICOM SR TID 1410 Planar ROI Measurement Group"
Source: ImagingMeasurementGroupProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The TID1410PlanarROIMeasurementGroup can be extracted from TID 1410 - Planar ROI Measurements and Qualitative Evaluations."
* -> "TID1410(Planar ROI Measurements and Qualitative Evaluations)"
* identifier[observationUID] -> "tag(0040,A171) [Observation UID]"
* subject -> "tag(0010,0020) [Patient ID]"
* code -> "TID1410.EV(276214006, SCT, Finding category) > DCM#125007 'Measurement Group'"
* valueCodeableConcept -> "TID1410.EV(121071, DCM, Finding)"
* issued -> "tag(0040,A032) [Observation DateTime]"
* interpretation -> "TID1410.$QualType, TID.1410QualModType$"

Mapping: dicom-sr-for-TID1411VolumetricROIMeasurementGroup
Id: dicom-sr-tid-1411
Title: "DICOM SR TID 1411 Volumetric ROI Measurement Group"
Source: ImagingMeasurementGroupProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The TID1411PlanarROIMeasurementGroup can be extracted from TID 1411 - Volumetric ROI Measurements and Qualitative Evaluations."
* -> "TID1411(Volumetric ROI Measurements and Qualitative Evaluations)"
* identifier[observationUID] -> "tag(0040,A171) [Observation UID]"
* subject -> "tag(0010,0020) [Patient ID]"
* code -> "TID1411.EV(276214006, SCT, Finding category) > DCM#125007 'Measurement Group'"
* valueCodeableConcept -> "TID1411.EV(121071, DCM, Finding)"
* issued -> "tag(0040,A032) [Observation DateTime]"
* interpretation -> "TID1411.$QualType, TID.1411QualModType$"

Mapping: dicom-sr-for-TID1501PlanarROIMeasurementGroupProfile
Id: dicom-sr-tid-1501
Title: "DICOM SR TID 1501 Measurement and Qualitative Evaluation Group"
Source: ImagingMeasurementGroupProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1501"
Description: "The TID1501PlanarROIMeasurementGroup can be extracted from TID 1501 - Measurement and Qualitative Evaluation Group."
* -> "TID1501(Measurement and Qualitative Evaluation Group)"
* identifier[observationUID] -> "tag(0040,A171) [Observation UID]"
* subject -> "tag(0010,0020) [Patient ID]"
* code -> "TID1501.EV(276214006, SCT, Finding category) > DCM#125007 'Measurement Group'"
* valueCodeableConcept -> "TID1501.EV(121071, DCM, Finding)"
* issued -> "tag(0040,A032) [Observation DateTime]"
* interpretation -> "TID1501.$QualType, TID.1501QualModType$"

Instance: Example-Observation-ImagingMeasurementGroupProfile
InstanceOf: ImagingMeasurementGroupProfile
Usage: #example
Description: "Example of Observation representing a DICOM SR Measurement Group"

* id = "imaging-measurement-group"
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
* category
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #125007 "Measurement Group"
* focus[referencedSegment] = Reference(Example-ImagingSelection-ReferencedSegment)
* focus[trackingIdentifiers] = Reference(Example-BodyStructure-TrackingIdentifiers)
* bodyStructure = Reference(Example-BodyStructure-FindingSite)
* device = Reference(Example-Device-GeneralEquipment)
* valueCodeableConcept
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/snm"
    * code = #121071 "Nodule"
* hasMember[imagingMeasurement] = Reference(Example-Observation-ImagingMeasurement-001)
* hasMember[imagingMeasurement] = Reference(Example-Observation-ImagingMeasurement-002)
* hasMember[imagingMeasurement] = Reference(Example-Observation-ImagingMeasurement-003)
* hasMember[qualitativeEvaluation] = Reference(Example-Observation-ImagingQualitativeEvaluation-001)
* hasMember[qualitativeEvaluation] = Reference(Example-Observation-ImagingQualitativeEvaluation-002)

* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{{
   \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
   \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINER\" ] },
   \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
         \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"125007\" ] },
         \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
         \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Measurement Group\" ] }
       } ] },
   \"0040A050\": { \"vr\": \"CS\", \"Value\": [ \"SEPARATE\" ] },
   \"0040A504\": { \"vr\": \"SQ\", \"Value\": [ {
         \"00080105\": { \"vr\": \"CS\", \"Value\": [ \"DCMR\" ] },
         \"00080118\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.10008.8.1.1\" ] },
         \"0040DB00\": { \"vr\": \"CS\", \"Value\": [ \"1411\" ] }
       } ] },
   \"0040A730\": { \"vr\": \"SQ\", \"Value\": [ {
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS OBS CONTEXT\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"TEXT\" ] },
         \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
               \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"112039\" ] },
               \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
               \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Tracking Identifier\" ] }
             } ] },
         \"0040A160\": { \"vr\": \"UT\", \"Value\": [ \"Nodule 1\" ] }
       },
       {
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS OBS CONTEXT\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"UIDREF\" ] },
         \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
               \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"112040\" ] },
               \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
               \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Tracking Unique Identifier\" ] }
             } ] },
         \"0040A124\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.8331141314456631405221767081790268995.100\" ] }
       },
       {
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
         \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
               \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"276214006\" ] },
               \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SCT\" ] },
               \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Finding category\" ] }
             } ] },
         \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
               \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"241053004\" ] },
               \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SCT\" ] },
               \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Radiographic measurement of lung volume\" ] }
             } ] }
       },
       {
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
         \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
               \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121071\" ] },
               \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
               \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Finding\" ] }
             } ] },
         \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
               \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"M-03010\" ] },
               \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SRT\" ] },
               \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Nodule\" ] }
             } ] }
       },
       {
         \"00081199\": { \"vr\": \"SQ\", \"Value\": [ {
               \"00081150\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.10008.5.1.4.1.1.66.4\" ] },
               \"00081155\": { \"vr\": \"UI\", \"Value\": [ \"1.2.276.0.7230010.3.1.4.0.57823.1553343864.578878\" ] },
               \"0062000B\": { \"vr\": \"US\", \"Value\": [ 1 ] }
             } ] },
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"IMAGE\" ] },
         \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
               \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121191\" ] },
               \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
               \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Referenced Segment\" ] }
             } ] }
       },
       {
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"UIDREF\" ] },
         \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
               \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121232\" ] },
               \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
               \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Source series for segmentation\" ] }
             } ] },
         \"0040A124\": { \"vr\": \"UI\", \"Value\": [ \"1.3.6.1.4.1.14519.5.2.1.6279.6001.273525289046256012743471155680\" ] }
       },
       {
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"HAS CONCEPT MOD\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
         \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
               \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"G-C0E3\" ] },
               \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SRT\" ] },
               \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Finding Site\" ] }
             } ] },
         \"0040A168\": { \"vr\": \"SQ\", \"Value\": [ {
               \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"T-28000\" ] },
               \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"SRT\" ] },
               \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Lung\" ] }
             } ] }
       },
       {
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"NUM\" ] },
         ...
       },
       {
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"NUM\" ] },
         ...
       },
       {
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"NUM\" ] },
         ...
       },
       {
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
         ...
       },
       {
         \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
         \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CODE\" ] },
         ...
       } ] }
 }
  </pre></div>"