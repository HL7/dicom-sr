Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionReferencedSegmentProfile
Parent:         ImagingSelection
Id:             referenced-segment
Title:          "Imaging Selection - DICOM SR Referenced Segment Mapping"
Description:    "DICOM SR Referenced Segment Mapping to ImagingSelection"

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
* derivedFrom[imagingStudyRef].identifier.type = DCM#110180 "Study Instance UID"
* derivedFrom[imagingStudyRef].identifier.system = "urn:dicom:uid"
* derivedFrom[imagingStudyRef].identifier.value 1..1
* derivedFrom[imagingStudyRef].identifier ^short = "Identifier related to Study Instance UID"

* code MS
* code.coding = DCM#121191 "Referenced Segment"

* subject only Reference(Patient)
* subject 1..1 MS

* instance ^slicing.discriminator.type = #value
* instance ^slicing.discriminator.path = "type"
* instance ^slicing.rules = #open
* instance ^slicing.ordered = false
* instance ^slicing.description = "Selected Segmentation Instance"

* instance contains referencedSegment 0..*
* instance[referencedSegment].sopClass = urn:ietf:rfc:3986#urn:oid:1.2.840.10008.5.1.4.1.1.66.4 "Segmentation Storage"

Mapping: dicom-tid-1411-for-referencedSegmentProfile
Id: dicom-tid-1411-referenced-segment
Title: "DICOM TID 1411 Referenced Segment"
Source: ImagingSelectionReferencedSegmentProfile
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1411"
Description: "The ImagingSelectionReferencedSegment can be extracted from TID 1411.EV(121191, DCM, Referenced Segment)."
* -> "TID1411(ReferencedSegment)"
* instance[referencedSegment].uid -> "tag(0008,1155) [Referenced SOP Instance UID]"
* instance[referencedSegment].subset -> "tag(0062,000B) [Referenced Segment Number]"

Instance: Example-ImagingSelection-ReferencedSegment
InstanceOf: ImagingSelectionReferencedSegmentProfile
Usage: #example
Description: "An example of an Segmentation SOP Instance referenced from a measurement report."

* id = "measurement-report-referenced-segment"

* identifier
  * system = "urn:dicom:uid"
  * value = "urn:oid:2.16.124.113543.1154777499.30246.19789.350343004"

* subject = Reference(Example-Patient)
* derivedFrom = Reference(Example-ImagingStudy)
* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #121191 "Referenced Segment"
* seriesUid = "1.2.840.113747.20080222.83341314456631405221767081790268995.2"
* instance
  * uid = "1.2.840.113747.20080222.83341314456631405221767081790268995.2.1"
  * sopClass = urn:ietf:rfc:3986#urn:oid:1.2.840.10008.5.1.4.1.1.66.4 "Segmentation Storage"
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
  <pre>
{
\"00081199\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00081150\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.10008.5.1.4.1.1.66.4\" ] },
      \"00081155\": { \"vr\": \"UI\", \"Value\": [ \"1.2.276.0.7230010.3.1.4.0.57823.1553343864.578878\" ] },
      \"0062000B\": { \"vr\": \"US\", \"Value\": [ 1 ] }
    } ] },
\"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
\"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"IMAGE\" ] },
\"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
      \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"121191\" ] },
      \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
      \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Referenced Segment\" ] }
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
\"0040A124\": { \"vr\": \"UI\", \"Value\": [ \"1.3.6.1.4.1.14519.5.2.1.6279.6001.273525289046256012743471155680\" ] }
}
  </pre></div>"