### Introduction

This implementation guide defines the Belgian FHIR profiles for **Patient Dossier CareSets** — standardized sets of clinical data that are specific to an individual patient and commonly used across care settings, without being transversal in nature.

A **CareSet** is a structured collection of clinical information designed for secure, standardized exchange between healthcare actors via the national eHealth infrastructure (Hubs & Vaults). Each CareSet defines a logical model, value sets, and business rules that ensure data can be shared, stored, and consulted in a traceable and reusable manner within integrated patient care.

The Patient Dossier CareSets cover clinical domains that are **patient-centric** — they capture data recorded in the context of a specific patient's care journey. This distinguishes them from transversal resources (e.g. terminology, practitioner registries) that are shared across patients and contexts.

### Scope

This guide covers the following Patient Dossier CareSets:

| CareSet | Description | Status |
|---|---|---|
| [Medical Procedure](StructureDefinition-be-model-procedure.html) | Clinical procedures performed on or for a patient (surgical, diagnostic, therapeutic, nursing, etc.) | Active |
| Child Health Report | Health records specific to paediatric care and child development monitoring | Planned |

### Content

This implementation guide contains the following types of resources:

- **Logical Models** — conceptual representations of each CareSet, defining the data elements, cardinalities, and descriptions independent of any specific FHIR resource.
- **Profiles** — FHIR resource profiles constraining base resources (e.g. Procedure) to the Belgian context.
- **Value Sets** — coded value sets used within the CareSets, primarily based on SNOMED CT, LOINC, and FHIR standard code systems.
- **Business Rules** — rules governing data quality, consistency, and usage (e.g. date completeness, body site/laterality coherence, recorder identification).

### How to Read This Guide

- The **[Guidance](guidance.html)** page provides context on the methodology, conventions, and design principles used throughout this guide.
- The **[Artifacts](artifacts.html)** page lists all profiles, extensions, and value sets defined in this guide.
- Each CareSet section includes a conceptual model, a logical model with element descriptions, the associated value sets, and applicable business rules.

### Dependencies

This guide builds on the [HL7 Belgium FHIR Core](https://www.ehealth.fgov.be/standards/fhir/core) profiles, which define the foundational Belgian FHIR resources and extensions (e.g. Belgian Patient, Practitioner, Organization identifiers).

### Authors and Contributors

This guide is published by the **eHealth Platform** as part of the **BeSafeShare** programme. For questions or feedback, contact [message-structure@ehealth.fgov.be](mailto:message-structure@ehealth.fgov.be).