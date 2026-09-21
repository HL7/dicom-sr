Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ReferencedSegmentationFrame
Parent:         ObservationImagingSelection
Id:             referenced-segmentation-frame
Title:          "Imaging Selection - DICOM SR Referenced Segmentation Frame Mapping"
Description:    "DICOM® SR Referenced Segmentation Frame Mapping to ImagingSelection. Used to represent frame-level references into segmentation objects when SR content points to specific segmented content."

* ^abstract = false
* insert DICOMSRStructureDefinitionContent

* code MS
* code.coding = DCM#121214 "Referenced Segmentation Frame"

* focus contains sourceImageForSegmentation 0..1 MS
* focus[sourceImageForSegmentation] only Reference(ImagingSelectionSourceImageForSegmentation)
* focus[sourceImageForSegmentation] ^short = "Source Image For Selection"

* instance ^slicing.discriminator.type = #value
* instance ^slicing.discriminator.path = "sopClass"
* instance ^slicing.rules = #open
* instance ^slicing.ordered = false
* instance ^slicing.description = "Selected Segmentation Instance"

* instance contains referencedSegmentationFrame 1..*
* instance[referencedSegmentationFrame].sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.66.4 "Segmentation Storage"
* instance[referencedSegmentationFrame].subset 1..1

Mapping: dicom-tid-1410-for-referencedSegmentationFrame
Id: dicom-tid-1410-referenced-segmentation-frame
Title: "DICOM TID 1410 Referenced Segmentation Frame"
Source: ReferencedSegmentationFrame
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ReferencedSegmentationFrame can be extracted from TID 1410.EV(121214, DCM, Referenced Segmentation Frame)."
* -> "TID1410(ReferencedSegmentationFrame)"
* instance[referencedSegmentationFrame].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance[referencedSegmentationFrame].subset -> "tag(0062,000B) [Referenced Segment Number]"

Instance: Example-ImagingSelection-ReferencedSegmentationFrame
InstanceOf: ReferencedSegmentationFrame
Usage: #example
Description: "An example of an Segmentation Frame referenced from a measurement report."

* id = "measurement-report-referenced-segmentation-frame"

* subject = Reference(Example-Patient)
* derivedFrom = Reference(Example-ImagingStudy)
* studyUid = "1.2.840.113747.20080222.83311413144566317081790268995"
* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #121214 "Referenced Segmentation Frame"
    * display = "Referenced Segmentation Frame"
* seriesUid = "1.2.840.113747.20080222.83341314456631405221767081790268995.2"
* focus[sourceImageForSegmentation] = Reference(Example-ImagingSelection-SourceImageForSegmentation)
* instance[referencedSegmentationFrame]
  * uid = "1.2.840.113747.20080222.83341314456631405221767081790268995.2.1"
  * sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.66.4 "Segmentation Storage"
  * subset = "1"