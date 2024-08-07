Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionVisualExplanation
Parent:         ImagingSelectionObservationImagingSelection
Id:             visual-explanation
Title:          "Imaging Selection - DICOM® SR Visual Explanation Mapping"
Description:    "DICOM® SR Visual Explanation Mapping to ImagingSelection"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

// Associated ServiceRequest
* code MS
* code.coding = DCM#130401 "Visual Explanation"

* instance 1..* MS

Mapping: dicom-tid-1410-for-visualExplanation
Id: dicom-tid-1410-visual-explanation
Title: "DICOM TID 1410 Visual Explanation"
Source: ImagingSelectionVisualExplanation
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ImagingSelectionVisualExplanation can be extracted from TID 1410.EV(130401, DCM, Visual Explanation)."
* -> "TID1410(VisualExplanation)"
* instance.uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance.sopClass -> "tag(0008,1150) [Referenced SOP Class UID]"

Mapping: dicom-tid-1411-for-visualExplanation
Id: dicom-tid-1411-visual-explanation
Title: "DICOM TID 1411 Visual Explanation"
Source: ImagingSelectionVisualExplanation
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelectionVisualExplanation can be extracted from TID 1411.EV(130401, DCM, Visual Explanation)."
* -> "TID1411(VisualExplanation)"
* instance.uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance.sopClass -> "tag(0008,1150) [Referenced SOP Class UID]"

Instance: Example-ImagingSelection-VisualExplanation
InstanceOf: ImagingSelectionVisualExplanation
Usage: #example
Description: "An example of an visual explanation referenced from a measurement report."

* id = "measurement-report-visual-explanation"

* subject = Reference(Example-Patient)
* derivedFrom = Reference(Example-ImagingStudy)
* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = DCM#130401 "Visual Explanation"
    * display = "Visual Explanation"
* seriesUid = "1.2.840.113747.20080222.83341314456631405221767081790268995.3"
* instance
  * uid = "1.2.840.113747.20080222.83341314456631405221767081790268995.3.1"
  * sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.7.4 "Multi-frame True Color Secondary Capture Image Storage"