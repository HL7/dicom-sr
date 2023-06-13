Instance:       DICOM-Document-IE-to-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - DICOM Document IE to FHIR Mapping"
Usage: #definition

* id =  "ConceptMap-dicom-document-ie-to-fhir"
* description = "Mapping between DICOM Document IE and FHIR Resources"
// * url = http://hl7.org/fhir/uv/dicom-sr/dicom-document-ie-to-fhir
* status = #draft
* sourceScopeUri = "DICOM-Document"
* targetScopeUri = "Observation"

// Document General Module
* group.element[0]
  * code = #DICOM.Document.General
  * display = "Document General Module"
  * target
    * relationship = #not-related-to

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
  * display = "Preliminary Flag (0040,A496) -- PSN"
  * target
    * relationship = #equivalent
    * code = #performer
    * display = "performer"
    * dependsOn[0]
      * property = "DICOM.ParticipantSequence.ObserverType"
      * valueCode = #PSN
    * dependsOn[1]
      * property = "macro-map"
      * valueUri = "identified-person-or-device"

* group.element[3]
  * code = #DICOM.ParticipantSequence-Device
  * display = "Preliminary Flag (0040,A496) -- DEV"
  * target
    * relationship = #equivalent
    * code = #Device[1]
    * display = "Device[1]"
    * dependsOn[0]
      * property = "DICOM.ParticipantSequence.ObserverType"
      * valueCode = #DEV
    * dependsOn[1]
      * property = "macro-map"
      * valueUri = "identified-person-or-device"
    * comment = "If this device matches the Equipment IE device an additional device resource does not need to be created."

// Document Content Module
* group.element[4]
  * code = #DICOM.Document.Content
  * display = "Document Content Module"
  * target.relationship = #not-related-to

// Observation DateTime (0040,A032)
* group.element[5]
  * code = #DICOM.ObservationDateTime
  * display = "Observation DateTime (0040,A032)"
  * target
    * relationship = #equivalent
    * code = #issued
    * display = "issued"
    * comment = "DICOM DateTime format shall be converted to FHIR instant format."

// Observation UID (0040,A171)
* group.element[6]
  * code = #DICOM.ObservationUID
  * display = "Observation UID (0040,A171)"
  * target
    * relationship = #equivalent
    * code = #identifier[1]
    * display = "identifier[1]"
    * dependsOn[0]
      * property = "type"
      * valueCoding = DCMIdType#observation-uid "Observation UID"
    * dependsOn[1]
      * property = "system"
      * valueUri = "urn:dicom:uid"

// Content Sequence (0040,A730)
* group.element[7]
  * code = #DICOM.ContentSequence.ImagingMeasurements
  * display = "Content Sequence (0040,A730) -- Imaging Measurements"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence"
      * valueCoding = DCM#126010 "Imaging Measurements"
    * dependsOn[1]
      * property = "content-map"
      * valueUri = "dicom-imaging-measurement-group"

// Content Sequence (0040,A730)
* group.element[8]
  * code = #DICOM.ContentSequence.DerivedImagingMeasurements
  * display = "Content Sequence (0040,A730) -- Derived Imaging Measurements"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence"
      * valueCoding = DCM#126011 "Derived Imaging Measurements"
    * dependsOn[1]
      * property = "content-map"
      * valueUri = "dicom-derived-imaging-measurements"

// Content Sequence (0040,A730)
* group.element[9]
  * code = #DICOM.ContentSequence.QualitativeEvaluations
  * display = "Content Sequence (0040,A730) -- Qualitative Evaluations"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence"
      * valueCoding = http://terminology.hl7.org/NamingSystem/umls#C0034375 "Qualitative Evaluations"
    * dependsOn[1]
      * property = "content-map"
      * valueUri = "dicom-qualitative-evaluations"