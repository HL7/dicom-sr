Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingSelectionSourceSRContentItem
Parent:         ImagingSelection
Id:             source-sr-content-item
Title:          "Imaging Selection - DICOM SR Source SR Content Item Mapping"
Description:    "DICOM® SR Source SR Content Item Mapping to ImagingSelection"

* ^abstract = false
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

* derivedFrom contains imagingStudyRef 0..1 MS
* derivedFrom[imagingStudyRef] only Reference(ImagingStudy)
* derivedFrom[imagingStudyRef] ^short = "Related ImagingStudy"
* derivedFrom[imagingStudyRef].identifier.type 1..1
* derivedFrom[imagingStudyRef].identifier.type = DCM#110180 "Study Instance UID"
* derivedFrom[imagingStudyRef].identifier.system = "urn:dicom:uid"
* derivedFrom[imagingStudyRef].identifier.value 1..1
* derivedFrom[imagingStudyRef].identifier ^short = "Identifier related to Study Instance UID"

* studyUid MS

* subject only Reference(Patient)
* subject 1..1 MS

* code MS
* code.coding = DCM#111040 "Original Source"

* instance ^slicing.discriminator.type = #value
* instance ^slicing.discriminator.path = "sopClass"
* instance ^slicing.rules = #open
* instance ^slicing.ordered = false
* instance ^slicing.description = "Structured Report Instance"

* instance 1..1 MS

* instance contains srBasicInstance 0..1
* instance[srBasicInstance].sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.88.11 "Basic Text SR Storage"
* instance[srBasicInstance].uid 1..1
* instance[srBasicInstance] ^short = "Basic Text SR SOP Instance UID"
* instance[srBasicInstance].subset 1..1 MS

* instance contains srEnhancedInstance 0..1
* instance[srEnhancedInstance].sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.88.22 "Enhanced SR Storage"
* instance[srEnhancedInstance].uid 1..1
* instance[srEnhancedInstance] ^short = "Enhanced SR SOP Instance UID"
* instance[srEnhancedInstance].subset 1..1 MS

* instance contains srComprehensiveInstance 0..1
* instance[srComprehensiveInstance].sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.88.33 "Comprehensive SR Storage"
* instance[srComprehensiveInstance].uid 1..1
* instance[srComprehensiveInstance] ^short = "Comprehensive SR SOP Instance UID"
* instance[srComprehensiveInstance].subset 1..1 MS

* instance contains sr3DComprehensiveInstance 0..1
* instance[sr3DComprehensiveInstance].sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.88.34 "Comprehensive 3D SR Storage"
* instance[sr3DComprehensiveInstance].uid 1..1
* instance[sr3DComprehensiveInstance] ^short = "Comprehensive 3D SR SOP Instance UID"
* instance[sr3DComprehensiveInstance].subset 1..1 MS

Mapping: dicom-sr-instance-for-SourceSRContentItemProfile
Id: dicom-sr-for-source-sr-content-item
Title: "DICOM SR Instance Source SR Content Item"
Source: ImagingSelectionSourceSRContentItem
Target: "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.17.3.4.html#table_C.17-6"
Description: "The Source SR Content Item can be extracted from the general DICOM SR SOP Instance attributes and the Document Relationship Macro Attributes for the specific SR content item."
* -> "TID1411(Referenced Segment)"
* seriesUid -> "tag(0020,000E) [Series Instance UID]"
* instance[srBasicInstance].uid -> "tag(0008,0018) [SOP Instance UID]"
* instance[srBasicInstance].subset -> "tag(0040,A171) [Observation UID]"
* instance[srEnhancedInstance].uid -> "tag(0008,0018) [SOP Instance UID]"
* instance[srEnhancedInstance].subset -> "tag(0040,A171) [Observation UID]"
* instance[srComprehensiveInstance].uid -> "tag(0008,0018) [SOP Instance UID]"
* instance[srComprehensiveInstance].subset -> "tag(0040,A171) [Observation UID]"
* instance[sr3DComprehensiveInstance].uid -> "tag(0008,0018) [SOP Instance UID]"
* instance[sr3DComprehensiveInstance].subset -> "tag(0040,A171) [Observation UID]"

Instance: Example-ImagingSelection-SourceSRContentItem
InstanceOf: ImagingSelectionSourceSRContentItem
Usage: #example
Description: "An example of a selected source node in a DICOM SR instance."

* id = "measurement-report-source-sr-content-item"

* subject = Reference(Example-Patient)
* derivedFrom = Reference(Example-ImagingStudy)
* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #111040 "Original Source"
* seriesUid = "1.2.840.113747.20080222.83341314456631405221767081790268995.10"
* instance[sr3DComprehensiveInstance]
  * uid = "1.2.840.113747.20080222.83341314456631405221767081790268995.10.1"
  * sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5#1.2.840.10008.5.1.4.1.1.88.34 "Comprehensive 3D SR Storage"
  * subset = "1.2.840.113747.20080222.83341314456631405221767081790268995.10.1.1"
* text
  * status = #generated
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">
  <pre>
{
   \"0040A010\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINS\" ] },
   \"0040A040\": { \"vr\": \"CS\", \"Value\": [ \"CONTAINER\" ] },
   \"0040A043\": { \"vr\": \"SQ\", \"Value\": [ {
         \"00080100\": { \"vr\": \"SH\", \"Value\": [ \"125007\" ] },
         \"00080102\": { \"vr\": \"SH\", \"Value\": [ \"DCM\" ] },
         \"00080104\": { \"vr\": \"LO\", \"Value\": [ \"Measurement Group\" ] }
       } ] },
   \"0040A050\": { \"vr\": \"CS\", \"Value\": [ \"SEPARATE\" ] },
   \"0040A504\": { \"vr\": \"SQ\", \"Value\": [ {
         \"00080105\": { \"vr\": \"CS\", \"Value\": [ \"DCMR\" ] },
         \"00080118\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.10008.8.1.1\" ] },
         \"0040DB00\": { \"vr\": \"CS\", \"Value\": [ \"1411\" ] }
       } ] },
   \"0040A171\": { \"vr\": \"UI\", \"Value\": [ \"1.2.840.113747.20080222.83341314456631405221767081790268995.10.1.1\" ] }
   ...
}
  </pre></div>"