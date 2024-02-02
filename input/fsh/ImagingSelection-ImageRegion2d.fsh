Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelection2dImageRegionProfile
Parent:         ImagingSelection
Id:             image-region-2d
Title:          "Imaging Selection - DICOM SR 2D Image Region Mapping"
Description:    "DICOM SR Image 2D Region Mapping to ImagingSelection"

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
* code.coding = DCM#111030 "Image Region"

* subject only Reference(Patient)
* subject 1..1 MS

* instance ^slicing.discriminator.type = value
* instance ^slicing.discriminator.path = "type"
* instance ^slicing.rules = #open
* instance ^slicing.ordered = false
* instance ^slicing.description = "Selected Image Instance"

* instance contains imageInstance 0..*
* instance[imageInstance].imageRegion2D 1..1 MS

Mapping: dicom-tid-1410-for-2dImageRegionProfile
Id: dicom-tid-1410-2d-image-region
Title: "DICOM TID 1410 2D Image Region"
Source: ImagingSelection2dImageRegionProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ImagingSelection2dImageRegion can be extracted from TID 1410.EV(111030, DCM, Image Region)."
* -> "TID1410(2DImageRegion)"
* instance[imageInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance[imageInstance].imageRegion2D.regionType -> "tag(0070,0023) [Graphic Type]"
* instance[imageInstance].imageRegion2D.coordinate -> "tag(0070,0022) [Graphic Data]"

Mapping: dicom-tid-1411-for-2dImageRegionProfile
Id: dicom-tid-1411-2d-image-region
Title: "DICOM TID 1411 2D Image Region"
Source: ImagingSelection2dImageRegionProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelection2dImageRegion can be extracted from TID 1411.EV(111030, DCM, Image Region)."
* -> "TID1411(2DImageRegion)"
* instance[imageInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance[imageInstance].imageRegion2D.regionType -> "tag(0070,0023) [Graphic Type]"
* instance[imageInstance].imageRegion2D.coordinate -> "tag(0070,0022) [Graphic Data]"
