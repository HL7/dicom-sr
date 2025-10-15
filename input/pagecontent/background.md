This chapter describes the scope of this guide, provides background information, key concepts,
and describes the use cases supported by this implementation guide.

1. [Problem](#problem) - Description of the Problem
2. [Scope](#scope) - Scope of the IG
3. [Intended Readers](#intended-readers) - Intended readers of the IG
4. [Use cases](#use-cases) - Key use cases covered by the IG
5. [Excluded use cases](#excluded-use-cases) - Excluded use cases
6. [FHIR Version 4 compatibility](#fhir-version-4-compatibility) - Compatibility with FHIR R4
7. [Glossary](#glossary) - Glossary of terms used in this IG
8. [References](#references) - Useful references
9. [IG Dependencies](background.html#ig-dependencies) - Dependencies on other IGs
10. [Global Profiles](background.html#global-profiles) - Global profiles used in this IG
11. [Copyrights](background.html#copyrights) - Copyrights and acknowledgments

### Problem

DICOM® Structured Report (DICOM® SR) is a standard for recording clinical imaging observations made regarding a diagnostic or interventional imaging procedure. Imaging Observations are made by humans, such as a sonographer making measurements on recently acquired ultrasound image, a Radiologist recording observations on suspected lesions, or by a machine, such as an automated AI Algorithm providing qualitative and quantitative observations.

DICOM® SR is widely adopted by Imaging-based devices and IT systems. Healthcare IT Systems, generally, do not support DICOM® SR. Non-imaging healthcare systems support HL7 standards, such as FHIR. HL7 has defined the Observation resource as the standardized method for recording clinical observations. Bridging the two standards for clinical imaging observations is necessary for interoperability between these types of systems.

### Scope

The standards for recording clinical observations, DICOM® SR and HL7 FHIR Observation resource are bridged by this IG by the transformation of the DICOM SR attributes to the HL7 FHIR Observation Resource.

DICOM SR defines a multitude of templates for capturing Diagnostic imaging Observations. The input for this IG is limited to the DICOM SR template TID-1500 (Measurement Report).

The transformation described is one direction. It may not be possible to reconstruct a complete DICOM SR from a set of FHIR resources created based on this IG.

DICOM SR mapping is limited to the Observation Resource and a small set of related resources. The resultant mapping is provided, as a minimum, a composition or bundle of Observations. Depending on the use case, the observations may be part of or contained in a Diagnostic Report. Use case-specific requirements to construct a diagnostic report(e.g., Mammography) may require the transformation described by this IG. However, the specification of those use cases is not in scope for this IG.

Therefore, Observations created according to this IG may not include all context relevant to their interpretation.

### Intended Readers
This Implementation Guide is intended for

* clinical users of structured imaging data,
* implementers of other health information systems wishing to use imaging data encapsulated using DICOM SR.
* imaging device, image analysis and AI algorithm developers, and imaging gateway system developers creating DICOM SR.


### Use cases

#### Use case 1: Extracting imaging results for use in reporting
<figure>
  {% include dicom_sr_report_extraction.svg %}
  <figcaption><b>Figure: Use Case 1 Overview</b></figcaption>
  <p></p>
</figure>
#### Use case 2: Extracting imaging results for FHIRcast content sharing
<figure>
  {% include fhircast_content_sharing.svg %}
  <figcaption><b>Figure: Use Case 2 Overview</b></figcaption>
  <p></p>
</figure>
### Excluded use cases
The following use cases are not covered by this Implementation Guide:
* DICOM SR templates other than TID1500
* Creating a FHIR DiagnosticReport or Composition from a DICOM SR
* Creating HL7 v2 or v3 results from a DICOM SR

### FHIR Version 4 compatibility
This implementation guide is based on FHIR R5 and makes extensive use of the `ImagingSelection` resource, which is not present in FHIR R4.

However, the core mapping of DICOM SR to FHIR Observation resources is compatible with FHIR R4. 

The `ImagingSelection` resource is used to provide specific imaging context for imaging observations, but their exclusion should not affect the usability of the created observations to most downstream systems.

### Glossary

The following terms and acronyms are used within the DICOM SR IG:

| Term  | Definition                                     |
|-------|------------------------------------------------|
| AIR   | AI Results                                     |
| ATNA  | IHE Audit Trail and Node Authentication        |
| CID   | DICOM Context Identifier                       |
| DICOM | Digital Imaging and Communications in Medicine |
| DLP   | Dose Length Product                            |
| EHR   | Electronic Health Record                       |
| EMR   | Electronic Medical Record                      |
| FHIR  | Fast Healthcare Interoperability Resources     |
| HL7   | Health Level Seven                             |
| IG    | Implementation Guide                           |
| IE    | DICOM Information Entity                       |
| IHE   | Integrating the Healthcare Enterprise          |
| IOD   | DICOM Information Object Definition            |
| RIS   | Radiology Information System                   |
| SR    | Structured Report                              |
| TID   | DICOM Template ID                              |
| TLS   | Transport Layer Security                       |
| UID   | Unique identifier                              |
| URL   | Uniform Resource Locator                       |
| URN   | Uniform Resource Name                          |

### References

1. DICOM,[DICOM PS3.16: Content Mapping Resource](http://dicom.nema.org/medical/dicom/current/output/chtml/part16/PS3.16.html)
2. DICOM,[TID 1500\. Measurement Report](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1500)
3. IHE Radiology (RAD), [Technical Framework Supplement, AI Results (AIR)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIR.pdf)
4. D. Clunie, [DICOM Structured Reporting](http://www.pixelmed.com/srbook.html)

### IG Dependencies

This IG Contains the following dependencies on other IGs.

### Global Profiles



### Copyrights

{% capture ip-statement %}{% include ip-statements.xhtml %}{% endcapture %}

{{ ip-statement | remove: '<p>' | remove: '</p>'}}