### Introduction

This implementation guide defines the Belgian FHIR profiles for **Patient Dossier CareSets** — standardized sets of clinical data that are specific to an individual patient and commonly used across care settings, without being transversal in nature.

A **CareSet** is a structured collection of clinical information designed for secure, standardized exchange between healthcare actors via the national eHealth infrastructure (Hubs & Vaults). Each CareSet defines a logical model, value sets, and business rules that ensure data can be shared, stored, and consulted in a traceable and reusable manner within integrated patient care.

The Patient Dossier CareSets cover clinical domains that are **patient-centric** — they capture data recorded in the context of a specific patient's care journey. This distinguishes them from transversal resources (e.g. terminology, practitioner registries) that are shared across patients and contexts.

### Scope

This guide covers the following Patient Dossier resources:

| Resource | Description | Status |
|---|---|---|
| [BeDocument (Logical Model)](StructureDefinition-BeModelDocument.html) | Generic logical model for a FHIR document that structures and contains CareSets | Active |
| [BeDocument (Bundle Profile)](StructureDefinition-be-document.html) | Minimal document Bundle profile constraining the FHIR Bundle to a document containing a Composition and CareSet entries | Active |
| [BeEpisodeOfCare (Logical Model)](StructureDefinition-be-model-episode-of-care.html) | Logical model of the EpisodeOfCare CareSet — a period during which care related to a specific problem is provided to a patient by one or more providers or organizations | Draft |
| [BeEpisodeOfCare (Profile)](StructureDefinition-be-episode-of-care.html) | EpisodeOfCare profile realising the logical model, using Belgian eHealth Federal Core profiles and extensions | Draft |

The **BeDocument** provides the generic envelope and structure for clinical documents. It does not contain clinical data itself but references and organises other CareSets into a meaningful, shareable, and traceable document. Examples include discharge summaries, referral letters, surgical reports, and consultation reports.

The **BeEpisodeOfCare** groups the care given to a patient over a period for one main problem, recording who is responsible for its content, which organization manages and coordinates it, and which care teams take part.

### Content

This implementation guide contains the following types of resources:

- **Logical Models** — conceptual representations defining data elements, cardinalities, and descriptions independent of any specific FHIR resource. The [BeDocument logical model](StructureDefinition-BeModelDocument.html) describes the document structure with sections, entries, and metadata; the [BeEpisodeOfCare logical model](StructureDefinition-be-model-episode-of-care.html) describes the EpisodeOfCare CareSet.
- **Profiles** — FHIR resource profiles constraining base resources to the Belgian context. The [BeDocument Bundle profile](StructureDefinition-be-document.html) constrains the FHIR Bundle to a document type containing a Composition and CareSet entries; the [BeEpisodeOfCare profile](StructureDefinition-be-episode-of-care.html) constrains EpisodeOfCare.
- **Extensions** — local extensions for CareSet elements that have no native equivalent on the R4 resources and no existing eHealth Federal Core extension.
- **Value Sets** — coded value sets used within the CareSets, primarily based on SNOMED CT, LOINC, and FHIR standard code systems.

### How to Read This Guide

- The **[Guidance](guidance.html)** page provides context on the methodology, conventions, and design principles used throughout this guide.
- The **[Artifacts](artifacts.html)** page lists all profiles, extensions, and value sets defined in this guide.

### Dependencies

This guide builds on:
- [HL7 Belgium FHIR Core](https://www.ehealth.fgov.be/standards/fhir/core) — foundational Belgian FHIR resources and extensions (e.g. Belgian Patient, Practitioner, Organization identifiers).

### Authors and Contributors

This guide is published by the **eHealth Platform** as part of the **BeSafeShare** programme. For questions or feedback, contact [message-structure@ehealth.fgov.be](mailto:message-structure@ehealth.fgov.be).

{% lang-fragment cross-version-analysis-inline.xhtml %}
 
 
{% lang-fragment globals-table.xhtml %}


{% lang-fragment expansion-params.xhtml %}


{% lang-fragment dependency-table-short.xhtml %}


{% lang-fragment ip-statements.xhtml %}