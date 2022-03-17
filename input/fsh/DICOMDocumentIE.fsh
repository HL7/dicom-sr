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
      * value = "PSN"
    * dependsOn[1]
      * property = "macro-map"
      * value = "identified-person-or-device"
* group.element[3]
  * code = #DICOM.ParticipantSequence-Device
  * display = "Preliminary Flag (0040,A496) -- DEV"
  * target
    * relationship = #equivalent
    * code = #Device[1]
    * display = "Device[1]"
    * dependsOn[0]
      * property = "DICOM.ParticipantSequence.ObserverType"
      * value = "DEV"
    * dependsOn[1]
      * property = "macro-map"
      * value = "identified-person-or-device"
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
* group.element[5]
  * code = #DICOM.ObservationUID
  * display = "Observation UID (0040,A171)"
  * target
    * relationship = #equivalent
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
  * code = #DICOM.ContentSequence.TID1410
  * display = "Content Sequence (0040,A730) -- TID 1410"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "DCM"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "DTID 1410"
    * dependsOn[2]
      * property = "content-map"
      * value = "tid-1410"

// Content Sequence (0040,A730)
* group.element[6]
  * code = #DICOM.ContentSequence.TID1410
  * display = "Content Sequence (0040,A730) -- Planar ROI Measurements and Qualitative Evaluations"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "DCM"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "DTID 1410"
    * dependsOn[2]
      * property = "content-map"
      * value = "dicom-dtid-1410"
* group.element[7]
  * code = #DICOM.ContentSequence.TID1411
  * display = "Content Sequence (0040,A730) -- Volumetric ROI Measurements and Qualitative Evaluations"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "DCM"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "DTID 1411"
    * dependsOn[2]
      * property = "content-map"
      * value = "dicom-dtid-1411"
* group.element[8]
  * code = #DICOM.ContentSequence.TID1420
  * display = "Content Sequence (0040,A730) -- Measurements Derived From Multiple ROI Measurements"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * comment = "A Derived Imaging Measurement may result in the creation of one or more Planar ROI Measurements or Volumetric ROI Measurements"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "DCM"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "DTID 1420"
    * dependsOn[2]
      * property = "content-map"
      * value = "dicom-dtid-1420"
* group.element[9]
  * code = #DICOM.ContentSequence.TID1501
  * display = "Content Sequence (0040,A730) -- Measurement and Qualitative Evaluation Group"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "DCM"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "DTID 1501"
    * dependsOn[2]
      * property = "content-map"
      * value = "dicom-dtid-1501"
* group.element[10]
  * code = #DICOM.ContentSequence.C0034375
  * display = "Content Sequence (0040,A730) -- Qualitative Evaluations"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * comment = "Each child item of this Content Sequence item will be mapped to its own FHIR Observation"
    * dependsOn[0]
      * property = "DICOM.ConceptNameCodeSequence.CodingSchemeDesignator"
      * value = "UMLS"
    * dependsOn[1]
      * property = "DICOM.ConceptNameCodeSequence.CodeValue"
      * value = "C0034375"
    * dependsOn[2]
      * property = "content-map"
      * value = "dicom-umls-c0034375"
