Instance:       DICOM-Imaging-Measurement-Group-to-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - DICOM Imaging Measurement Group to FHIR Mapping"
Usage: #definition

* id = "dicom-imaging-measurement-group-to-fhir"
* name = "DICOMImagingMeasurementGroupToFHIRMapping"
* description = "Mapping between DICOM Imaging Measurement Group and FHIR Resources"
* status = #active
* experimental = false
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCoding = #ii
* sourceScopeUri = "DICOM-Imaging-Measurement-Group"
* targetScopeUri = "Bundle"

* additionalAttribute[0]
  * code = #IdentifierType
  * description = "DICOM Identifier Type"
  * uri = "http://dicom.nema.org/resources/ontology/DCM"
  * type = #Coding

* additionalAttribute[1]
  * code = #ValueType
  * description = "DICOM Value Type"
  * uri = "http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type"
  * type = #Coding

* group[0].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#112039
  * display = "Tracking Identifier"
  * target[0]
    * relationship = #equivalent
    * code = #identifier
    * display = "BodyStructureTrackingIdentifiers.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://dicom.nema.org/resources/ontology/DCM#112039
  * target[1]
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingMeasurementGroup.focus.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://dicom.nema.org/resources/ontology/DCM#112039

* group[0].element[1]
  * code = http://dicom.nema.org/resources/ontology/DCM#112040
  * display = "Tracking Unique Identifier"
  * target[0]
    * relationship = #equivalent
    * code = #identifier
    * display = "BodyStructureTrackingIdentifiers.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://dicom.nema.org/resources/ontology/DCM#112040
  * target[1]
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingMeasurementGroup.focus.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://dicom.nema.org/resources/ontology/DCM#112040

* group[1].element[0]
  * code = http://snomed.info/sct#276214006
  * display = "Finding Category"
  * target
    * relationship = #equivalent
    * code = #code
    * display = "ImagingMeasurementGroup.code"

* group[2].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#121071
  * display = "Finding"
  * target
    * relationship = #equivalent
    * code = #valueCodingableConcept
    * display = "ImagingMeasurementGroup.valueCodingableConcept"

* group[3].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#111030
  * display = "Image Region"
  * target[0]
    * relationship = #equivalent
    * code = #ImagingSelection2dImageRegion
    * display = "ImagingSelection2dImageRegion"
    * dependsOn[0]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#scoord
  * target[1]
    * relationship = #equivalent
    * code = #ImagingSelection3dImageRegion
    * display = "ImagingSelection3dImageRegion"
    * dependsOn[0]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#scoord3d
  * target[2]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[4].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#121214
  * display = "Referenced Segmentation Frame"
  * target[0]
    * relationship = #equivalent
    * code = #ImagingSelectionReferencedSegmentationFrame
    * display = "ImagingSelectionReferencedSegmentationFrame"
  * target[1]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[5].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#130488
  * display = "Region in Space"
  * target[0]
    * relationship = #equivalent
    * code = #ImagingSelectionRegionInSpace
    * display = "ImagingSelectionRegionInSpace"
  * target[1]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[6].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#121200
  * display = "Illustration of ROI"
  * target[0]
    * relationship = #equivalent
    * code = #ImagingSelectionIllustrationOfROI
    * display = "ImagingSelectionIllustrationOfROI"
  * target[1]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[7].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#130401
  * display = "Visual explanation"
  * target[0]
    * relationship = #equivalent
    * code = #ImagingSelectionVisualExplanation
    * display = "ImagingSelectionVisualExplanation"
  * target[1]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[8].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#126100
  * display = "Real World Value Map used for measurement"
  * target[0]
    * relationship = #equivalent
    * code = #ImagingSelectionRealWorldValueMap
    * display = "ImagingSelectionRealWorldValueMap"
  * target[1]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[9].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#121191
  * display = "Referenced Segment"
  * target[0]
    * relationship = #equivalent
    * code = #ImagingSelectionReferencedSegment
    * display = "ImagingSelectionReferencedSegment"
  * target[1]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[10].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#121231
  * display = "Volume Surface"
  * target[0]
    * relationship = #equivalent
    * code = #ImagingSelectionVolumeSurface
    * display = "ImagingSelectionVolumeSurface"
  * target[1]
    * relationship = #equivalent
    * code = #focus
    * display = "ImagingMeasurementGroup.focus"

* group[11].element[0]
  * code = http://snomed.info/sct#370129005
  * display = "Measurement Method"
  * target
    * relationship = #equivalent
    * code = #method
    * display = "ImagingMeasurementGroup.method"

* group[12].element[0]
  * code = http://snomed.info/sct#363698007
  * display = "Finding Site"
  * target[0]
    * relationship = #equivalent
    * code = #BodyStructureFindingSite
    * display = "BodyStructureFindingSite"
  * target[1]
    * relationship = #equivalent
    * code = #bodyStructure
    * display = "ImagingMeasurementGroup.bodyStructure"

* group[13].element[0]
  * code = http://dicom.nema.org/resources/ontology/DCM#TID4019
  * display = "Algorithm Identification"
  * target[0]
    * relationship = #equivalent
    * code = #AlgrithmIdentification
    * display = "AlgorithmIdentification"
    * comment = "Content from the Algorithm Identification template will be used to create a FHIR AlgorithmIdentification Device."
  * target[0]
    * relationship = #equivalent
    * code = #device
    * display = "ImagingMeasurementGroup.device"

* group[14].element[0]
  * code = http://terminology.hl7.org/CodeSystem/umls#C0034375
  * display = "Qualitative Evaluations"
  * target[0]
    * relationship = #equivalent
    * code = #ImagingMeasurement
    * display = "ImagingMeasurement"
    * comment = "Select children of the Imaging Measurement Group container will be used to create a FHIR ImagingMeasurement Observation."
    * dependsOn[0]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#num
  * target[1]
    * relationship = #equivalent
    * code = #hasMember
    * display = "ImagingMeasurementGroup.hasMember"
    * dependsOn[0]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#num

* group[15].element[0]
  * code = http://terminology.hl7.org/CodeSystem/umls#C0034375
  * display = "Qualitative Evaluations"
  * target[0]
    * relationship = #equivalent
    * code = #ImagingQualitativeEvaluation
    * display = "ImagingQualitativeEvaluation"
    * comment = "Select children of the Imaging Measurement Group container will be used to create a FHIR ImagingQualitativeEvaluation Observation."
    * dependsOn[0]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#text
    * dependsOn[1]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#code
  * target[1]
    * relationship = #equivalent
    * code = #hasMember
    * display = "ImagingMeasurementGroup.hasMember"
    * dependsOn[0]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#text
    * dependsOn[1]
      * attribute = #ValueType
      * valueCoding = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-value-type#code