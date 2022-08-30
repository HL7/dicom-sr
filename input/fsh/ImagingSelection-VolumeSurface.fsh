Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionVolumeSurfaceProfile
Parent:         ImagingSelection
Id:             volume-surface
Title:          "Imaging Selection - DICOM SR Image Volume Surface Mapping"
Description:    "DICOM SR Image Volume Surface Mapping to ImagingSelection"

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
* code.coding = DCM#121231 "Volume Surface"

* subject only Reference(Patient)
* subject 1..1 MS

* frameOfReferenceUid 1..1 MS

* imageRegion 1..1 MS

Mapping: dicom-sr-for-VolumeSurfaceProfile
Id: dicom-sr-volume-surface
Title: "DICOM SR Volume Surface"
Source: ImagingSelectionVolumeSurfaceProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelectionVolumeSurface can be extracted from TID 1411.EV(121231, DCM, Volume Surface)."
* -> "TID1411(VolumeSurface)"
* frameOfReferenceUid -> "tag(3006,0024) [Referenced Frame of Reference UID]"
* imageRegion.regionType -> "tag(0070,0023) [Graphic Type]"
* imageRegion.coordinates -> "tag(0070,0022) [Graphic Data]"
