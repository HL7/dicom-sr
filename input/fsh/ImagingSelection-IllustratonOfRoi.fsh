Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionIllustrationOfROI
Parent:         ImagingSelectionObservationImagingSelection
Id:             illustration-of-roi
Title:          "Imaging Selection - DICOM SR Illustration Of ROI Mapping"
Description:    "DICOM® SR Illustration Of ROI Mapping to ImagingSelection"

* ^abstract = false
* insert DICOMSRStructureDefinitionContent

* code MS
* code.coding = DCM#121200 "Illustration of ROI"

* instance 1..* MS

Mapping: dicom-tid-1410-for-illustrationOfRoi
Id: dicom-tid-1410-illustration-of-roi
Title: "DICOM TID 1410 Illustration of ROI"
Source: ImagingSelectionIllustrationOfROI
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ImagingSelectionIllustrationOfROI can be extracted from TID 1410.EV(121200, DCM, Illustration of ROI)."
* -> "TID1410(IllustrationOfROI)"
* instance.uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance.sopClass -> "tag(0008,1150) [Referenced SOP Class UID]"

Mapping: dicom-tid-1411-for-illustrationOfRoi
Id: dicom-tid-1411-illustration-of-roi
Title: "DICOM TID 1411 Illustration of ROI"
Source: ImagingSelectionIllustrationOfROI
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelectionIllustrationOfROI can be extracted from TID 1411.EV(121200, DCM, Illustration of ROI)."
* -> "TID1411(IllustrationOfROI)"
* instance.uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance.sopClass -> "tag(0008,1150) [Referenced SOP Class UID]"

Instance: Example-ImagingSelection-IllustrationOfROI
InstanceOf: ImagingSelectionIllustrationOfROI
Usage: #example
Description: "An example of an Illustration of ROI referenced from a measurement report."

* id = "measurement-report-illustration-of-roi"

* subject = Reference(Example-Patient)
* derivedFrom = Reference(Example-ImagingStudy)
* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #121200 "Illustration of ROI"
    * display = "Illustration of ROI"
* seriesUid = "1.2.840.113747.20080222.83341314456631405221767081790268995.3"
* instance
  * uid = "1.2.840.113747.20080222.83341314456631405221767081790268995.3.1"
  * sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.7.4 "Multi-frame True Color Secondary Capture Image Storage"