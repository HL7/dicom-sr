Instance:       DICOM-Imaging-Measurement-Group-to-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - DICOM Imaging Measurement Group to FHIR Mapping"
Usage: #definition

* id = "dicom-imaging-measurement-group-to-fhir"
* name = "DICOMImagingMeasurementGroupToFHIRMapping"
* description = "Mapping between DICOM® Imaging Measurement Group and FHIR Resources"
* status = #active
* experimental = false
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCoding = #ii
// * sourceScopeUri = "DICOM-Imaging-Measurement-Group"
* targetScopeUri = "http://hl7.org/fhir/ValueSet/resource-types#Bundle"

* additionalAttribute[+]
  * code = #IdentifierType
  * description = "DICOM® Controlled Terminology"
  * uri = "http://dicom.nema.org/resources/ontology/DCM"
  * type = #Coding

* additionalAttribute[+]
  * code = #ValueType
  * description = "DICOM® Value Type"
  * uri = "http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type"
  * type = #Coding

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#112039
  * display = "Tracking Identifier"
  * target[+]
    * relationship = #equivalent
    * code = #identifier
    * display = "BodyStructureTrackingIdentifiers.identifier"
    * dependsOn[+]
      * attribute = #IdentifierType
      * valueCoding = http://dicom.nema.org/resources/ontology/DCM#112039
  * target[+]
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingMeasurementGroup.focus.identifier"
    * dependsOn[+]
      * attribute = #IdentifierType
      * valueCoding = http://dicom.nema.org/resources/ontology/DCM#112039

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#112040
  * display = "Tracking Unique Identifier"
  * target[+]
    * relationship = #equivalent
    * code = #identifier
    * display = "BodyStructureTrackingIdentifiers.identifier"
    * dependsOn[+]
      * attribute = #IdentifierType
      * valueCoding = http://dicom.nema.org/resources/ontology/DCM#112040
  * target[+]
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingMeasurementGroup.focus.identifier"
    * dependsOn[+]
      * attribute = #IdentifierType
      * valueCoding = http://dicom.nema.org/resources/ontology/DCM#112040

* group[+].element[+]
  * code = http://snomed.info/sct#276214006
  * display = "Finding Category"
  * target
    * relationship = #equivalent
    * code = #code
    * display = "ImagingMeasurementGroup.code"

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#121071
  * display = "Finding"
  * target
    * relationship = #equivalent
    * code = #valueCodeableConcept
    * display = "ImagingMeasurementGroup.valueCodeableConcept"

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#111030
  * display = "Image Region"
  * target[+]
    * relationship = #equivalent
    * code = #ImagingSelection2dImageRegion
    * display = "ImagingSelection2dImageRegion"
    * dependsOn[+]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#scoord
  * target[+]
    * relationship = #equivalent
    * code = #ImagingSelection3dImageRegion
    * display = "ImagingSelection3dImageRegion"
    * dependsOn[+]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#scoord3d
  * target[+]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#121214
  * display = "Referenced Segmentation Frame"
  * target[+]
    * relationship = #equivalent
    * code = #ImagingSelectionReferencedSegmentationFrame
    * display = "ImagingSelectionReferencedSegmentationFrame"
  * target[+]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#130488
  * display = "Region in Space"
  * target[+]
    * relationship = #equivalent
    * code = #ImagingSelectionRegionInSpace
    * display = "ImagingSelectionRegionInSpace"
  * target[+1]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#121200
  * display = "Illustration of ROI"
  * target[+]
    * relationship = #equivalent
    * code = #ImagingSelectionIllustrationOfROI
    * display = "ImagingSelectionIllustrationOfROI"
  * target[+]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#130401
  * display = "Visual explanation"
  * target[+]
    * relationship = #equivalent
    * code = #ImagingSelectionVisualExplanation
    * display = "ImagingSelectionVisualExplanation"
  * target[+]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#126100
  * display = "Real World Value Map used for measurement"
  * target[+]
    * relationship = #equivalent
    * code = #ImagingSelectionRealWorldValueMap
    * display = "ImagingSelectionRealWorldValueMap"
  * target[+]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#121191
  * display = "Referenced Segment"
  * target[+]
    * relationship = #equivalent
    * code = #ImagingSelectionReferencedSegment
    * display = "ImagingSelectionReferencedSegment"
  * target[+]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#121231
  * display = "Volume Surface"
  * target[+]
    * relationship = #equivalent
    * code = #ImagingSelectionVolumeSurface
    * display = "ImagingSelectionVolumeSurface"
  * target[+]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[+].element[+]
  * code = http://snomed.info/sct#370129005
  * display = "Measurement Method"
  * target
    * relationship = #equivalent
    * code = #method
    * display = "ImagingMeasurementGroup.method"

* group[+].element[+]
  * code = http://snomed.info/sct#363698007
  * display = "Finding Site"
  * target[+]
    * relationship = #source-is-narrower-than-target
    * code = #BodyStructureFindingSite
    * display = "BodyStructureFindingSite"
  * target[+]
    * relationship = #equivalent
    * code = #bodyStructure
    * display = "ImagingMeasurementGroup.bodyStructure"
* group[=].element[+]
  * code = http://snomed.info/sct#272741003
  * display = "Laterality"
  * target[+]
    * relationship = #source-is-narrower-than-target
    * code = #BodyStructureFindingSite
    * display = "BodyStructureFindingSite"
  * target[+]
    * relationship = #source-is-narrower-than-target
    * code = #bodyStructure
    * display = "ImagingMeasurementGroup.bodyStructure"
* group[=].element[+]
  * code = http://snomed.info/sct#106233006
  * display = "Topographical modifier"
  * target[+]
    * relationship = #source-is-narrower-than-target
    * code = #BodyStructureFindingSite
    * display = "BodyStructureFindingSite"
  * target[+]
    * relationship = #source-is-narrower-than-target
    * code = #bodyStructure
    * display = "ImagingMeasurementGroup.bodyStructure"

* group[+].element[+]
  * code = http://dicom.nema.org/resources/ontology/DCM#TID4019
  * display = "Algorithm Identification"
  * target[+]
    * relationship = #equivalent
    * code = #AlgrithmIdentification
    * display = "AlgorithmIdentification"
    * comment = "Content from the Algorithm Identification template will be used to create a FHIR AlgorithmIdentification Device."
  * target[+]
    * relationship = #equivalent
    * code = #device
    * display = "ImagingMeasurementGroup.device"

* group[+].element[+]
  * code = http://terminology.hl7.org/CodeSystem/umls#C0034375
  * display = "Qualitative Evaluations"
  * target[+]
    * relationship = #equivalent
    * code = #ImagingMeasurement
    * display = "ImagingMeasurement"
    * comment = "Select children of the Imaging Measurement Group container will be used to create a FHIR ImagingMeasurement Observation."
    * dependsOn[+]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#num
  * target[+]
    * relationship = #equivalent
    * code = #hasMember
    * display = "ImagingMeasurementGroup.hasMember"
    * dependsOn[+]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#num

* group[+].element[+]
  * code = http://terminology.hl7.org/CodeSystem/umls#C0034375
  * display = "Qualitative Evaluations"
  * target[+]
    * relationship = #equivalent
    * code = #ImagingQualitativeEvaluation
    * display = "ImagingQualitativeEvaluation"
    * comment = "Select children of the Imaging Measurement Group container will be used to create a FHIR ImagingQualitativeEvaluation Observation."
    * dependsOn[+]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#text
    * dependsOn[+]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#code
  * target[+]
    * relationship = #equivalent
    * code = #hasMember
    * display = "ImagingMeasurementGroup.hasMember"
    * dependsOn[+]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#text
    * dependsOn[+]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#code