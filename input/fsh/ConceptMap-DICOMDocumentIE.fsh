Instance:       DICOM-Document-IE-to-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - DICOM Document IE to FHIR Mapping"
Usage: #definition

* id =  "dicom-document-ie-to-fhir"
* name = "DICOMDocumentIEToFHIRMapping"
* description = "Mapping between DICOM Document IE and FHIR Resources"
* status = #active
* experimental = false
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCode = #ii
* sourceScopeUri = "DICOM-Document"
* targetScopeUri = "Bundle"

// Additional Attributes used in concept map
* additionalAttribute[0]
  * code = #OverserverType
  * description = "DICOM.ParticipantSequence.ObserverType"
  * uri = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.17.2.4.html#table_C.17-3b"
  * type = #code

* additionalAttribute[1]
  * code = #DICOMConceptNameCodeSequence
  * description = "DICOM Concept Name Code Sequence (0040,A043)"
  * uri = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.17.3.3.html#table_C.17-5"
  * type = #Coding

* property[0]
  * code = #macro-map
  * type = #string
* property[1]
  * code = #content-map
  * type = #string

// Document General Module
* group.element[0]
  * code = #DICOM.SR.Document.General
  * display = "Document General Module"
  * noMap = true

// Preliminary Flag (0040,A496)
* group.element[1]
  * code = #DICOM.PreliminaryFlag
  * display = "Preliminary Flag (0040,A496)"
  * target
    * relationship = #equivalent
    * code = #status
    * display = "status"
    * comment = "DICOM values shall be converted to lowercase. e.g. 'PRELIMINARY' to 'preliminary'."

// Participant Sequence (0040,A07A)
* group.element[2]
  * code = #DICOM.ParticipantSequence-Performer
  * display = "Participant Sequence (0040,A07A) -- PSN"
  * target
    * relationship = #equivalent
    * code = #performer
    * display = "performer"
    * dependsOn[0]
      * attribute = #OverserverType
      * valueCode = #PSN
    * property[0]
      * code = #macro-map
      * valueString = "identified-person-or-device"      

* group.element[3]
  * code = #DICOM.ParticipantSequence-Device
  * display = "Participant Sequence (0040,A07A) -- DEV"
  * target
    * relationship = #equivalent
    * code = #Device[1]
    * display = "Device[1]"
    * comment = "If this device matches the Equipment IE device an additional device resource does not need to be created."
    * property[0]
      * code = #macro-map
      * valueString = "identified-person-or-device"      
    * dependsOn[0]
      * attribute = #OverserverType
      * valueCode = #DEV

// Content Sequence (0040,A730)
* group.element[4]
  * code = #DICOM.ContentSequence.ImagingMeasurements
  * display = "Content Sequence (0040,A730) -- Imaging Measurements"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * dependsOn[0]
      * attribute = #DICOMConceptNameCodeSequence
      * valueCoding = DCM#126010 "Imaging Measurements"
    * property[0]
      * code = #content-map
      * valueString = "dicom-imaging-measurement-group"      
