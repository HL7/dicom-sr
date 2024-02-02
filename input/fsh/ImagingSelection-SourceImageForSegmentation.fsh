Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionSourceImageForSegmentationProfile
Parent:         ImagingSelection
Id:             source-image-for-segmentation
Title:          "Imaging Selection - DICOM SR Source Image For Segmentation Mapping"
Description:    "DICOM SR Source Image For Segmentation Mapping to ImagingSelection"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

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
* derivedFrom ^slicing.discriminator.type = #type
* derivedFrom ^slicing.discriminator.path = "reference"
* derivedFrom ^slicing.rules = #open
* derivedFrom ^slicing.description = "Description of the related ImagingStudy" 

* derivedFrom contains imagingStudyRef 1..1 MS
* derivedFrom[imagingStudyRef] only Reference(ImagingStudy)
* derivedFrom[imagingStudyRef] ^short = "Related ImagingStudy"
* derivedFrom[imagingStudyRef].identifier.type 1..1
* derivedFrom[imagingStudyRef].identifier.type = DCMIdType#study-instance-uid "Study Instance UID"
* derivedFrom[imagingStudyRef].identifier.system = "urn:dicom:uid"
* derivedFrom[imagingStudyRef].identifier.value 1..1
* derivedFrom[imagingStudyRef].identifier ^short = "Identifier related to Study Instance UID"

* code MS
* code.coding = DCM#121233 "Source image for segmentation"

* subject 1..1 MS
* subject only Reference(Patient)

* seriesUid MS
// seriesUid -> UID value of 121232, DCM, "Source series for segmentation" if present

* instance ^slicing.discriminator.type = value
* instance ^slicing.discriminator.path = "type"
* instance ^slicing.rules = #open
* instance ^slicing.ordered = false
* instance ^slicing.description = "Source Instances"

* instance contains sourceInstances 0..*
* instance[sourceInstances].sopClass = urn:ietf:rfc:3986#urn:oid:1.2.840.10008.5.1.4.1.1.66.4 "Segmentation Storage"

Mapping: dicom-tid-1410-for-sourceImageForSegmentation
Id: dicom-tid-1410-source-segmentation-image
Title: "DICOM TID 1410 Source Image for Segmentation"
Source: ImagingSelectionSourceImageForSegmentationProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ImagingSelectionSourceImageForSegmentation can be extracted from TID 1410.EV(121233, DCM, Source Image for Segmentation)."
* -> "TID1410(SourceImageForSegmentation)"
* instance[sourceInstances].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"

Mapping: dicom-tid-1411-for-sourceImageForSegmentation
Id: dicom-tid-1411-source-segmentation-image
Title: "DICOM TID 1411 Source Image for Segmentation"
Source: ImagingSelectionSourceImageForSegmentationProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelectionSourceImageForSegmentation can be extracted from TID 1411.EV(121233, DCM, Source Image for Segmentation)."
* -> "TID1411(SourceImageForSegmentation)"
* instance[sourceInstances].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"