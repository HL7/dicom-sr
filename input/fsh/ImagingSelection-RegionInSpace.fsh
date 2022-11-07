Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionRegionInSpaceProfile
Parent:         ImagingSelection
Id:             region-in-space
Title:          "Imaging Selection - DICOM SR Region In Space"
Description:    "DICOM SR Region In Space Mapping to ImagingSelection"

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
* code.coding = DCM#130488 "Region In Space"

* subject only Reference(Patient)
* subject 1..1 MS

* instance ^slicing.discriminator.type = #pattern
* instance ^slicing.discriminator.path = "type"
* instance ^slicing.rules = #open
* instance ^slicing.ordered = false
* instance ^slicing.description = "Selected Image Instance"

* instance contains rtStructureInstance 0..*
* instance[rtStructureInstance].subset 0..* MS
* instance[rtStructureInstance].sopClass = urn:ietf:rfc:3986#urn:oid:1.2.840.10008.5.1.4.1.1.481.3 "RT Structure Set Storage"

Mapping: dicom-tid-1410-for-regionInSpaceProfile
Id: dicom-tid-1410-region-in-space
Title: "DICOM TID 1410 Region In Space"
Source: ImagingSelectionRegionInSpaceProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ImagingSelectionRegionInSpace can be extracted from TID 1410.EV(130488, DCM, Region In Space)."
* -> "TID1410(RegionInSpace)"
* instance[rtStructureInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance[rtStructureInstance].subset -> "CID130488.CID130489.tag(0040,A160) [Text Value]"

Mapping: dicom-tid-1411-for-regionInSpaceProfile
Id: dicom-tid-1411-region-in-space
Title: "DICOM TID 1411 Region In Space"
Source: ImagingSelectionRegionInSpaceProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelectionRegionInSpace can be extracted from TID 1411.EV(130488, DCM, Region In Space)."
* -> "TID1411(RegionInSpace)"
* instance[rtStructureInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance[rtStructureInstance].subset -> "CID130488.CID130489.tag(0040,A160) [Text Value]"
