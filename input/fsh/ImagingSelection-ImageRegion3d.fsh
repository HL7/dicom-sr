Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelection3dImageRegion
Parent:         ImagingSelectionObservationImagingSelection
Id:             image-region-3d
Title:          "Imaging Selection - DICOM SR Image 3D Region Mapping"
Description:    "DICOM® SR Image 3D Region Mapping to ImagingSelection"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* code MS
* code.coding = DCM#111030 "Image Region"

* frameOfReferenceUid 1..1 MS

// NOTE: Commented out until FHIR-41429 is resolved
// * imageRegion3D 1..1 MS

Mapping: dicom-tid-1410-for-3dImageRegionProfile
Id: dicom-tid-1410-3d-image-region
Title: "DICOM TID 1410 3D Image Region"
Source: ImagingSelection3dImageRegion
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ImagingSelection2dImageRegion can be extracted from TID 1410.EV(111030, DCM, Image Region)."
* -> "TID1410(3DImageRegion)"
* frameOfReferenceUid -> "tag(3006,0024) [Referenced Frame of Reference UID]"

// NOTE: Commented out until FHIR-41429 is resolved
// * imageRegion3D.regionType -> "tag(0070,0023) [Graphic Type]"
// * imageRegion3D.coordinate -> "tag(0070,0022) [Graphic Data]"

Instance: Example-ImagingSelection-ImageRegion3D
InstanceOf: ImagingSelection3dImageRegion
Usage: #example
Description: "An example of a 3D Image Region referenced from a measurement report."

* id = "measurement-report-3d-image-region"

* subject = Reference(Example-Patient)
* derivedFrom = Reference(Example-ImagingStudy)
* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #111030 "Image Region"
    * display = "Image Region"
* frameOfReferenceUid = "1.2.840.113747.20080222.83341314456631405221767081790268995.5"
// NOTE: Commented out until FHIR-41429 is resolved
// * imageRegion3D
//   * regionType = #ellipse
//   * coordinate[+] = -50.0
//   * coordinate[+] = -50.0
//   * coordinate[+] = -50.0
//   * coordinate[+] = 50.0
//   * coordinate[+] = 50.0
//   * coordinate[+] = 50.0
//   * coordinate[+] = 25.0
//   * coordinate[+] = -25.0
//   * coordinate[+] = 0
//   * coordinate[+] = -25.0
//   * coordinate[+] = 25.0
//   * coordinate[+] = 0