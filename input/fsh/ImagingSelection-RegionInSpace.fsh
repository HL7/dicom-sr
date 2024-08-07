Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionRegionInSpace
Parent:         ImagingSelectionObservationImagingSelection
Id:             region-in-space
Title:          "Imaging Selection - DICOM SR Region In Space"
Description:    "DICOM® SR Region In Space Mapping to ImagingSelection"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* code MS
* code.coding = DCM#130488 "Region In Space"

* instance ^slicing.discriminator.type = #value
* instance ^slicing.discriminator.path = "sopClass"
* instance ^slicing.rules = #open
* instance ^slicing.ordered = false
* instance ^slicing.description = "Selected Image Instance"

* instance contains rtStructureInstance 1..*
* instance[rtStructureInstance].subset 1..* MS
* instance[rtStructureInstance].sopClass =  https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#11.2.840.10008.5.1.4.1.1.481.3 "RT Structure Set Storage"

Mapping: dicom-tid-1410-for-regionInSpaceProfile
Id: dicom-tid-1410-region-in-space
Title: "DICOM TID 1410 Region In Space"
Source: ImagingSelectionRegionInSpace
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ImagingSelectionRegionInSpace can be extracted from TID 1410.EV(130488, DCM, Region In Space)."
* -> "TID1410(RegionInSpace)"
* instance[rtStructureInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance[rtStructureInstance].subset -> "CID130488.CID130489.tag(0040,A160) [Text Value]"

Mapping: dicom-tid-1411-for-regionInSpaceProfile
Id: dicom-tid-1411-region-in-space
Title: "DICOM TID 1411 Region In Space"
Source: ImagingSelectionRegionInSpace
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelectionRegionInSpace can be extracted from TID 1411.EV(130488, DCM, Region In Space)."
* -> "TID1411(RegionInSpace)"
* instance[rtStructureInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance[rtStructureInstance].subset -> "CID130488.CID130489.tag(0040,A160) [Text Value]"

Instance: Example-ImagingSelection-RegionInSpace
InstanceOf: ImagingSelectionRegionInSpace
Usage: #example
Description: "An example of an region in space referenced from a measurement report."

* id = "measurement-report-region-in-space"

* subject = Reference(Example-Patient)
* derivedFrom = Reference(Example-ImagingStudy)
* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = DCM#130488 "Region In Space"
    * display = "Region In Space"
* seriesUid = "1.2.840.113747.20080222.83341314456631405221767081790268995.9"
* instance[rtStructureInstance]
  * uid = "1.2.840.113747.20080222.83341314456631405221767081790268995.9.1"
  * sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#11.2.840.10008.5.1.4.1.1.481.3 "RT Structure Set Storage"
  * subset = "1"