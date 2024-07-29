Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelection2dImageRegion
Parent:         ImagingSelectionObservationImagingSelection
Id:             image-region-2d
Title:          "Imaging Selection - DICOM SR 2D Image Region Mapping"
Description:    "DICOM SR Image 2D Region Mapping to ImagingSelection"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* code MS
* code.coding = DCM#111030 "Image Region"

* instance ^slicing.discriminator.type = #exists
* instance ^slicing.discriminator.path = "imageRegion2D"
* instance ^slicing.rules = #open
* instance ^slicing.ordered = false
* instance ^slicing.description = "Selected Image Instance"

* instance contains imageInstance 1..*
* instance[imageInstance].imageRegion2D 1..1 MS

Mapping: dicom-tid-1410-for-2dImageRegionProfile
Id: dicom-tid-1410-2d-image-region
Title: "DICOM TID 1410 2D Image Region"
Source: ImagingSelection2dImageRegion
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ImagingSelection2dImageRegion can be extracted from TID 1410.EV(111030, DCM, Image Region)."
* -> "TID1410(2DImageRegion)"
* instance[imageInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance[imageInstance].imageRegion2D.regionType -> "tag(0070,0023) [Graphic Type]"
* instance[imageInstance].imageRegion2D.coordinate -> "tag(0070,0022) [Graphic Data]"

Mapping: dicom-tid-1411-for-2dImageRegionProfile
Id: dicom-tid-1411-2d-image-region
Title: "DICOM TID 1411 2D Image Region"
Source: ImagingSelection2dImageRegion
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelection2dImageRegion can be extracted from TID 1411.EV(111030, DCM, Image Region)."
* -> "TID1411(2DImageRegion)"
* instance[imageInstance].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance[imageInstance].imageRegion2D.regionType -> "tag(0070,0023) [Graphic Type]"
* instance[imageInstance].imageRegion2D.coordinate -> "tag(0070,0022) [Graphic Data]"

Instance: Example-ImagingSelection-ImageRegion2D
InstanceOf: ImagingSelection2dImageRegion
Usage: #example
Description: "An example of a 2D Image Region referenced from a measurement report."

* id = "measurement-report-2d-image-region"

* subject = Reference(Example-Patient)
* derivedFrom = Reference(Example-ImagingStudy)
* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #111030 "Image Region"
* seriesUid = "1.2.840.113747.20080222.83341314456631405221767081790268995.4"
* instance
  * uid = "1.2.840.113747.20080222.83341314456631405221767081790268995.4.1"
  * sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.2 "CT Image Storage"
  * imageRegion2D
    * regionType = #polyline
    * coordinate[+] = 0.25
    * coordinate[+] = 0.25
    * coordinate[+] = 0.75
    * coordinate[+] = 0.25
    * coordinate[+] = 0.75
    * coordinate[+] = 0.75
    * coordinate[+] = 0.25
    * coordinate[+] = 0.75