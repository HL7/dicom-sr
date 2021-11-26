Instance:       DICOM-Document-IE-to-FHIR
InstanceOf:     ConceptMap
Usage: #definition

* id =  "dicom-document-ie-to-fhir"
* description = "Mapping between DICOM Document IE and FHIR Resources"
// * url = http://hl7.org/fhir/uv/dicom-sr/dicom-document-ie-to-fhir
* status = #draft
* sourceUri = "DICOM-Document"
* targetUri = "Observation"

// Document General Module
* group.element[0]
  * code = #DICOM.Document.General
  * display = "Document General Module"
  * target.equivalence = #unmatched

// Preliminary Flag (0040,A496)
* group.element[1]
  * code = #DICOM.PreliminaryFlag
  * display = "Preliminary Flag (0040,A496)"
  * target
    * equivalence = #equivalent
    * code = #status
    * display = "status"
    * comment = "DICOM values shall be converted to lowercase. e.g. 'PRELIMINARY' to 'preliminary'."

// Participant Sequence (0040,A07A) -- Performer
* group.element[2]
  * code = #DICOM.ParticipantSequence-Performer
  * display = "Preliminary Flag (0040,A496) -- PSN"
  * target
    * equivalence = #equivalent
    * code = #performer
    * display = "performer"
    * dependsOn[0]
      * property = "DICOM.ParticipantSequence.ObserverType"
      * value = "PSN"
    * dependsOn[1]
      * property = "macro-map"
      * value = "identified-person-or-device"

// Participant Sequence (0040,A07A) -- Device
* group.element[3]
  * code = #DICOM.ParticipantSequence-Device
  * display = "Preliminary Flag (0040,A496) -- DEV"
  * target
    * equivalence = #equivalent
    * code = #performer
    * display = "performer"
    * dependsOn[0]
      * property = "DICOM.ParticipantSequence.ObserverType"
      * value = "DEV"
    * dependsOn[1]
      * property = "macro-map"
      * value = "identified-person-or-device"

// Document Content Module
* group.element[4]
  * code = #DICOM.Document.Content
  * display = "Document Content Module"
  * target.equivalence = #unmatched

// Observation DateTime (0040,A032)
* group.element[5]
  * code = #DICOM.ObservationDateTime
  * display = "Observation DateTime (0040,A032)"
  * target
    * equivalence = #equivalent
    * code = #issued
    * display = "issued"
    * comment = "DICOM DateTime format shall be converted to FHIR instant format."

// Observation UID (0040,A171)
* group.element[5]
  * code = #DICOM.ObservationUID
  * display = "Observation UID (0040,A171)"
  * target
    * equivalence = #equivalent
    * code = #identifier[1]
    * display = "identifier[1]"
    * dependsOn[0]
      * property = "type"
      * value = "DCMIdType#observation-uid 'Observation UID'"
    * dependsOn[1]
      * property = "system"
      * value = "urn:dicom:uid"

// Content Sequence (0040,A730)
* group.element[6]
  * code = #DICOM.ContentSequence
  * display = "Content Sequence (0040,A730)"
  * target
    * equivalence = #narrower
    * code = #issued
    * display = "issued"
    * comment = "DICOM DateTime format shall be converted to FHIR instant format."
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "DCM"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "DTID 1500"
    * dependsOn[2]
      * property = "tid-map"
      * value = "tid-1500"
