Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionSourceImageForSegmentation
Parent:         ImagingSelectionObservationImagingSelection
Id:             source-image-for-segmentation
Title:          "Imaging Selection - DICOM SR Source Image and Series For Segmentation Mapping"
Description:    "DICOM SR Source Image and Series For Segmentation Mapping to ImagingSelection"

* ^abstract = true
* insert DICOMSRStructureDefinitionContent

* code MS
* code.coding = DCM#121233 "Source image for segmentation"

* subject 1..1 MS
* subject only Reference(Patient)

* seriesUid MS

* instance 1..* MS

Mapping: dicom-tid-1410-for-sourceImageForSegmentation
Id: dicom-tid-1410-source-segmentation-image
Title: "DICOM TID 1410 Source Image for Segmentation"
Source: ImagingSelectionSourceImageForSegmentation
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1410"
Description: "The ImagingSelectionSourceImageForSegmentation can be extracted from TID 1410.EV(121233, DCM, Source Image for Segmentation)."
* -> "TID1410(SourceImageForSegmentation)"
* instance -> "TID1411.EV(121233, DCM, Source Image for Segmentation).tag(0008,1199) [Referenced SOP Sequence]"

Mapping: dicom-tid-1411-for-sourceImageForSegmentation
Id: dicom-tid-1411-source-segmentation-image
Title: "DICOM TID 1411 Source Image for Segmentation"
Source: ImagingSelectionSourceImageForSegmentation
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelectionSourceImageForSegmentation can be extracted from TID 1411.EV(121233, DCM, Source Image for Segmentation) and TID 1411.EV(121232, DCM, Source Series for Segmentation)."
* -> "TID1411(SourceImageForSegmentation, SourceSeriesForSegmentation)"
* seriesUid -> "TID1411.EV(121232, DCM, Source series for segmentation).tag(0040,A124) [UID]"
* instance -> "TID1411.EV(121233, DCM, Source Image for Segmentation).tag(0008,1199) [Referenced SOP Sequence]"

Instance: Example-ImagingSelection-SourceImageForSegmentation
InstanceOf: ImagingSelectionSourceImageForSegmentation
Usage: #example
Description: "An example of an source image for segmentation referenced from a measurement report."

* id = "measurement-report-source-image-for-segmentation"

* subject = Reference(Example-Patient)
* derivedFrom = Reference(Example-ImagingStudy)
* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #121233 "Source Image For Segmentation"
* seriesUid = "1.2.840.113747.20080222.83341314456631405221767081790268995.1"
* focus = Reference(Example-ImagingSelection-SourceImageForSegmentation)
* instance[+]
  * uid = "1.2.840.113747.20080222.83341314456631405221767081790268995.1.1"
  * sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.2 "CT Image Storage"
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">
  <pre>
{
\"00081199\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00081150\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.10008.5.1.4.1.1.2\" ] },
      \"00081155\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83341314456631405221767081790268995.1.1\" ] },
    } ] },
\"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
\"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"IMAGE\" ] },
\"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121233\" ] },
      \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
      \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Source Image For Segmentation\" ] }
    } ] }
},
{
\"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
\"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"UIDREF\" ] },
\"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121232\" ] },
      \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
      \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Source series for segmentation\" ] }
    } ] },
\"0040A124\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83341314456631405221767081790268995.1\" ] }
}
  </pre></div>"