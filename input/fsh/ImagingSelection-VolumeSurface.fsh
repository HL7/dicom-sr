Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionVolumeSurfaceProfile
Parent:         ImagingSelectionObservationImagingSelectionProfile
Id:             volume-surface
Title:          "Imaging Selection - DICOM SR Image Volume Surface Mapping"
Description:    "DICOM SR Image Volume Surface Mapping to ImagingSelection"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* code MS
* code.coding = DCM#121231 "Volume Surface"

* frameOfReferenceUid 1..1 MS

// NOTE: Commented out until FHIR-41429 is resolved
// * imageRegion3D 1..1 MS

Mapping: dicom-tid-1411-for-VolumeSurfaceProfile
Id: dicom-tid-1411-volume-surface
Title: "DICOM TID 1411 Volume Surface"
Source: ImagingSelectionVolumeSurfaceProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelectionVolumeSurface can be extracted from TID 1411.EV(121231, DCM, Volume Surface)."
* -> "TID1411(VolumeSurface)"
* frameOfReferenceUid -> "tag(3006,0024) [Referenced Frame of Reference UID]"
// NOTE: Commented out until FHIR-41429 is resolved
// * imageRegion3D.regionType -> "tag(0070,0023) [Graphic Type]"
// * imageRegion3D.coordinate -> "tag(0070,0022) [Graphic Data]"

Instance: Example-ImagingSelection-VolumeSurface
InstanceOf: ImagingSelectionVolumeSurfaceProfile
Usage: #example
Description: "An example of an Volume Surface referenced from a measurement report."

* id = "measurement-report-volume-surface"

* subject = Reference(Example-Patient)
* derivedFrom = Reference(Example-ImagingStudy)
* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = DCM#121231 "Volume Surface"
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