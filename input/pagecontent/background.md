This chapter describes the scope of this guide, provides background information, key concepts,
and describes the use cases supported by this implementation guide.

1. [Problem](#Problem) - Description of the Problem
2. [Scope](#scope) - Scope of the IG
3. [Intended Readers](#readers) - Intended readers of the IG
4. [Use cases](#usecases) - Key use cases covered by the IG
5. [Glossary](#glossary) - Glossary of terms used in this IG
6. [References](#references) - Useful references

<a name="Problem"></a>

### Problem

![Problem](./Problem.svg){: width="800px"}

<br clear="all" />

DICOM Structured Report (DICOM SR) is a standard for recording clinical imaging observations made regarding a diagnostic or interventional imaging procedure. Imaging Observations are made by humans, such as a sonographer making measurements on recently acquired ultrasound image, a Radiologist recording observations on suspected lesions, or by a machine, such as an automated AI Algorithm providing qualitative and quantitative observations.

DICOM SR is widely adopted by Imaging-based devices and IT systems. Non-imaging based Healthcare IT Systems, generally, do not support DICOM SR. Non-imaging healthcare systems support HL7 standards, such as FHIR. HL7 has defined Observations as the standardized method for recording clinical observations. Bridging the two standards for clinical imaging observations is necessary for interoperability between these type of systems.

<a name="scope"></a>

### Scope

The standards for recording clinical observations, DICOM SR and HL7 FHIR Observation resource are bridged by this IG by the transformation of the DICOM SR attributes to the HL7 FHIR Observation Resource.

DICOM SR defines a multitude of templates for capturing Diagnostic imaging Observations.  The input for this IG is limited to the DICOM SR template TID-1500 (Measurement Report).  The mapping is limited the content within the tree structure.

The transformation described is one direction.  Reconstruction of a complete DICOM SR is not expected to be re-constructed from a set of FHIR resources using this IG.

DICOM SR mapping is limited to the Observation Resource.  The resultant mapping is provided, as a minimum, a composition or bundle of Observations.  Depending on the use case, the observations may be a Diagnostic Report. Use case-specific requirements to construct a diagnostic report(e.g. Mammography) may require the transformation described by this IG.  However the specification of those use cases is not in scope for this IG.

<a name="readers"></a>

### Intended Readers
This Implementation Guide is intended for

* clinical users of structured imaging data,
* implementers of other health information systems wishing to use imaging data encapsulated using DICOM SR.
* imaging device, image analysis and AI algorithm developers and imaging gateway system developers creating DICOM SR.

<a name="usecases"></a>

### Use cases
X use cases were identified.

#### Use case 1: 

<a name="glossary"></a>

### Glossary

The following terms and acronyms are used within the Radiation Dose Summary IG:

|Term|Definition|
|-----|-----------------|
|AIR| AI Results |
|ATNA| Audit Trail and Node Authentication |
|DICOM| Digital Imaging and Communications in Medicine |
|DLP| Dose Length Product |
|EHR| Electronic Health Record |
|EMR| Electronic Medical Record |
|FHIR| Fast Healthcare Interoperability Resources |
|HL7| Health Level Seven|
|IG| Implementation Guide |
|IHE| Integrating the Healthcare Enterprise |
|IOD| Information Object Definition |
|RIS| Radiology Information System |
|SR| Structured Report |
|TID| Template ID |
|TLS| Transport Layer Security |
|UID| Unique identifier |
|URL| Uniform Resource Locator |
|URN| Uniform Resource Name |
{:.table-striped .table-bordered}

<a name="references"></a>

### References

1. DICOM, [DICOM PS3.16: Content Mapping Resource](http://dicom.nema.org/medical/dicom/current/output/chtml/part16/PS3.16.html){:target="_blank"}
2. DICOM, [TID 1500\. Measurement Report](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_A.html#sect_TID_1500){:target="_blank"}
3. IHE Radiology (RAD), [Technical Framework Supplement, AI Results (AIR)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIR.pdf){:target="_blank"}
