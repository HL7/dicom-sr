Instance:       DICOM-Imaging-Measurement-Group-to-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - DICOM Imaging Measurement Group to FHIR Mapping"
Usage:          #definition

* id =  "dicom-imaging-measurement-group-to-fhir"
* name = "DICOMImagingMeasurementGroupToFHIRMapping"
* description = "Mapping between DICOM Imaging Measurement Group and FHIR Resources"
* status = #draft
* experimental = true
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCode = #ii
* sourceScopeUri = "DICOM-Document"
* targetScopeUri = "Observation"

// Additional Attributes used in concept map
* additionalAttribute[0]
  * code = #OverserverType
  * description = "DICOM.ParticipantSequence.ObserverType"
  * uri = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.17.2.4.html#table_C.17-3b"
  * type = #code

* additionalAttribute[1]
  * code = #DICOMUIDType
  * description = "DICOM UID Type"
  * type = #Coding

* additionalAttribute[2]
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
* property[2]
  * code = #system
  * type = #string

// Document General Module
* group.element[0]
  * code = #DICOM.Document.General
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
  * display = "Preliminary Flag (0040,A496) -- PSN"
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
  * display = "Preliminary Flag (0040,A496) -- DEV"
  * target
    * relationship = #equivalent
    * code = #Device[1]
    * display = "Device[1]"
    * comment = "If this device matches the Equipment IE device an additional device resource does not need to be created."
    * dependsOn[0]
      * attribute = #OverserverType
      * valueCode = #DEV
    * property[0]
      * code = #macro-map
      * valueString = "identified-person-or-device"      

// Document Content Module
* group.element[4]
  * code = #DICOM.Document.Content
  * display = "Document Content Module"
  * noMap = true

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
      * attribute = #DICOMUIDType
      * valueCoding = DCMIdType#observation-uid "Observation UID"
    * property[0]
      * code = #system
      * valueString = "urn:dicom:uid"      

// Content Sequence (0040,A730)
* group.element[7]
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

// Content Sequence (0040,A730)
* group.element[8]
  * code = #DICOM.ContentSequence.DerivedImagingMeasurements
  * display = "Content Sequence (0040,A730) -- Derived Imaging Measurements"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * dependsOn[0]
      * attribute = #DICOMConceptNameCodeSequence
      * valueCoding = DCM#126011 "Derived Imaging Measurements"
    * property[0]
      * code = #content-map
      * valueString = "dicom-derived-imaging-measurements"           

// Content Sequence (0040,A730)
* group.element[9]
  * code = #DICOM.ContentSequence.QualitativeEvaluations
  * display = "Content Sequence (0040,A730) -- Qualitative Evaluations"
  * target
    * relationship = #source-is-narrower-than-target
    * code = #Observation[1]
    * display = "Observation[1]"
    * dependsOn[0]
      * attribute = #DICOMConceptNameCodeSequence
      * valueCoding = http://terminology.hl7.org/NamingSystem/umls#C0034375 "Qualitative Evaluations"
    * property[0]
      * code = #content-map
      * valueString = "dicom-qualitative-evaluations"           

